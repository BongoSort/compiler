/* main.c: C wrapper for assembly programs */
   
#include <stdio.h>
extern int example ();

int main() {
    int result = example();
    return result;
}

void print_int (int x) {
    printf ("%d\n", x);
}