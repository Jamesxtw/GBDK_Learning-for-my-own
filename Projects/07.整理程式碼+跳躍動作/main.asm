;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 4.1.0 #12072 (MINGW32)
;--------------------------------------------------------
	.module main
	.optsdcc -mgbz80
	
;--------------------------------------------------------
; Public variables in this module
;--------------------------------------------------------
	.globl _main
	.globl _player1con
	.globl _playermoveleft
	.globl _playermoveright
	.globl _jump
	.globl _player1
	.globl _BKGSCOLLLEFT
	.globl _BKGSCOLLRIGHT
	.globl _BKG1
	.globl _performentdelay
	.globl _wouldthespritehitthefloor
	.globl _set_sprite_data
	.globl _set_bkg_tiles
	.globl _set_bkg_data
	.globl _wait_vbl_done
	.globl _joypad
	.globl _gravity
	.globl _speedY
	.globl _jumpornot
	.globl _p1movespeed
	.globl _playerlocation
	.globl _floorsurfaceposition
	.globl _currentspriteindex
	.globl _c01
	.globl _MAP1
	.globl _backgroundtile
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_backgroundtile::
	.ds 256
_MAP1::
	.ds 576
_c01::
	.ds 64
_currentspriteindex::
	.ds 1
_floorsurfaceposition::
	.ds 1
_playerlocation::
	.ds 4
_p1movespeed::
	.ds 1
_jumpornot::
	.ds 1
_speedY::
	.ds 1
_gravity::
	.ds 1
;--------------------------------------------------------
; absolute external ram data
;--------------------------------------------------------
	.area _DABS (ABS)
;--------------------------------------------------------
; global & static initialisations
;--------------------------------------------------------
	.area _HOME
	.area _GSINIT
	.area _GSFINAL
	.area _GSINIT
;backgroundtile.c:26: unsigned char backgroundtile[] =
	ld	hl, #_backgroundtile
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0001)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0003)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0004)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0005)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0006)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0007)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0008)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0009)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x000a)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x000b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x000c)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x000d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x000e)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x000f)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0010)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0011)
	ld	(hl), #0x45
	ld	hl, #(_backgroundtile + 0x0012)
	ld	(hl), #0x92
	ld	hl, #(_backgroundtile + 0x0013)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0014)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0015)
	ld	(hl), #0x28
	ld	hl, #(_backgroundtile + 0x0016)
	ld	(hl), #0x45
	ld	hl, #(_backgroundtile + 0x0017)
	ld	(hl), #0x45
	ld	hl, #(_backgroundtile + 0x0018)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0019)
	ld	(hl), #0x92
	ld	hl, #(_backgroundtile + 0x001a)
	ld	(hl), #0x28
	ld	hl, #(_backgroundtile + 0x001b)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x001c)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x001d)
	ld	(hl), #0x45
	ld	hl, #(_backgroundtile + 0x001e)
	ld	(hl), #0x82
	ld	hl, #(_backgroundtile + 0x001f)
	ld	(hl), #0x82
	ld	hl, #(_backgroundtile + 0x0020)
	ld	(hl), #0xc7
	ld	hl, #(_backgroundtile + 0x0021)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0022)
	ld	(hl), #0xbd
	ld	hl, #(_backgroundtile + 0x0023)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0024)
	ld	(hl), #0xe2
	ld	hl, #(_backgroundtile + 0x0025)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0026)
	ld	(hl), #0x97
	ld	hl, #(_backgroundtile + 0x0027)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0028)
	ld	(hl), #0xbf
	ld	hl, #(_backgroundtile + 0x0029)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x002a)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtile + 0x002b)
	ld	(hl), #0xfe
	ld	hl, #(_backgroundtile + 0x002c)
	ld	(hl), #0xf7
	ld	hl, #(_backgroundtile + 0x002d)
	ld	(hl), #0xf7
	ld	hl, #(_backgroundtile + 0x002e)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x002f)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0036)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtile + 0x0037)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtile + 0x0038)
	ld	(hl), #0x62
	ld	hl, #(_backgroundtile + 0x0039)
	ld	(hl), #0x7e
	ld	hl, #(_backgroundtile + 0x003a)
	ld	(hl), #0x3e
	ld	hl, #(_backgroundtile + 0x003b)
	ld	(hl), #0x3e
	ld	hl, #(_backgroundtile + 0x003c)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtile + 0x003d)
	ld	(hl), #0x7f
	ld	hl, #(_backgroundtile + 0x003e)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x003f)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0048)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtile + 0x0049)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtile + 0x004a)
	ld	(hl), #0x24
	ld	hl, #(_backgroundtile + 0x004b)
	ld	(hl), #0x24
	ld	hl, #(_backgroundtile + 0x004c)
	ld	(hl), #0x42
	ld	hl, #(_backgroundtile + 0x004d)
	ld	(hl), #0x42
	ld	hl, #(_backgroundtile + 0x004e)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtile + 0x004f)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtile + 0x0050)
	ld	(hl), #0x01
	ld	hl, #(_backgroundtile + 0x0051)
	ld	(hl), #0x01
	ld	hl, #(_backgroundtile + 0x0052)
	ld	(hl), #0x02
	ld	hl, #(_backgroundtile + 0x0053)
	ld	(hl), #0x02
	ld	hl, #(_backgroundtile + 0x0054)
	ld	(hl), #0x04
	ld	hl, #(_backgroundtile + 0x0055)
	ld	(hl), #0x04
	ld	hl, #(_backgroundtile + 0x0056)
	ld	(hl), #0x08
	ld	hl, #(_backgroundtile + 0x0057)
	ld	(hl), #0x08
	ld	hl, #(_backgroundtile + 0x0058)
	ld	(hl), #0x10
	ld	hl, #(_backgroundtile + 0x0059)
	ld	(hl), #0x10
	ld	hl, #(_backgroundtile + 0x005a)
	ld	(hl), #0x20
	ld	hl, #(_backgroundtile + 0x005b)
	ld	(hl), #0x20
	ld	hl, #(_backgroundtile + 0x005c)
	ld	(hl), #0x40
	ld	hl, #(_backgroundtile + 0x005d)
	ld	(hl), #0x40
	ld	hl, #(_backgroundtile + 0x005e)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtile + 0x005f)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtile + 0x0060)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtile + 0x0061)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtile + 0x0062)
	ld	(hl), #0x40
	ld	hl, #(_backgroundtile + 0x0063)
	ld	(hl), #0x40
	ld	hl, #(_backgroundtile + 0x0064)
	ld	(hl), #0x20
	ld	hl, #(_backgroundtile + 0x0065)
	ld	(hl), #0x20
	ld	hl, #(_backgroundtile + 0x0066)
	ld	(hl), #0x10
	ld	hl, #(_backgroundtile + 0x0067)
	ld	(hl), #0x10
	ld	hl, #(_backgroundtile + 0x0068)
	ld	(hl), #0x08
	ld	hl, #(_backgroundtile + 0x0069)
	ld	(hl), #0x08
	ld	hl, #(_backgroundtile + 0x006a)
	ld	(hl), #0x04
	ld	hl, #(_backgroundtile + 0x006b)
	ld	(hl), #0x04
	ld	hl, #(_backgroundtile + 0x006c)
	ld	(hl), #0x02
	ld	hl, #(_backgroundtile + 0x006d)
	ld	(hl), #0x02
	ld	hl, #(_backgroundtile + 0x006e)
	ld	(hl), #0x01
	ld	hl, #(_backgroundtile + 0x006f)
	ld	(hl), #0x01
	ld	hl, #(_backgroundtile + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x007b)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x007c)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x007e)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x007f)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x0081)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtile + 0x0082)
	ld	(hl), #0x01
	ld	hl, #(_backgroundtile + 0x0083)
	ld	(hl), #0x0e
	ld	hl, #(_backgroundtile + 0x0084)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x0085)
	ld	(hl), #0x3c
	ld	hl, #(_backgroundtile + 0x0086)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtile + 0x0087)
	ld	(hl), #0x38
	ld	hl, #(_backgroundtile + 0x0088)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtile + 0x0089)
	ld	(hl), #0x70
	ld	hl, #(_backgroundtile + 0x008a)
	ld	(hl), #0x0e
	ld	hl, #(_backgroundtile + 0x008b)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtile + 0x008c)
	ld	(hl), #0x1f
	ld	hl, #(_backgroundtile + 0x008d)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtile + 0x008e)
	ld	(hl), #0x3e
	ld	hl, #(_backgroundtile + 0x008f)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x0090)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtile + 0x0091)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtile + 0x0092)
	ld	(hl), #0x42
	ld	hl, #(_backgroundtile + 0x0093)
	ld	(hl), #0x42
	ld	hl, #(_backgroundtile + 0x0094)
	ld	(hl), #0x24
	ld	hl, #(_backgroundtile + 0x0095)
	ld	(hl), #0x24
	ld	hl, #(_backgroundtile + 0x0096)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtile + 0x0097)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtile + 0x0098)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtile + 0x0099)
	ld	(hl), #0x18
	ld	hl, #(_backgroundtile + 0x009a)
	ld	(hl), #0x24
	ld	hl, #(_backgroundtile + 0x009b)
	ld	(hl), #0x24
	ld	hl, #(_backgroundtile + 0x009c)
	ld	(hl), #0x42
	ld	hl, #(_backgroundtile + 0x009d)
	ld	(hl), #0x42
	ld	hl, #(_backgroundtile + 0x009e)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtile + 0x009f)
	ld	(hl), #0x81
	ld	hl, #(_backgroundtile + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00a1)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtile + 0x00a2)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtile + 0x00a3)
	ld	(hl), #0x70
	ld	hl, #(_backgroundtile + 0x00a4)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00a5)
	ld	(hl), #0x3c
	ld	hl, #(_backgroundtile + 0x00a6)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtile + 0x00a7)
	ld	(hl), #0x1c
	ld	hl, #(_backgroundtile + 0x00a8)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtile + 0x00a9)
	ld	(hl), #0x0e
	ld	hl, #(_backgroundtile + 0x00aa)
	ld	(hl), #0x70
	ld	hl, #(_backgroundtile + 0x00ab)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtile + 0x00ac)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtile + 0x00ad)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtile + 0x00ae)
	ld	(hl), #0x7c
	ld	hl, #(_backgroundtile + 0x00af)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00b0)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00b2)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00b4)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00b6)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00b8)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00ba)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00bb)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00bc)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00be)
	ld	(hl), #0xff
	ld	hl, #(_backgroundtile + 0x00bf)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00c0)
	ld	(hl), #0x7c
	ld	hl, #(_backgroundtile + 0x00c1)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00c2)
	ld	(hl), #0xf8
	ld	hl, #(_backgroundtile + 0x00c3)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtile + 0x00c4)
	ld	(hl), #0x70
	ld	hl, #(_backgroundtile + 0x00c5)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtile + 0x00c6)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtile + 0x00c7)
	ld	(hl), #0x0e
	ld	hl, #(_backgroundtile + 0x00c8)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtile + 0x00c9)
	ld	(hl), #0x1c
	ld	hl, #(_backgroundtile + 0x00ca)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00cb)
	ld	(hl), #0x3c
	ld	hl, #(_backgroundtile + 0x00cc)
	ld	(hl), #0x80
	ld	hl, #(_backgroundtile + 0x00cd)
	ld	(hl), #0x70
	ld	hl, #(_backgroundtile + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00cf)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtile + 0x00d0)
	ld	(hl), #0x3e
	ld	hl, #(_backgroundtile + 0x00d1)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00d2)
	ld	(hl), #0x1f
	ld	hl, #(_backgroundtile + 0x00d3)
	ld	(hl), #0xe0
	ld	hl, #(_backgroundtile + 0x00d4)
	ld	(hl), #0x0e
	ld	hl, #(_backgroundtile + 0x00d5)
	ld	(hl), #0xf0
	ld	hl, #(_backgroundtile + 0x00d6)
	ld	(hl), #0x0f
	ld	hl, #(_backgroundtile + 0x00d7)
	ld	(hl), #0x70
	ld	hl, #(_backgroundtile + 0x00d8)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtile + 0x00d9)
	ld	(hl), #0x38
	ld	hl, #(_backgroundtile + 0x00da)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00db)
	ld	(hl), #0x3c
	ld	hl, #(_backgroundtile + 0x00dc)
	ld	(hl), #0x01
	ld	hl, #(_backgroundtile + 0x00dd)
	ld	(hl), #0x0e
	ld	hl, #(_backgroundtile + 0x00de)
	ld	(hl), #0x00
	ld	hl, #(_backgroundtile + 0x00df)
	ld	(hl), #0x07
	ld	hl, #(_backgroundtile + 0x00e0)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtile + 0x00e1)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00e2)
	ld	(hl), #0xbc
	ld	hl, #(_backgroundtile + 0x00e3)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00e4)
	ld	(hl), #0x7c
	ld	hl, #(_backgroundtile + 0x00e5)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00e6)
	ld	(hl), #0xbc
	ld	hl, #(_backgroundtile + 0x00e7)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00e8)
	ld	(hl), #0x7c
	ld	hl, #(_backgroundtile + 0x00e9)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00ea)
	ld	(hl), #0xfc
	ld	hl, #(_backgroundtile + 0x00eb)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00ec)
	ld	(hl), #0xbc
	ld	hl, #(_backgroundtile + 0x00ed)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00ee)
	ld	(hl), #0x7c
	ld	hl, #(_backgroundtile + 0x00ef)
	ld	(hl), #0x03
	ld	hl, #(_backgroundtile + 0x00f0)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtile + 0x00f1)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00f2)
	ld	(hl), #0x3d
	ld	hl, #(_backgroundtile + 0x00f3)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00f4)
	ld	(hl), #0x3e
	ld	hl, #(_backgroundtile + 0x00f5)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00f6)
	ld	(hl), #0x3d
	ld	hl, #(_backgroundtile + 0x00f7)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00f8)
	ld	(hl), #0x3e
	ld	hl, #(_backgroundtile + 0x00f9)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00fa)
	ld	(hl), #0x3f
	ld	hl, #(_backgroundtile + 0x00fb)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00fc)
	ld	(hl), #0x3d
	ld	hl, #(_backgroundtile + 0x00fd)
	ld	(hl), #0xc0
	ld	hl, #(_backgroundtile + 0x00fe)
	ld	(hl), #0x3e
	ld	hl, #(_backgroundtile + 0x00ff)
	ld	(hl), #0xc0
;MAP1.c:25: unsigned char MAP1[] =
	ld	hl, #_MAP1
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0001)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0002)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0003)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0005)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0006)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0007)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0008)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0009)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x000a)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x000b)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x000c)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x000d)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x000e)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x000f)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0010)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0011)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0012)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0013)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0014)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0015)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0016)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0017)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0018)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0019)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x001a)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x001b)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x001c)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x001d)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x001e)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x001f)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0020)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0021)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0022)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0023)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0024)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0025)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0026)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0027)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0028)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0029)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x002a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x002b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x002c)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x002d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x002e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x002f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0030)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0031)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0032)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0033)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0034)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0035)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0036)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0037)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0038)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0039)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x003a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x003b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x003c)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x003d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x003e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x003f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0040)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0041)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0042)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0043)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0044)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0045)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0046)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0047)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0048)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0049)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x004a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x004b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x004c)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x004d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x004e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x004f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0050)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0051)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0052)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0053)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0054)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0055)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0056)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0057)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0058)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0059)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x005a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x005b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x005c)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x005d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x005e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x005f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0060)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0061)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0062)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0063)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0064)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0065)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0066)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0067)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0068)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0069)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x006a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x006b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x006c)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x006d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x006e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x006f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0070)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0071)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0072)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0073)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0074)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0075)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0076)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0077)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0078)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0079)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x007a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x007b)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x007c)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x007d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x007e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x007f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0080)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0081)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0082)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0083)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0084)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0085)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0086)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0087)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0088)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0089)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x008a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x008b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x008c)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x008d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x008e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x008f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0090)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0091)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0092)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0093)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0094)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0095)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0096)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0097)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0098)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0099)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x009a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x009b)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x009c)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x009d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x009e)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x009f)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x00a0)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a1)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a2)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a3)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a4)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a5)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a6)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a7)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a8)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00a9)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00aa)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ab)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ac)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ad)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ae)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00af)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b0)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b1)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b2)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b3)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b4)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b5)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b6)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b7)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b8)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00b9)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ba)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00bb)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x00bc)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x00bd)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00be)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x00bf)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x00c0)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c1)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c2)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c3)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c4)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c5)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c6)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c7)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c8)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00c9)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ca)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00cb)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00cc)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00cd)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ce)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00cf)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d0)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d1)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d2)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d3)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d4)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d5)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d6)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d7)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d8)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00d9)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00da)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00db)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x00dc)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x00dd)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00de)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x00df)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x00e0)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e1)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e2)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e3)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e4)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e5)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e6)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e7)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e8)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00e9)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ea)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x00eb)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x00ec)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ed)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ee)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00ef)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f0)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f1)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f2)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f3)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f4)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f5)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f6)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f7)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f8)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00f9)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00fa)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x00fb)
	ld	(hl), #0x0d
	ld	hl, #(_MAP1 + 0x00fc)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x00fd)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x00fe)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x00ff)
	ld	(hl), #0x0c
	ld	hl, #(_MAP1 + 0x0100)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0101)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0102)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0103)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0104)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0105)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0106)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0107)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0108)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0109)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x010a)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x010b)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x010c)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x010d)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x010e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x010f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0110)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0111)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0112)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0113)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0114)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0115)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0116)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0117)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0118)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0119)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x011a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x011b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x011c)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x011d)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x011e)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x011f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0120)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0121)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0122)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0123)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0124)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0125)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0126)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0127)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0128)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x0129)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x012a)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x012b)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x012c)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x012d)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x012e)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x012f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0130)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0131)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0132)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0133)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0134)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0135)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0136)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0137)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0138)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0139)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x013a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x013b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x013c)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x013d)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x013e)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x013f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0140)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0141)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0142)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0143)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0144)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0145)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0146)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0147)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x0148)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x0149)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x014a)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x014b)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x014c)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x014d)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x014e)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x014f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0150)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0151)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0152)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0153)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x0154)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x0155)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0156)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0157)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0158)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0159)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x015a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x015b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x015c)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x015d)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x015e)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x015f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0160)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0161)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0162)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0163)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0164)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0165)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0166)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x0167)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x0168)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x0169)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x016a)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x016b)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x016c)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x016d)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x016e)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x016f)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x0170)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0171)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0172)
	ld	(hl), #0x08
	ld	hl, #(_MAP1 + 0x0173)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x0174)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x0175)
	ld	(hl), #0x0a
	ld	hl, #(_MAP1 + 0x0176)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0177)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0178)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0179)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x017a)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x017b)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x017c)
	ld	(hl), #0x0f
	ld	hl, #(_MAP1 + 0x017d)
	ld	(hl), #0x0b
	ld	hl, #(_MAP1 + 0x017e)
	ld	(hl), #0x0e
	ld	hl, #(_MAP1 + 0x017f)
	ld	(hl), #0x00
	ld	hl, #(_MAP1 + 0x0180)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0181)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0182)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0183)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0184)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0185)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0186)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0187)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0188)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0189)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x018a)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x018b)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x018c)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x018d)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x018e)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x018f)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0190)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0191)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0192)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0193)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0194)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0195)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0196)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0197)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0198)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0199)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x019a)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x019b)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x019c)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x019d)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x019e)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x019f)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a0)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a1)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a2)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a3)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a4)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a5)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a6)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a7)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a8)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01a9)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01aa)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ab)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ac)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ad)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ae)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01af)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b0)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b1)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b2)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b3)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b4)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b5)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b6)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b7)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b8)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01b9)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ba)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01bb)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01bc)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01bd)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01be)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01bf)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c0)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c1)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c2)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c3)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c4)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c5)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c6)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c7)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c8)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01c9)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ca)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01cb)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01cc)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01cd)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ce)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01cf)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d0)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d1)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d2)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d3)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d4)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d5)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d6)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d7)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d8)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01d9)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01da)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01db)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01dc)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01dd)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01de)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01df)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e0)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e1)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e2)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e3)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e4)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e5)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e6)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e7)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e8)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01e9)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ea)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01eb)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ec)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ed)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ee)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ef)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f0)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f1)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f2)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f3)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f4)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f5)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f6)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f7)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f8)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01f9)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01fa)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01fb)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01fc)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01fd)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01fe)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x01ff)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0200)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0201)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0202)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0203)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0204)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0205)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0206)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0207)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0208)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0209)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x020a)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x020b)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x020c)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x020d)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x020e)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x020f)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0210)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0211)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0212)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0213)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0214)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0215)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0216)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0217)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0218)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0219)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x021a)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x021b)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x021c)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x021d)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x021e)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x021f)
	ld	(hl), #0x02
	ld	hl, #(_MAP1 + 0x0220)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0221)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0222)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0223)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0224)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0225)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0226)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0227)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0228)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0229)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x022a)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x022b)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x022c)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x022d)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x022e)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x022f)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0230)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0231)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0232)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0233)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0234)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0235)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0236)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0237)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0238)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x0239)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x023a)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x023b)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x023c)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x023d)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x023e)
	ld	(hl), #0x01
	ld	hl, #(_MAP1 + 0x023f)
	ld	(hl), #0x01
;main.c:5: unsigned char c01[] =
	ld	hl, #_c01
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0001)
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0002)
	ld	(hl), #0x38
	ld	hl, #(_c01 + 0x0003)
	ld	(hl), #0x24
	ld	hl, #(_c01 + 0x0004)
	ld	(hl), #0x3e
	ld	hl, #(_c01 + 0x0005)
	ld	(hl), #0x20
	ld	hl, #(_c01 + 0x0006)
	ld	(hl), #0x18
	ld	hl, #(_c01 + 0x0007)
	ld	(hl), #0x04
	ld	hl, #(_c01 + 0x0008)
	ld	(hl), #0x14
	ld	hl, #(_c01 + 0x0009)
	ld	(hl), #0x3e
	ld	hl, #(_c01 + 0x000a)
	ld	(hl), #0x1c
	ld	hl, #(_c01 + 0x000b)
	ld	(hl), #0x3e
	ld	hl, #(_c01 + 0x000c)
	ld	(hl), #0x3e
	ld	hl, #(_c01 + 0x000d)
	ld	(hl), #0x1c
	ld	hl, #(_c01 + 0x000e)
	ld	(hl), #0x14
	ld	hl, #(_c01 + 0x000f)
	ld	(hl), #0x14
	ld	hl, #(_c01 + 0x0010)
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0011)
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0012)
	ld	(hl), #0x1c
	ld	hl, #(_c01 + 0x0013)
	ld	(hl), #0x24
	ld	hl, #(_c01 + 0x0014)
	ld	(hl), #0x7c
	ld	hl, #(_c01 + 0x0015)
	ld	(hl), #0x04
	ld	hl, #(_c01 + 0x0016)
	ld	(hl), #0x18
	ld	hl, #(_c01 + 0x0017)
	ld	(hl), #0x20
	ld	hl, #(_c01 + 0x0018)
	ld	(hl), #0x28
	ld	hl, #(_c01 + 0x0019)
	ld	(hl), #0x7c
	ld	hl, #(_c01 + 0x001a)
	ld	(hl), #0x38
	ld	hl, #(_c01 + 0x001b)
	ld	(hl), #0x7c
	ld	hl, #(_c01 + 0x001c)
	ld	(hl), #0x7c
	ld	hl, #(_c01 + 0x001d)
	ld	(hl), #0x38
	ld	hl, #(_c01 + 0x001e)
	ld	(hl), #0x28
	ld	hl, #(_c01 + 0x001f)
	ld	(hl), #0x28
	ld	hl, #(_c01 + 0x0020)
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0021)
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0022)
	ld	(hl), #0x38
	ld	hl, #(_c01 + 0x0023)
	ld	(hl), #0x24
	ld	hl, #(_c01 + 0x0024)
	ld	(hl), #0x3e
	ld	hl, #(_c01 + 0x0025)
	ld	(hl), #0x20
	ld	hl, #(_c01 + 0x0026)
	ld	(hl), #0x18
	ld	hl, #(_c01 + 0x0027)
	ld	(hl), #0x04
	ld	hl, #(_c01 + 0x0028)
	ld	(hl), #0x14
	ld	hl, #(_c01 + 0x0029)
	ld	(hl), #0x3e
	ld	hl, #(_c01 + 0x002a)
	ld	(hl), #0x1d
	ld	hl, #(_c01 + 0x002b)
	ld	(hl), #0x2e
	ld	hl, #(_c01 + 0x002c)
	ld	(hl), #0x1c
	ld	hl, #(_c01 + 0x002d)
	ld	(hl), #0x1c
	ld	hl, #(_c01 + 0x002e)
	ld	(hl), #0x22
	ld	hl, #(_c01 + 0x002f)
	ld	(hl), #0x22
	ld	hl, #(_c01 + 0x0030)
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0031)
	ld	(hl), #0x3c
	ld	hl, #(_c01 + 0x0032)
	ld	(hl), #0x1c
	ld	hl, #(_c01 + 0x0033)
	ld	(hl), #0x24
	ld	hl, #(_c01 + 0x0034)
	ld	(hl), #0x7c
	ld	hl, #(_c01 + 0x0035)
	ld	(hl), #0x04
	ld	hl, #(_c01 + 0x0036)
	ld	(hl), #0x18
	ld	hl, #(_c01 + 0x0037)
	ld	(hl), #0x20
	ld	hl, #(_c01 + 0x0038)
	ld	(hl), #0x28
	ld	hl, #(_c01 + 0x0039)
	ld	(hl), #0x7c
	ld	hl, #(_c01 + 0x003a)
	ld	(hl), #0xb8
	ld	hl, #(_c01 + 0x003b)
	ld	(hl), #0x74
	ld	hl, #(_c01 + 0x003c)
	ld	(hl), #0x38
	ld	hl, #(_c01 + 0x003d)
	ld	(hl), #0x38
	ld	hl, #(_c01 + 0x003e)
	ld	(hl), #0x44
	ld	hl, #(_c01 + 0x003f)
	ld	(hl), #0x44
;main.c:18: INT8 currentspriteindex = 0 ; //set tile to 0 
	ld	hl, #_currentspriteindex
	ld	(hl), #0x00
;main.c:19: INT8 floorsurfaceposition = 104 ;
	ld	hl, #_floorsurfaceposition
	ld	(hl), #0x68
;main.c:21: UINT8 p1movespeed = 2; //P1 speed
	ld	hl, #_p1movespeed
	ld	(hl), #0x02
;main.c:26: INT8 gravity = -2 ;//
	ld	hl, #_gravity
	ld	(hl), #0xfe
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:28: INT8 wouldthespritehitthefloor(INT8 projectfloorposition)
;	---------------------------------
; Function wouldthespritehitthefloor
; ---------------------------------
_wouldthespritehitthefloor::
;main.c:30: if (projectfloorposition >= floorsurfaceposition)
	ld	hl, #_floorsurfaceposition
	ld	e, (hl)
	ldhl	sp,	#2
	ld	a,(hl)
	ld	d,a
	ld	hl, #_floorsurfaceposition
	sub	a, (hl)
	bit	7, e
	jr	Z, 00110$
	bit	7, d
	jr	NZ, 00111$
	cp	a, a
	jr	00111$
00110$:
	bit	7, d
	jr	Z, 00111$
	scf
00111$:
	jr	C, 00102$
;main.c:32: return floorsurfaceposition;
	ld	hl, #_floorsurfaceposition
	ld	e, (hl)
	ret
00102$:
;main.c:34: return -1 ;
	ld	e, #0xff
;main.c:35: }
	ret
;main.c:37: void performentdelay (UINT8 numloops)//wait frame generate delay
;	---------------------------------
; Function performentdelay
; ---------------------------------
_performentdelay::
;main.c:40: for ( i = 0 ; i < numloops ; i++) 
	ld	c, #0x00
00103$:
	ld	a, c
	ldhl	sp,	#2
	sub	a, (hl)
	ret	NC
;main.c:42: wait_vbl_done();
	call	_wait_vbl_done
;main.c:40: for ( i = 0 ; i < numloops ; i++) 
	inc	c
;main.c:44: } 
	jr	00103$
;main.c:48: void BKG1() //BKGMAIN
;	---------------------------------
; Function BKG1
; ---------------------------------
_BKG1::
;main.c:50: set_bkg_data(0,16,backgroundtile);
	ld	hl, #_backgroundtile
	push	hl
	ld	a, #0x10
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_data
	add	sp, #4
;main.c:51: set_bkg_tiles(0,0,MAP1Width,MAP1Height,MAP1);
	ld	hl, #_MAP1
	push	hl
	ld	de, #0x1220
	push	de
	xor	a, a
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_bkg_tiles
	add	sp, #6
;main.c:52: SHOW_BKG;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x01
	ldh	(_LCDC_REG+0),a
;main.c:53: }
	ret
;main.c:55: void BKGSCOLLRIGHT() //BKG RIGHT
;	---------------------------------
; Function BKGSCOLLRIGHT
; ---------------------------------
_BKGSCOLLRIGHT::
;main.c:57: scroll_bkg(p1movespeed,0);
	ld	hl, #_p1movespeed
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:840: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, c
	ldh	(_SCX_REG+0),a
;main.c:57: scroll_bkg(p1movespeed,0);
;main.c:58: }
	ret
;main.c:60: void BKGSCOLLLEFT() //BKG LEFT
;	---------------------------------
; Function BKGSCOLLLEFT
; ---------------------------------
_BKGSCOLLLEFT::
;main.c:62: scroll_bkg(-p1movespeed,0);
	xor	a, a
	ld	hl, #_p1movespeed
	sub	a, (hl)
	ld	c, a
;c:/gbdk/include/gb/gb.h:840: SCX_REG+=x, SCY_REG+=y;
	ldh	a, (_SCX_REG+0)
	add	a, c
	ldh	(_SCX_REG+0),a
;main.c:62: scroll_bkg(-p1movespeed,0);
;main.c:63: }
	ret
;main.c:67: void player1( )//P1main
;	---------------------------------
; Function player1
; ---------------------------------
_player1::
;main.c:69: set_sprite_data ( 0, 4, c01);
	ld	hl, #_c01
	push	hl
	ld	a, #0x04
	push	af
	inc	sp
	xor	a, a
	push	af
	inc	sp
	call	_set_sprite_data
	add	sp, #4
;c:/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), #0x00
;main.c:72: playerlocation[0]= 20;  //x axis
	ld	hl, #_playerlocation
	ld	a, #0x14
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:73: playerlocation[1]= 104; //y axis
	ld	hl, #(_playerlocation + 0x0002)
	ld	a, #0x68
	ld	(hl+), a
	ld	(hl), #0x00
;main.c:74: move_sprite( 0,playerlocation[0],floorsurfaceposition);
	ld	hl, #_floorsurfaceposition
	ld	c, (hl)
	ld	hl, #_playerlocation
	ld	b, (hl)
;c:/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, c
	ld	(hl+), a
	ld	(hl), b
;main.c:76: jumpornot = 0;
	ld	hl, #_jumpornot
	ld	(hl), #0x00
;main.c:78: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:79: }
	ret
;main.c:81: void jump () //P1jump
;	---------------------------------
; Function jump
; ---------------------------------
_jump::
	add	sp, #-2
;main.c:85: if (jumpornot==0)
	ld	hl, #_jumpornot
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;main.c:87: jumpornot = 1;
	ld	(hl), #0x01
;main.c:88: speedY = -10 ;
	ld	hl, #_speedY
	ld	(hl), #0xf6
00102$:
;main.c:91: speedY = speedY - gravity ;
	ld	a, (#_speedY)
	ld	hl, #_gravity
	sub	a, (hl)
	ld	(#_speedY),a
;main.c:92: playerlocation [1] = playerlocation [1]+speedY ;
	ld	de, #(_playerlocation + 0x0002)
	ld	a, (de)
	ldhl	sp,	#0
	ld	(hl+), a
	inc	de
	ld	a, (de)
	ld	(hl), a
	ld	a, (#_speedY)
	ld	e, a
	rla
	sbc	a, a
	ld	d, a
;c
	pop	hl
	push	hl
	add	hl, de
	ld	b, l
	ld	c, h
	ld	hl, #(_playerlocation + 0x0002)
	ld	a, b
	ld	(hl+), a
	ld	(hl), c
;main.c:94: possiblefloorpositionY=wouldthespritehitthefloor(playerlocation [1]);
	push	bc
	inc	sp
	call	_wouldthespritehitthefloor
	inc	sp
	ldhl	sp,	#1
	ld	(hl), e
;main.c:96: if(possiblefloorpositionY > -1 )
	ld	e, (hl)
	ld	a,#0xff
	ld	d,a
	sub	a, (hl)
	bit	7, e
	jr	Z, 00120$
	bit	7, d
	jr	NZ, 00121$
	cp	a, a
	jr	00121$
00120$:
	bit	7, d
	jr	Z, 00121$
	scf
00121$:
	jr	NC, 00104$
;main.c:98: jumpornot = 0;
	ld	hl, #_jumpornot
	ld	(hl), #0x00
;main.c:99: move_sprite( 0,playerlocation[0],possiblefloorpositionY);
	ld	hl, #_playerlocation
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	de, #_shadow_OAM+0
;c:/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#1
	ld	a, (hl)
	ld	(de), a
	inc	de
	ld	a, c
	ld	(de), a
;main.c:99: move_sprite( 0,playerlocation[0],possiblefloorpositionY);
	jr	00108$
00104$:
;main.c:103: move_sprite( 0,playerlocation[0], playerlocation[1]); 
	ld	a, (#(_playerlocation + 0x0002) + 0)
	ldhl	sp,	#0
	ld	(hl), a
	ld	a, (#_playerlocation + 0)
	ldhl	sp,	#1
	ld	(hl), a
;c:/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ldhl	sp,	#0
	ld	a, (hl+)
	ld	(bc), a
	inc	bc
	ld	a, (hl)
	ld	(bc), a
;main.c:103: move_sprite( 0,playerlocation[0], playerlocation[1]); 
00108$:
;main.c:105: } 
	add	sp, #2
	ret
;main.c:107: void playermoveright() //MOVEright
;	---------------------------------
; Function playermoveright
; ---------------------------------
_playermoveright::
;main.c:109: if (currentspriteindex == 1)
	ld	a, (#_currentspriteindex)
	dec	a
	jr	NZ, 00102$
;main.c:111: currentspriteindex = 0 ;
	ld	hl, #_currentspriteindex
	ld	(hl), #0x00
00102$:
;main.c:114: set_sprite_tile ( 0,currentspriteindex);
	ld	hl, #_currentspriteindex
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), c
;main.c:116: playerlocation[0]=playerlocation[0]+p1movespeed;
	ld	hl, #_playerlocation
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	a, (#_p1movespeed)
	ld	e, #0x00
	add	a, c
	ld	c, a
	ld	a, e
	adc	a, b
	ld	b, a
	ld	hl, #_playerlocation
	ld	a, c
	ld	(hl+), a
;main.c:117: move_sprite(0,playerlocation[0],playerlocation[1]);
	ld	a, b
	ld	(hl+), a
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:117: move_sprite(0,playerlocation[0],playerlocation[1]);
;main.c:119: }
	ret
;main.c:121: void playermoveleft() //MOVEleft
;	---------------------------------
; Function playermoveleft
; ---------------------------------
_playermoveleft::
;main.c:124: if (currentspriteindex == 0 )
	ld	hl, #_currentspriteindex
	ld	a, (hl)
	or	a, a
	jr	NZ, 00102$
;main.c:126: currentspriteindex = 1 ;
	ld	(hl), #0x01
00102$:
;main.c:129: set_sprite_tile ( 0,currentspriteindex);
	ld	hl, #_currentspriteindex
	ld	c, (hl)
;c:/gbdk/include/gb/gb.h:1145: shadow_OAM[nb].tile=tile;
	ld	hl, #(_shadow_OAM + 0x0002)
	ld	(hl), c
;main.c:130: playerlocation[0]=playerlocation[0]-p1movespeed ;
	ld	hl, #_playerlocation
	ld	a, (hl+)
	ld	c, a
	ld	b, (hl)
	ld	hl, #_p1movespeed
	ld	e, (hl)
	ld	d, #0x00
	ld	a, c
	sub	a, e
	ld	c, a
	ld	a, b
	sbc	a, d
	ld	b, a
	ld	hl, #_playerlocation
	ld	a, c
	ld	(hl+), a
;main.c:131: move_sprite(0,playerlocation[0],playerlocation[1]);
	ld	a, b
	ld	(hl+), a
	ld	e, (hl)
;c:/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, e
	ld	(hl+), a
	ld	(hl), c
;main.c:131: move_sprite(0,playerlocation[0],playerlocation[1]);
;main.c:133: }
	ret
;main.c:135: void player1con() //P1con
;	---------------------------------
; Function player1con
; ---------------------------------
_player1con::
;main.c:137: while (1)
00109$:
;main.c:140: if (joypad() & J_RIGHT ) //right bottom
	call	_joypad
	ld	a, e
	rrca
	jr	NC, 00102$
;main.c:142: playermoveright();
	call	_playermoveright
;main.c:143: BKGSCOLLRIGHT();
	call	_BKGSCOLLRIGHT
00102$:
;main.c:146: if (joypad() & J_LEFT ) //left bottom
	call	_joypad
	bit	1, e
	jr	Z, 00104$
;main.c:148: playermoveleft();
	call	_playermoveleft
;main.c:149: BKGSCOLLLEFT();
	call	_BKGSCOLLLEFT
00104$:
;main.c:152: if (joypad() & J_A || jumpornot == 1 ) //A bottom
	call	_joypad
	bit	4, e
	jr	NZ, 00105$
	ld	a, (#_jumpornot)
	dec	a
	jr	NZ, 00106$
00105$:
;main.c:154: jump();
	call	_jump
00106$:
;main.c:157: performentdelay(5);
	ld	a, #0x05
	push	af
	inc	sp
	call	_performentdelay
	inc	sp
;main.c:160: }
	jr	00109$
;main.c:163: void main ()//main
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:165: player1();
	call	_player1
;main.c:166: BKG1();
	call	_BKG1
;main.c:167: DISPLAY_ON;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x80
	ldh	(_LCDC_REG+0),a
;main.c:168: player1con();
;main.c:169: }
	jp  _player1con
	.area _CODE
	.area _CABS (ABS)
