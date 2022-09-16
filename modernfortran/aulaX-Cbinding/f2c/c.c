#include <stdio.h>
#include <stdlib.h>

int main(void){
  // fortran 
  int add(int,int);
  int swap(int*,int*);
  int a=1, b=2, c;
  printf("a = %i, b= %i\n", a, b);
  c = add(a,b);
  printf("a + b = %i\n", c);
  swap(&a,&b);
  printf("a = %i b = %i\n", a, b);
  
  // c_int é ponteiro se intent(in) 
  // c_int é ref se value
  //
  int soma3(int*);
  
  int *dp;
  dp = (int*)malloc(sizeof(int)*3);
  c = soma3(dp); // 3
  printf("soma dos 3 primeiros: %i\n", c);
  
  int d[] = {1,2,3,4,5};
  c = soma3(d); // 3 
  printf("soma dos 3 primeiros: %i\n", c);

  void show(int*,int*,int*, int*);
  show(&a, &b, dp, d);
  printf("dp = {%i, %i, %i}\n", dp[0], dp[1], dp[2]);

  printf("%i", d[0]);
  printf("%i", d[1]);
  printf("%i", d[2]);
  printf("%i", d[3]);
  printf("%i\n", d[4]);

  void hm(int*, int*);
  int * f;
  int arr[3][2] = {1,2,3,4,5,6};
  hm(*arr, f);
  printf("%i\n", arr[0][0]);
  printf("%i\n", arr[1][0]);
  printf("%i\n", arr[2][0]);

}

