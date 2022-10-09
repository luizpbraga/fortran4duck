
use std::ops::Add;

struct Poli2<T=f32> {
    coef: [T;3]
}
// opt => some, none 
// result =>  

impl Poli2 { 
    fn root(&self) -> Result<(f32,f32), String> {
        
        let (a,b,c) = (self.coef[0], self.coef[1], self.coef[2]);
        let delta = b*b - a * c * 4.0; 
        let x1 = ( -b + delta.sqrt() ) / (a * 2.0);
        let x2 = ( -b - delta.sqrt() ) / (a * 2.0);
        
        if delta >= 0.0 {
            Ok((x1, x2))
        } else {
            Err(String::from("Complex Roots"))
        }
    }
}


impl Add for Poli2 {
    type Output = Poli2; 
    fn add(self, p: Poli2 ) -> Poli2 {
        Poli2{ 
            coef: [self.coef[0] + p.coef[0], self.coef[1] + p.coef[1], self.coef[2]] 
        }
    }
}

fn main(){

    let p1 = Poli2 { coef: [1.0,2.0,3.0]};
    let p2 = Poli2 { coef: [1.0,2.0,3.0]};
    let p3 = p1 + p2; 

    print!("{:?} ",p3.coef);

    let p0 = Poli2{ coef: [1.0, 0.0, -25.0]};
    print!("{:?}", p0.root().unwrap());

}
