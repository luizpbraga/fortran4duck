#include<stdlib.h>

extern int add(int a, int b){
  return a+b;
}

extern void swap(int* a, int* b){
  int t = *a;
  *a = *b;
  *b = t;
}

extern void init (int a[], int n){
  for (int i=0; i<n; ++i) a[i]=-i;
}
extern void initp (int *a, int n){
  for (int i=0; i<n; ++i) a[i]=-a[i];
}
extern void initp2 (int *x, int n){
  for (int i=0; i<n; ++i) *(x+i)=-100+i;
}

extern void arr_432(int arr[4][3][2], int d1, int d2, int d3){
  for (int i=0; i< d1; i++)
    for (int j=0; j< d2; j++)
      for (int k=0; k< d3; k++) arr[i][j][k] = 0;
}

// DERU RUIM:
//
// extern void arr_nxm(int n, int m, int * arr){
//   for (int i=0; i < n; i++)
//     for (int j=0; j < m; j++) 
//       *((arr+i*n)+j) = -1;
// }
// extern void arr_nxm2(int n, int m, int * arr){
//   for (int i=0; i < n*m; i++)
//       arr[i] = -99;
// }

extern void arrtest(int n,  int m, int **arr){
  // nao tive que mallocar nada ...
  // pointer sucks !!!!!
  // isso é mágica: (?)
  for (int i=0; i<n*m; i++){
      **arr=99;
      (*arr)++;
  }
}
extern void arrtest2(int n,  int m, int **arr){
  // infelizmente eu matei as aulas de C :/
  for (int i=0; i<n; i++)
    for (int j=0; j<m; j++)
      *arr[j] = -22;
    // nao funciona

}
extern void ppint(int ** p){
  *(*p) = 1;
}

