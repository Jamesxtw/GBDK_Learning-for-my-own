#include <gb/gb.h>
#include <stdio.h>
#include "c01.c"
#include "backgroundtile.c"
#include "MAP1.c"

void main () {
  UINT8 currentspriteindex = 0 ; 
set_sprite_data ( 0, 2, c01);
set_sprite_tile ( 0,0);

 move_sprite( 0, 80, 70);
SHOW_SPRITES;
set_bkg_data(0,16,backgroundtile);
set_bkg_tiles(0,0,MAP1Width,MAP1Height,MAP1);
SHOW_BKG;
DISPLAY_ON;
 while (1)
 {
   switch (joypad()){
     
     case J_RIGHT:
     if (currentspriteindex == 1)
     {
       currentspriteindex = 0;
       }
     scroll_sprite(0,1,0);
     scroll_bkg(1,0);
     break;
    
     case J_LEFT:
     if (currentspriteindex == 0)
     {
       currentspriteindex = 1;
       }
     scroll_sprite(0,-1,0);
     scroll_bkg(-1,0);


     break;

     case J_A:
     scroll_sprite(0,0,-3);
     break;

    
   }
      set_sprite_tile ( 0,currentspriteindex);
      delay(100);

 }
 

}