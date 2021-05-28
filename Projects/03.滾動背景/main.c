#include <gb/gb.h>
#include <stdio.h>
#include "MAP1.c"
#include "backgroundtile.c"

 void main(){
     //導入使用GBTD製作的Tiles
    set_bkg_data(0,16, backgroundtile);
     //導入使用GBMB製作的MAP
    set_bkg_tiles(0,0,MAP1Width,MAP1Height,MAP1);
  //顯示背景  
  SHOW_BKG;
  //開起螢幕
  DISPLAY_ON;
       while (1)
       {
        scroll_bkg(1,0);  
         wait_vbl_done();
       }
       






}
