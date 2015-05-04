#include <stdio.h>
#include <stdbool.h>
#include "display.h"
#include <curses.h>

int main(){
    int level;
    char ch;
    int row, col;
    int dir;

    init_display(0);
    row = col = 0;

    while(ch != 'q'){ 
        show_mouse(dir, row, col);
}
