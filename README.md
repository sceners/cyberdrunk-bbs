# Cyberdrunk BBStro

#### Written in 1994 for MS-DOS.

[Original package](https://defacto2.net/f/a41896f)

![image](https://user-images.githubusercontent.com/513842/170976406-1618231e-a303-4ed9-91b4-c1c829d1f0b3.png)

---

```

▄██▀██▄ ███ ███ ███▀██▄ ▄██▀██▄ ███▀██▄ ███▀██▄ ███▀██▄ ███ ███ ▄██▀██▄ ███ ███
███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███
███ ███ ▀██▄███ ███▄██▀ ███▄▄	███▄██▀ ███ ███ ███▄██▀ ███ ███ ███ ███ ███▄██▀
███	▄▄  ███ ███ ███ ███  ▄█ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███
███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███
███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███ ███
██  ███ ███ ███ ███ ███ ███ ███ ███ ███     ███ ███ ███ ███ ███ ███ ███ ███ ███
▀█▄▄██▀ ▀█████▀ ███▄██▀ ▀██▄██▀ ███ ███ █  ▄██▀ ███ ███ ▀██▄██▀ ███ ███ ███ ███
──────────--∙ @XP¿OΓ@ ViΓtU/┤¿ ƒ/┤∩t/┤Si@S ß@YO∩δ iM/┤Gi∩/┤tiO∩ ∙--────--=[XPL]


Well finally it's out...

The sourcecode for the first CyberDrunk BBStro... Hope you can learn from it.
Credits are inside the Source.

These are the most essential files in this pack:

  CYBRDRNK.ASM	    guess what...
  HSI2RAWP.C	    the HSIraw-2-RAWPlanes Converter-Source-C-ode
  CYBRDRNK.EXE	    already compiled, so take a look at it...

For a testcompilation start MAKE.BAT

If you'd like to contact me, leave a mail at

  POLYMORPH LIGHTS
  FARPOINT STATION
  POINTBREAK
  WONDERLAND

or just send a mail to CHRIS CEMPER @ 2:310/64.17 @ FIDO

Love2Love,
  CC
  c
  \/ JeZ
```

---

```
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
```
