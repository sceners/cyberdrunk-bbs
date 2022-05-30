

;ÜÛÛßÛÛÜ ÛÛÛ ÛÛÛ ÛÛÛßÛÛÜ ÜÛÛßÛÛÜ ÛÛÛßÛÛÜ ÛÛÛßÛÛÜ ÛÛÛßÛÛÜ ÛÛÛ ÛÛÛ ÜÛÛßÛÛÜ ÛÛÛ ÛÛÛ
;ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
;ÛÛÛ ÛÛÛ ßÛÛÜÛÛÛ ÛÛÛÜÛÛß ÛÛÛÜÜ	 ÛÛÛÜÛÛß ÛÛÛ ÛÛÛ ÛÛÛÜÛÛß ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛÜÛÛß
;ÛÛÛ	 ÜÜ  ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ  ÜÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
;ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
;ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
;ÛÛ  ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ     ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
;ßÛÜÜÛÛß ßÛÛÛÛÛß ÛÛÛÜÛÛß ßÛÛÜÛÛß ÛÛÛ ÛÛÛ Û  ÜÛÛß ÛÛÛ ÛÛÛ ßÛÛÜÛÛß ÛÛÛ ÛÛÛ ÛÛÛ ÛÛÛ
;
;
;ÄÄÄÄÄÄÄÄÄÄ--ù @XP¨Oâ@ ViâtU/´¨ Ÿ/´ït/´Si@S á@YOïë iM/´Giï/´tiOï ù--ÄÄÄÄ--=[XPL]
;
;			  BBSTRO #1 Main-Sourcecode
;
; Credits:
;    Code : original by VLA
;	    major improvements in waves and all additional creative work by JeZ
;    Music: Vibrants
;    GFX  : ROTFL :)
;
;ÄÄÄÄÄÄÄÄÄÄ--ù @XP¨Oâ@ ViâtU/´¨ Ÿ/´ït/´Si@S á@YOïë iM/´Giï/´tiOï ù--ÄÄÄÄ--=[XPL]
;
;
; the waveshit only paints the changing parts... but at the beginning this
; looked awfully distorted. So I fixed it to paint it completely (REPs) and
; after the first pass, I simply overwrite the REP codes with NOPs... KEWL, eh?
;
; I know there might be other ways, but codemodification rules!
;


    Dosseg
    .Model Compact
    .Stack 200h
    .Code
    .386
    Assume CS:@CODE, DS:@CODE
    ideal
    jumps

textwidth	equ 30
textheight	equ 14
textpagesmax	equ 4
textbegx	equ 12
textbegy	equ 3

TEXTMODE	equ 0
WAITMODE	equ 1
CLEANMODE	equ 2

ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

	extrn map4,map1   ; the two bitplanes of the picture converted with
			  ; HSI2RAWP and BIN2DB

Include "Vga16.inc"

PLAY	    dw	0,0	  ;far pointer to player
skiprepflag dw	1	  ;first time paste all bytes, then only necess. ones
	    dw 0
charptr     dw	0,0	  ;pointer to romcharset
textposx    db	0
textposy    db	0
textpage    db	0
actscrpos   dw	0	; ptr to scr (DI backup)
acttextpos  dw	0	; ptr to mem (SI backup)
waitfor     dw	0	; nr of retraces until clean
actmode     dw	WAITMODE

ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
char1:
Include "char2.inc"

ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
Include "text.inc"

ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
Include "pal.inc"

ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
PROC LoadThePicture
    pusha
    push    ds
    mov     ax,cs
    mov     ds,ax

    mov     ah,1111b
    @Set_Write_Plane
    mov     ax, [VGAseg]
    mov     es, ax
    mov     di, 0
    mov     cx, 38400
    mov     al, 0
;    rep stosb

    mov     ah,0010b
    @Set_Write_Plane

    mov     es,[cs:VGAseg]
    xor     di,di
    add     di, 171*80
    mov     ax,SEG map1
    mov     si,OFFSET map1
    shr     si,4
    add     ax, si
    xor     si, si
    mov     cx,80*118
    mov     ds,ax

    rep movsb


    mov     ah,1000b
    @Set_Write_Plane

    mov     es,[cs:VGAseg]
    xor     di,di
    add     di, 194*80
    mov     ax,SEG map4
    mov     si,OFFSET map4
    shr     si,4
    add     ax, si
    xor     si, si
    mov     cx,80*81
    mov     ds,ax

    rep movsb

@@NoFile:
    pop     ds
    popa
    ret
ENDP
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
Include "sincos1k.dw"
ANGLEMASK = 11111111110b
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

; below are the mask for the correct bytevalues for each 8 possible possitions
; in a byte

LABEL EndMask Byte  ;right side
	db  10000000b,11000000b,11100000b,11110000b
	db  11111000b,11111100b,11111110b,11111111b

LABEL FrontMask Byte;left side
	db  00000000b,00000001b,00000011b,00000111b
	db  00001111b,00011111b,00111111b,01111111b

Angle	dw  0,10
TmpXchg dd  0
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ
    ;bx hi = angle 1
    ;bx lo = angle 2
PROC DrawHLineMiddle
    cld
;    mov     bp,40	  ;line we are on
@@BigLoop:
    mov     di,bp
    dec     di

    ror     ebx,16

    mov     si,bx
    and     si,ANGLEMASK
    mov     ax,[Sine + si]
    add     ax,260
    shr     ax,2
    sub     bx,11

    ror     ebx,16

    add     bx,7
    mov     si,bx
    and     si,ANGLEMASK
    add     ax,[Cosine + si]
    mov     si,ax
    add     si,260
    shr     si,2
    mov     cx,si
    shr     cx,3	    ;divide by 8
    inc     cx
    jcxz    @@SkipRep
    sub     di,cx
    dec     di
    xor     al,al
    stosb
@@SkipRep:
    mov     gs, si
    and     si, 7
    mov     al,[FrontMask + si]
    mov     si, gs
    stosb
    mov     al, 11111111b

NOP1:  nop
    rep stosb

    xchg    ebx,[TmpXchg]
    ror     ebx,16

    mov     di,bp
    inc     di
    mov     si,bx
    and     si,ANGLEMASK
    mov     ax,[Sine + si]
    add     ax,260
    shr     ax,2
    add     bx,7

    ror     ebx,16

    add     bx,3
    mov     si,bx
    and     si,ANGLEMASK
    add     ax,[Cosine + si]
    mov     si,ax
    add     si,260
    shr     si,3
    mov     cx,si
    shr     cx,3	    ;divide by 8
    dec     di
    jcxz    @@SkipRep2b
    mov     al,11111111b

    add     di,cx
    dec     di
    push    di
    std 		; backwards (right to left)
NOP2a: nop
    rep
    stosb
    pop     di
    inc     di

@@SkipRep2b:
    cld
    mov     gs, si
    and     si, 7
    movzx   ax,[EndMask + si]
    mov     si, gs
    stosw

    xchg    ebx,[TmpXchg]

    add     bp,640/8
    cmp     bp,640/8*480
    jb	    @@BigLoop

    ret
ENDP

PROC DrawHLineRight

    cld
    mov     bp,80	 ;line we are on
@@BigLoop:
    mov     di,bp
    dec     di

    ror     ebx,16

    mov     si,bx
    and     si,ANGLEMASK
    mov     ax,[Sine + si]
    add     ax,260
    shr     ax,2
    add     bx,9

    ror     ebx,16

    sub     bx,4
    mov     si,bx
    and     si,ANGLEMASK
    add     ax,[Cosine + si]
    mov     si,ax
    add     si,260
    shr     si,2
    mov     cx,si
    shr     cx,3	    ;divide by 8
    inc     cx
    jcxz    @@SkipRep
    sub     di,cx
    dec     di
    xor     al,al
    stosb
@@SkipRep:
    mov     gs, si
    and     si, 7
    mov     al,[FrontMask + si]
    mov     si, gs
    stosb
    mov     al,11111111b
NOP3: nop
    rep
    stosb

    add     bp,640/8
    cmp     bp,640/8*480
    jb	    @@BigLoop

    ret
ENDP

PROC DrawHLineLeft
    cld
    mov     bp,0	;line we are on
@@BigLoop:
    mov     di,bp

    ror     ebx,16

    mov     si,bx
    and     si,ANGLEMASK
    mov     ax,[Sine + si]
    add     ax,260
    shr     ax,2
    sub     bx,9

    ror     ebx,16

    add     bx,4
    mov     si,bx
    and     si,ANGLEMASK
    add     ax,[Cosine + si]
    mov     si,ax
    add     si,260
    shr     si,2
    mov     cx,si
    shr     cx,3	    ;divide by
    jcxz    @@SkipRep

    mov     al,11111111b
    add     di,cx
    dec     di
    push    di
    std
NOP4: nop
    rep
    stosb
    pop     di
    inc     di

@@SkipRep:
    mov     gs, si
    and     si, 7
    movzx   ax,[EndMask + si]
    mov     si, gs
    stosw

    add     bp,640/8
    cmp     bp,640/8*480
    jb	    @@BigLoop

    ret
ENDP

PROC SetUp
    xor     di,di
    mov     cx,640/8*480/2
    xor     ax,ax
    cld
 ;   rep     stosw

    xor     di,di
    xor     eax,eax
    dec     eax

    ret
@@TheLoop:
    push eax
    mov     ah,0100b
    @Set_Write_Plane
    pop eax
    mov     [es:di],eax
    mov     [es:di+46],eax


    push eax
    mov     ah,0001b
    @Set_Write_Plane
    pop eax
    mov     [es:di+32],eax
    mov     [es:di+76],eax

    add     di,80
    cmp     di,80*480
    jb	    @@TheLoop

    ret
ENDP

PROC SetPalette
    mov     bl,0
@@PalLoop:
    mov     dx,03dah
    in	    al,dx

    mov     dx,03c0h
    mov     al,bl
    out     dx,al
    out     dx,al
    inc     bl
    cmp     bl,10h
    jb	    @@PalLoop

    mov     al,20h
    out     dx,al

    mov     si,offset Palette
    mov     cx,3*16
    mov     al,0
    @WritePalette
    ret
ENDP
ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

PROC	putchar      ;destination in ES:DI char in AL
    push    cx
    push    ds
    push    si
    push    es
    push    di
;    mov     cx,cs
;    mov     ds,cx
    mov     si, [word ptr charptr]
    mov     ds, [word ptr charptr+2]
    xor     ah, ah
    shl     ax, 1
    add     si, ax
    mov     cx, 17
    cld
@@loop:
    movsb
    movsb
    add     di, 78
    add     si, 78
    loop    @@loop

    pop     di
    pop     es
    pop     si
    pop     ds
    pop     cx
    ret
ENDP

PROC putletter
    ; DS:SI textsource
    ; ES:DI screendest

    lodsb
    cmp     al, '$'
    jz	    @@end


    cmp     al, ' '
    jz	    @@space

    cmp     al, 41h
    jb	    @@num
    sub     al, 41h	;41 - 5b
    jmp     @@ok
@@num:
    cmp     al, 30h
    jb	    @@sign
    sub     al, 16h	; 30-39
    jmp     @@ok
@@sign:
    sub     al, 7	; 2a-2e
@@ok:
    call    putchar
@@space:
    inc     di
    inc     di
@@end:
    ret
ENDP

PROC	newtextpage

    xor     di,di
    add     di,textbegx + (textbegy*16*80)
    mov     si, offset Msg
    mov     al, [textpage]
    xor     ah, ah
    mov     bx, (textwidth*textheight)
    imul    bx
    add     si, ax
    inc     si
    mov     [acttextpos], si
    mov     [actscrpos],  di
    mov     [textposx], 0
    mov     [textposy], 0
    ret
ENDP

include "check386.inc"


Start:

    call _check386
    jc	 no386

    mov     ax,cs
    mov     ds,ax

    mov     ax,12h
    int     10h

    mov     ax,1130h   ;fetch chargen-info
    mov     bh, 6      ;adress of 8x14 charset
    int     10h
    mov     [word ptr charptr], OFFSET char1 ;bp
    mov     [word ptr charptr+2], SEG char1    ;es

    call    SetPalette

    call    LoadThePicture

    mov     ax,cs
    mov     ds,ax
    mov     es,[VGAseg]

    mov      ah, 0010b
    @Set_Write_Plane

    mov     [textpage] , 0
    call    newtextpage

@@end:

    mov     ah,0111b
    @Set_Write_Plane

    call    Setup

    mov     dx, SEG PLAYER	     ; now locate the VIBRANTS-Player at a
    mov     ax, OFFSET PLAYER	     ; paragraph-boundary
    shr     ax, 4
    add     dx, ax

    mov     [PLAY+2],dx
    mov     es, dx
    mov     [PLAY],0
    mov     di, 0

    mov     ax, SEG PLAYER
    mov     ds, ax
    mov     si, OFFSET PLAYER

    mov     cx, playersize
    sub     cx, 16

    rep     movsb

    mov     ax,cs
    mov     ds,ax

    mov     ah,0		     ; now initalize the VIBRANTS-Player
    mov     bx, SEG MUSICDATA
    mov     cx, OFFSET MUSICDATA
    call    [dword ptr PLAY]

    mov     ah,2
    mov     bx,0
    call    [dword ptr PLAY]	     ; polling mode (we call it each Retrace)

    mov     ah,5
    mov     bl,0
    call    [dword ptr PLAY]

    mov     ax,cs
    mov     ds,ax
    mov     es,[VGAseg]


@@MainLoop:

    @WaitVert

    mov     ah,3		     ; another poll :)
    call    [dword ptr PLAY]

    mov     ah,0100b
    @Set_Write_Plane

    mov     bx,[Angle+2]
    add     bx,8
    shl     ebx,16
    mov     bx,[angle]
    add     bx, 33
    call    DrawHLineLeft

    mov ah,0001b
    @Set_Write_Plane

    mov     bx,[Angle]
    add     bx, 40
    shl     ebx,16
    mov     bx,[angle+2]
    add     bx, 17
    call    DrawHLineRight

    mov ah,0001b
    @Set_Write_Plane

    mov     bx,[Angle]
    shl     ebx,16
    mov     bx,[angle+2]
    mov     [TmpXchg],ebx
    mov     bx,[Angle+2]
    shl     ebx,16
    mov     bx,[angle]
    mov     bp,36
    call    DrawHLineMiddle

  ;  add     [Angle],7
  ;  add     [Angle+2],17

    mov     ah,0100b
    @Set_Write_Plane

    mov     bx,[Angle+2]
    add     bx, 33
    shl     ebx,16
    mov     bx,[angle]
    add     bx, 18
    mov     [TmpXchg],ebx
    mov     bx,[Angle]
    add     bx, 33
    shl     ebx,16
    mov     bx,[angle+2]
    add     bx, 18
    mov     bp,44
    call    DrawHLineMiddle

    mov     ah,0010b
    @Set_Write_Plane

    or	    [skiprepflag], 1

    mov     al, [byte ptr NOP1]
    mov     [byte ptr NOP1+1], al

    mov     al, [byte ptr NOP2a]
    mov     [byte ptr NOP2a+1], al

    mov     al, [byte ptr NOP3]
    mov     [byte ptr NOP3+1], al

    mov     al, [byte ptr NOP4]
    mov     [byte ptr NOP4+1], al

    add     [Angle],7
    add     [Angle+2],13

@@aga:
    cmp     [actmode], TEXTMODE
    jz	    @@writetext
    cmp     [actmode], WAITMODE
    jz	    @@waitfor
    jmp     @@cleanpage

@@writetext:
    clc
    inc     [textposx]
    cmp     [textposx], textwidth
    jb	   @@same
    mov     [textposx], 0
    add     [actscrpos], 28*80+ (80-(textwidth*2))
    inc     [textposy]
    cmp     [textposy], textheight
    jb	    @@same
    inc     [textpage]
    cmp     [textpage], textpagesmax
    jb	   @@pageok
    mov     [textpage] , 0
@@pageok:
    mov     [actmode], WAITMODE
    call    newtextpage
    jmp     @@aga
@@same:
    mov     di, [actscrpos]
    mov     si, [acttextpos]

    call    putletter

    mov     [actscrpos], di
    mov     [acttextpos], si
    jmp @@chkesc

@@waitfor:
    inc     [waitfor]
    cmp     [waitfor], 270
    jnz     @@chkesc
    mov     [waitfor],0
    mov     [actmode], CLEANMODE
    dec     [actscrpos]
    dec     [actscrpos]
    jmp     @@chkesc

@@cleanpage:
    mov     di, [actscrpos]
    mov     cx,textwidth
    mov     ax,0
    rep stosw
    add     [actscrpos], 80
    inc     [waitfor]
    cmp     [waitfor], 480
    jnz     @@chkesc
    mov     [waitfor], 0
    call    newtextpage
    mov     [actmode], TEXTMODE

@@chkesc:
    in al,60h		    ; no doubt - the fastest way to check for ESC-key
    cmp al,1
    jnz      @@MainLoop

    mov     [waitfor],64
@@fadeout:		    ; now fade down the music
    dec     [waitfor]
    jz	    endall
    mov     al,03fh
    sub     al, [byte ptr waitfor]
    mov     bl, al
    mov     ah, 5
    call    [dword ptr PLAY]
    @FullVertWait
    call    SetPalette

    mov     ah,3	    ; set music-volume
    call    [dword ptr PLAY]

    mov     si, OFFSET palette
    mov     cx, 3*16
@@aga2:
    lodsb		    ; fade down the palette
    or	    al, al
    jnz @@ok2
    loop    @@aga2
    jmp @@fadeout
@@ok2:
    dec     al
    mov     [byte ptr SI-1], al
    loop    @@aga2
    jmp @@fadeout
endall:


    mov     ah,5	    ; stop music & init ADLIB
    mov     bl,03fh
    call    [dword ptr PLAY]

    mov     ah,1
    call    [dword ptr PLAY]

    push    ds
    mov     ax, 40h
    mov     es, ax
    mov     ds, ax
    mov     si, 1ch
    mov     di, 1ah
    movsb		    ; clear keyboard-buffer
    pop     ds

    mov     ax,3	    ; set 80x25 mode
    int     10h

    mov     dx, OFFSET credits	 ; print credits
    mov     ah,9
    int     21h

    mov     ah,4ch
    int     21h 	    ; return to OPERATING SYSTEM


no386:
    mov     dx, OFFSET suckertext   ; print credits
    mov     ah,9
    int     21h

    mov     ah,4ch
    int     21h 	    ; return to OPERATING SYSTEM



ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

suckertext:
	db 13,10,"Hey sucker. Buy a 386!!!",13,10, "$"

credits:
	db "CODING:                                          JeZ", 13, 10
	db "MUSIC:  SpaceAce / PLAYER: v4.0             ViBRANTS", 13, 10
	db "GRAFIX:                         heh heh! diz sux....", 13, 10, "$"


ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

MUSICDATA:
Include "spaceace.inc"

ÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄÄ

PLAYER:
Include "play0400.inc"

playersize	equ $-PLAYER
	db	16 dup (?)
lastbyte	db 0

ENd Start

end
