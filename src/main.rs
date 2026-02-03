slint::include_modules!();

fn solve_quadratic(a: f64, b: f64, c: f64) -> String {
    if a == 0.0 {
        if b == 0.0 {
            return if c == 0.0 {
                "Infinite solutions (0 = 0).".to_string()
            } else {
                "No solution (equation is contradictory).".to_string()
            };
        }
        let x = -c / b;
        return format!("Linear equation. x = {x:.6}");
    }

    let discriminant = b * b - 4.0 * a * c;

    if discriminant > 0.0 {
        let sqrt_d = discriminant.sqrt();
        let x1 = (-b + sqrt_d) / (2.0 * a);
        let x2 = (-b - sqrt_d) / (2.0 * a);
        format!("Two real roots:\nx\u{2081} = {x1:.6}\nx\u{2082} = {x2:.6}")
    } else if discriminant == 0.0 {
        let x = -b / (2.0 * a);
        format!("One repeated root:\nx = {x:.6}")
    } else {
        let real = -b / (2.0 * a);
        let imag = (-discriminant).sqrt() / (2.0 * a);
        format!(
            "Two complex roots:\nx\u{2081} = {real:.6} + {imag:.6}i\nx\u{2082} = {real:.6} - {imag:.6}i"
        )
    }
}

fn main() {
    let app = App::new().unwrap();

    let weak = app.as_weak();
    app.on_solve(move || {
        let app = weak.unwrap();
        let a_str = app.get_a_value().to_string();
        let b_str = app.get_b_value().to_string();
        let c_str = app.get_c_value().to_string();

        let a = a_str.trim().parse::<f64>();
        let b = b_str.trim().parse::<f64>();
        let c = c_str.trim().parse::<f64>();

        let result = match (a, b, c) {
            (Ok(a), Ok(b), Ok(c)) => solve_quadratic(a, b, c),
            _ => "Please enter valid numbers for all coefficients.".to_string(),
        };

        app.set_result_text(result.into());
    });

    app.run().unwrap();
}
