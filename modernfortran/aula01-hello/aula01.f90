!! --------------------------------------------
!! Como compilar o programa?
!! Digite no seu terminal, dentro do deretório 
!! com o arquivo salvo, o seguinte:
!! +===========================================+
!! |$   `gfortran aula01.f90`                  |
!! +===========================================+
!! Isso gerará um arquivo executável chamado 
!! 'a.out' no seu diretório atual. 
!! Para executá-lo, basta digitar no terminal:
!! +===========================================+
!! |$   `./a.out`                              |
!! +===========================================+
!! Para mudar o nome do arquivo executável 
!! 'a.out' para 'aula01', basta usar a flag `-o`
!! na hora da compilação:
!! +===========================================+
!! |$   `gfortran -o aula01 aula01.f90`        |
!! +===========================================+
!! e executar 
!! +===========================================+
!! |$   `./aula01`                             |
!! +===========================================+
!! ---------------------------------------------
program main 
  implicit none ! sempre use. Evita a declracão explicta de variáceis. Veja aula 02 e 13. 
  print *, "Olá Mundo!"
!       ⇧ 
!       + ⇨ Formatação: Veja aula 11 
end

! O "program" é análogo às função 'main' das linguagens C/C++/Rust/Go/Zig 

!Em C
!#include<stdio.h>
!int main(void) {
!  puts("Olá Mundo");
!}

!Em C++
!#include<iostream>
!int main(){
!  std::cout << "Olá mundo" << '\n';
!}

!Em Rust 
!fn main(){
!  println!("Olá Mundo");
!}

