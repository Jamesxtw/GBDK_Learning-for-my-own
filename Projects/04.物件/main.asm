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
	.globl _set_sprite_data
	.globl _joypad
	.globl _delay
	.globl _C01
;--------------------------------------------------------
; special function registers
;--------------------------------------------------------
;--------------------------------------------------------
; ram data
;--------------------------------------------------------
	.area _DATA
_C01::
	.ds 32
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
;c01.c:26: unsigned char C01[] =
	ld	hl, #_C01
	ld	(hl), #0x00
	ld	hl, #(_C01 + 0x0001)
	ld	(hl), #0x3f
	ld	hl, #(_C01 + 0x0002)
	ld	(hl), #0x00
	ld	hl, #(_C01 + 0x0003)
	ld	(hl), #0x7f
	ld	hl, #(_C01 + 0x0004)
	ld	(hl), #0x01
	ld	hl, #(_C01 + 0x0005)
	ld	(hl), #0xf1
	ld	hl, #(_C01 + 0x0006)
	ld	(hl), #0x05
	ld	hl, #(_C01 + 0x0007)
	ld	(hl), #0xe5
	ld	hl, #(_C01 + 0x0008)
	ld	(hl), #0x01
	ld	hl, #(_C01 + 0x0009)
	ld	(hl), #0xc1
	ld	hl, #(_C01 + 0x000a)
	ld	(hl), #0x03
	ld	hl, #(_C01 + 0x000b)
	ld	(hl), #0xc3
	ld	hl, #(_C01 + 0x000c)
	ld	(hl), #0x0e
	ld	hl, #(_C01 + 0x000d)
	ld	(hl), #0xce
	ld	hl, #(_C01 + 0x000e)
	ld	(hl), #0x38
	ld	hl, #(_C01 + 0x000f)
	ld	(hl), #0xf8
	ld	hl, #(_C01 + 0x0010)
	ld	(hl), #0x00
	ld	hl, #(_C01 + 0x0011)
	ld	(hl), #0xfc
	ld	hl, #(_C01 + 0x0012)
	ld	(hl), #0x00
	ld	hl, #(_C01 + 0x0013)
	ld	(hl), #0xfe
	ld	hl, #(_C01 + 0x0014)
	ld	(hl), #0x80
	ld	hl, #(_C01 + 0x0015)
	ld	(hl), #0x8f
	ld	hl, #(_C01 + 0x0016)
	ld	(hl), #0xa0
	ld	hl, #(_C01 + 0x0017)
	ld	(hl), #0xa7
	ld	hl, #(_C01 + 0x0018)
	ld	(hl), #0x80
	ld	hl, #(_C01 + 0x0019)
	ld	(hl), #0x83
	ld	hl, #(_C01 + 0x001a)
	ld	(hl), #0xc0
	ld	hl, #(_C01 + 0x001b)
	ld	(hl), #0xc3
	ld	hl, #(_C01 + 0x001c)
	ld	(hl), #0x70
	ld	hl, #(_C01 + 0x001d)
	ld	(hl), #0x73
	ld	hl, #(_C01 + 0x001e)
	ld	(hl), #0x1c
	ld	hl, #(_C01 + 0x001f)
	ld	(hl), #0x1f
;--------------------------------------------------------
; Home
;--------------------------------------------------------
	.area _HOME
	.area _HOME
;--------------------------------------------------------
; code
;--------------------------------------------------------
	.area _CODE
;main.c:5: void main () {
;	---------------------------------
; Function main
; ---------------------------------
_main::
;main.c:7: set_sprite_data ( 0, 2, C01);
	ld	hl, #_C01
	push	hl
	ld	a, #0x02
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
;c:/gbdk/include/gb/gb.h:1218: OAM_item_t * itm = &shadow_OAM[nb];
	ld	hl, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1219: itm->y=y, itm->x=x;
	ld	a, #0x46
	ld	(hl+), a
	ld	(hl), #0x50
;main.c:10: SHOW_SPRITES;
	ldh	a, (_LCDC_REG+0)
	or	a, #0x02
	ldh	(_LCDC_REG+0),a
;main.c:12: while (1)
00106$:
;main.c:14: switch (joypad()){
	call	_joypad
	ld	a, e
	cp	a, #0x01
	jr	Z, 00101$
	cp	a, #0x02
	jr	Z, 00102$
	sub	a, #0x10
	jr	Z, 00103$
	jr	00104$
;main.c:16: case J_RIGHT:
00101$:
;c:/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	inc	a
	ld	(bc), a
;main.c:19: break;
	jr	00104$
;main.c:21: case J_LEFT:
00102$:
;c:/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	dec	a
	ld	(bc), a
;main.c:24: break;
	jr	00104$
;main.c:26: case J_A:
00103$:
;c:/gbdk/include/gb/gb.h:1234: OAM_item_t * itm = &shadow_OAM[nb];
	ld	bc, #_shadow_OAM
;c:/gbdk/include/gb/gb.h:1235: itm->y+=y, itm->x+=x;
	ld	a, (bc)
	add	a, #0xfd
	ld	(bc), a
	inc	bc
	ld	a, (bc)
	ld	(bc), a
;main.c:31: }
00104$:
;main.c:33: delay(100);
	ld	hl, #0x0064
	push	hl
	call	_delay
	add	sp, #2
;main.c:38: }
	jr	00106$
	.area _CODE
	.area _CABS (ABS)
