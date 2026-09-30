fn f(x: f64, y: f64) -> f64 {
    x.powi(2) + 2.0 * y.powi(2) - 2.0 * x * y + 4.0 * x - 6.0 * y
}

fn gradient_f(x: f64, y: f64) -> [f64; 2] {
    let df_dx = 2.0 * x - 2.0 * y + 4.0;
    let df_dy = 4.0 * y - 2.0 * x - 6.0;

    [df_dx, df_dy]
}

fn main() {
    let point = [1.0, 2.0];

    let value = f(point[0], point[1]);
    let grad = gradient_f(point[0], point[1]);

    let magnitude = (grad[0].powi(2) + grad[1].powi(2)).sqrt();

    println!(
        "function value at ({:.0}, {:.0}): {:.2}",
        point[0], point[1], value
    );

    println!(
        "gradient at ({:.0}, {:.0}): [{:.2}, {:.2}]",
        point[0], point[1], grad[0], grad[0]
    );

    println!("Gradient magnitude: {:.2}", magnitude);
}
