#include <gb/gb.h>
#include <stdio.h>
#include "backgroundtile.c"
#include "MAP1.c"
unsigned char c01[] =
  {
    0x3C,0x3C,0x38,0x24,0x3E,0x20,0x18,0x04,
    0x14,0x3E,0x1C,0x3E,0x3E,0x1C,0x14,0x14,
    0x3C,0x3C,0x1C,0x24,0x7C,0x04,0x18,0x20,
    0x28,0x7C,0x38,0x7C,0x7C,0x38,0x28,0x28,
    0x3C,0x3C,0x38,0x24,0x3E,0x20,0x18,0x04,
    0x14,0x3E,0x1D,0x2E,0x1C,0x1C,0x22,0x22,
    0x3C,0x3C,0x1C,0x24,0x7C,0x04,0x18,0x20,
    0x28,0x7C,0xB8,0x74,0x38,0x38,0x44,0x44
  }; 
//functions
  INT8 currentspriteindex = 27 ; //set tile to 27
  INT8 floorsurfaceposition = 104 ;
  int playerlocation [2]; //set xy axis
  UINT8 p1movespeed = 2 ; //P1 speed

  //jump
  BYTE jumpornot;
  INT8 speedY;
  INT8 gravity = -2 ;

  INT8 wouldthespritehitthefloor(INT8 projectfloorposition)
  {
    if (projectfloorposition >= floorsurfaceposition)
    {
      return floorsurfaceposition;
    }
    return -1 ;
  }
  
  void performentdelay (UINT8 numloops)//wait frame generate delay
  {
    UINT8 i;
    for ( i = 0 ; i < numloops ; i++) 
    {
      wait_vbl_done();
    }
  } 
  
//BKG1

  void BKG1() //BKGMAIN
  {
    set_bkg_data(0,16,backgroundtile);
    set_bkg_tiles(0,0,MAP1Width,MAP1Height,MAP1);
    SHOW_BKG;
  }
  
  void BKGSCOLLRIGHT() //BKG RIGHT
  {
    scroll_bkg(p1movespeed,0);
  }
  
  void BKGSCOLLLEFT() //BKG LEFT
  {
    scroll_bkg(-p1movespeed,0);
  }

//playerone

  void player1( )//P1main
  {
    set_sprite_data ( 27, 4, c01);
    set_sprite_tile ( 0,27);
    playerlocation[0]= 20;  //x axis
    playerlocation[1]= 104; //y axis
    move_sprite( 0,playerlocation[0],floorsurfaceposition);

    jumpornot = 0;

    SHOW_SPRITES;
  }

  void jump () //P1jump
  {
    INT8 possiblefloorpositionY;

    if (jumpornot==0)
    {
      jumpornot = 1;
      speedY = -10 ;
    }
    
    speedY = speedY - gravity ;
    playerlocation [1] = playerlocation [1]+speedY ;

    possiblefloorpositionY=wouldthespritehitthefloor(playerlocation [1]);

    if(possiblefloorpositionY > -1 )
    {
      jumpornot = 0;
      move_sprite( 0,playerlocation[0],possiblefloorpositionY);
    }
      else
      {
        move_sprite( 0,playerlocation[0], playerlocation[1]); 
      }
  } 

  void playermoveright() //MOVEright
  {
    if (currentspriteindex == 28)
    {
      currentspriteindex = 27 ;
    
    }
    set_sprite_tile ( 0,currentspriteindex);
    
    playerlocation[0]=playerlocation[0]+p1movespeed;
    move_sprite(0,playerlocation[0],playerlocation[1]);

  }

  void playermoveleft() //MOVEleft
  {

    if (currentspriteindex == 27 )
    {
      currentspriteindex = 28 ;
     
    }
    set_sprite_tile ( 0,currentspriteindex);
    playerlocation[0]=playerlocation[0]-p1movespeed ;
    move_sprite(0,playerlocation[0],playerlocation[1]);

  }

  void player1con() //P1con
  {
      if (joypad() & J_RIGHT ) //right bottom
      {
        playermoveright();
        BKGSCOLLRIGHT();
      }
    
      if (joypad() & J_LEFT ) //left bottom
      {
        playermoveleft();
        BKGSCOLLLEFT();
      }

      if (joypad() & J_A || jumpornot == 1 ) //A bottom
      {
        jump();
      }

      performentdelay(5);

  }
  
 
//main
  void main ()//main 
  {
    player1();
    BKG1();
    DISPLAY_ON;
    while (1)
    {
    player1con();
    }
  }