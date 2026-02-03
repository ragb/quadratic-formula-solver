# Quadratic Formula Solver

A test project exploring [Slint](https://slint.dev/) UI accessibility features, built entirely using [Claude Code](https://claude.ai/claude-code).

The app solves quadratic equations (ax² + bx + c = 0), handling real roots, repeated roots, complex roots, linear equations, and degenerate cases. It serves as a testbed for evaluating Slint's accessibility support (ARIA roles, labels, descriptions) with screen readers on Windows.

## Building

```
cargo build --release
```

The binary is output to `target/release/slint-test.exe`.

## Building the Windows Installer

Requires [NSIS](https://nsis.sourceforge.io/) to be installed.

```
cargo build --release
"C:\Program Files (x86)\NSIS\makensis.exe" installer/installer.nsi
```

The installer is output to `installer/QuadraticFormulaSolver-Setup.exe`.

## Project Structure

```
src/main.rs          - Application logic and quadratic solver
ui/app.slint         - UI layout (Slint markup)
ui/icon.svg          - Application icon (SVG source)
build.rs             - Slint build script
installer/           - NSIS installer script and assets
```
