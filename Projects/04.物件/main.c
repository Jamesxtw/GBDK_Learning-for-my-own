#include <gb/gb.h>
#include <stdio.h>
#include "c01.c"

void main () {
  UINT8 currentspriteindex = 0; 
set_sprite_data ( 0, 2, C01);
set_sprite_tile ( 0, 0 );
 move_sprite( 0, 80, 70);
SHOW_SPRITES;

 while (1)
 {
   switch (joypad()){
     
     case J_RIGHT:
     currentspriteindex = 0; 
     scroll_sprite(0,1,0);
     break;

     case J_LEFT:
     currentspriteindex = 1;
     scroll_sprite(0,-1,0);
     break;

     case J_A:
     scroll_sprite(0,0,-3);
     break;

    
   }
 
    delay(100);

 }
 

}