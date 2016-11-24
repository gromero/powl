#include<stdio.h>
#include<tgmath.h>

int main (){
long double a = 3;
long double b = 3;

long double c = powl(a,b);

printf ("%Le\n", c);
}
