; NSIS Installer Script for Quadratic Formula Solver

!include "MUI2.nsh"

; ---- Version ----
!ifndef VERSION
    !define VERSION "0.1.0"
!endif

; ---- General ----
Name "Quadratic Formula Solver ${VERSION}"
OutFile "QuadraticFormulaSolver-Setup.exe"
InstallDir "$PROGRAMFILES\Quadratic Formula Solver"
InstallDirRegKey HKLM "Software\Quadratic Formula Solver" "InstallDir"
RequestExecutionLevel admin

; ---- Icon ----
!define MUI_ICON "icon.ico"
!define MUI_UNICON "icon.ico"

; ---- Interface Settings ----
!define MUI_ABORTWARNING

; ---- Pages ----
!insertmacro MUI_PAGE_WELCOME
!insertmacro MUI_PAGE_DIRECTORY
!insertmacro MUI_PAGE_INSTFILES
!insertmacro MUI_PAGE_FINISH

!insertmacro MUI_UNPAGE_CONFIRM
!insertmacro MUI_UNPAGE_INSTFILES

; ---- Language ----
!insertmacro MUI_LANGUAGE "English"

; ---- Install Section ----
Section "Install"
    SetOutPath "$INSTDIR"

    ; Install the application binary
    File "..\target\release\slint-test.exe"

    ; Install the icon
    File "icon.ico"

    ; Create uninstaller
    WriteUninstaller "$INSTDIR\Uninstall.exe"

    ; Start Menu shortcut
    CreateDirectory "$SMPROGRAMS\Quadratic Formula Solver"
    CreateShortCut "$SMPROGRAMS\Quadratic Formula Solver\Quadratic Formula Solver.lnk" \
        "$INSTDIR\slint-test.exe" "" "$INSTDIR\icon.ico"
    CreateShortCut "$SMPROGRAMS\Quadratic Formula Solver\Uninstall.lnk" \
        "$INSTDIR\Uninstall.exe"

    ; Add/Remove Programs registry entry
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "DisplayName" "Quadratic Formula Solver"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "UninstallString" '"$INSTDIR\Uninstall.exe"'
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "DisplayIcon" "$INSTDIR\icon.ico"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "Publisher" "Quadratic Formula Solver"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "InstallLocation" "$INSTDIR"
    WriteRegStr HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "DisplayVersion" "${VERSION}"
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "NoModify" 1
    WriteRegDWORD HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver" \
        "NoRepair" 1

    ; Save install directory
    WriteRegStr HKLM "Software\Quadratic Formula Solver" "InstallDir" "$INSTDIR"
SectionEnd

; ---- Uninstall Section ----
Section "Uninstall"
    ; Remove files
    Delete "$INSTDIR\slint-test.exe"
    Delete "$INSTDIR\icon.ico"
    Delete "$INSTDIR\Uninstall.exe"
    RMDir "$INSTDIR"

    ; Remove Start Menu shortcuts
    Delete "$SMPROGRAMS\Quadratic Formula Solver\Quadratic Formula Solver.lnk"
    Delete "$SMPROGRAMS\Quadratic Formula Solver\Uninstall.lnk"
    RMDir "$SMPROGRAMS\Quadratic Formula Solver"

    ; Remove registry keys
    DeleteRegKey HKLM "Software\Microsoft\Windows\CurrentVersion\Uninstall\QuadraticFormulaSolver"
    DeleteRegKey HKLM "Software\Quadratic Formula Solver"
SectionEnd
