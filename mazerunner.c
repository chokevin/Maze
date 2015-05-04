#include <stdio.h>
#include <stdbool.h>
#include "display.h"

int main(){
    int level;

    printf("Level: ");
    scanf("%d", &level);
    init_display(level); 
}
