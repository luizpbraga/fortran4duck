package main

// Note que, comparado ao fortran, o codigo é muito 'limpo'.
import (
	"fmt"
	"math"
)

type f64 = float64

type Triangulo interface {
	area() f64
}

type Tri_re struct {
	c1, c2, h f64
}

func (t Tri_re) area() f64 {
	return t.c1 * t.c2 / 2.0
}

type Tri_eq struct {
	l f64
}

func (t Tri_eq) area() f64 {
	return math.Sqrt(3.0) * t.l * t.l / 4.0
}

func printArea(t Triangulo) {
	fmt.Println(t.area())
}

func main() {
	teq := Tri_eq{l: 12.0}
	printArea(teq)

	tre := Tri_re{c1: 8.0, c2: 15.0, h: 17.0}
	printArea(tre)
}
