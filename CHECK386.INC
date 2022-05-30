
;
; _check386 returns carry clear if 386 or higher present, set if not...
;

PROC _check386

	  pushf

	  ; check if 80286 or later

	  xor  ax,ax
	  push ax
	  popf
	  pushf
	  pop  ax
	  and  ax,0f000h
	  cmp  ax,0f000h
	  je   below_286

	  ; check if 80386 or higher

	  mov  ax,07000h
	  push ax
	  popf
	  pushf
	  pop  ax
	  and  ax,07000h
	  je   eq_286


	  jmp  atleast_386

below_286:
eq_286	 :
	  popf
	  sti
	  ret
atleast_386:
	  popf
	  clc
	  ret

ENDP
