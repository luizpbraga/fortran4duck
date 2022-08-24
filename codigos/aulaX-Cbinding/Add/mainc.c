#include <stdio.h>

typedef enum {
  Val,
  Ind,
} Prod;

typedef struct {
  char *name ;
  int age;
} People;

void foo(int *a) {
  for (int i=0; i<3; i++)
    printf("%i\n", a[i]);
}

int main(void){

  People p = {
    .name = "luiz",
    .age = 25,
  };

  printf("%s\n", p.name);

  int a[] = {1,2,3};
  foo(a);

  void *s;
  
  return 0;
}
