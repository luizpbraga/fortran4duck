
trait Triangulo{
    fn area(self) -> f64;
}

struct Tri_eq {
    l: f64,
}
impl Triangulo for Tri_eq {
    fn area(self) -> f64 {
        std::f64::sqrt(3.0_f64) * self.l * self.l / 4.0_f64
    }
}

struct Tri_re {
    c1: f64,
    c2: f64,
    h: f64,
}
impl Triangulo for Tri_re {
    fn area(self) -> f64 {
        self.c1 * self.c2 / 2.0_f64
    }
}

//fn print_area(t: impl Triangulo) {
fn print_area<T: Triangulo>(t: T) {
    println!("{}", t.area())
}

fn main() {
   let t = Tri_re{ c1: 8.0, c2: 15.0, h: 17.0};
    print_area(t);
   let t = Tri_eq{ l: 12.0 };
    print_area(t);
}
