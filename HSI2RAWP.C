

; HSIraw-2-RAWPlanes - Converter by JeZ (CHRIS CEMPER @ 2:310/64.17 @ FIDO)
;
; it takes the inputfile provided as the first argument on the commandline,
; presuming it to be a 16color-HSIraw-File, as produced for instance by
; Image Alchemy (Pic-Conv) and splits the Pixelinfo into the four essential
; Bitplanes needed for a 16color-VGA-Display.
; Then it saves them as the files MAP1 trough MAP4 and finally writes the
; VGA-palette into a file called PALETTE.
;
; these files are RAW and can easily be converted with BIN2DB (for instance)
; into ASM-src
;


#include "stdio.h"


typedef unsigned int WORD;
typedef unsigned char BYTE;

char HSI_ident[6]={ 0x6d,0x68,0x77,0x61, 0x6e, 0x68 };

struct HSI_head {
	char ident[6];	    // must be 0x6d 0x68 0x77 0x61 0x6e 0x68
	WORD version;
	WORD pix_width;
	WORD pix_height;
	WORD pal_size;	    // 0 means truecolor... else 2 to 256
	WORD h_dpi;
	WORD v_dpi;
	WORD gamma_hund;    // gamma of pic in hundreth (gamma=2.2 -> 220)
	char reserved [12];
	};


void swapb (WORD *b)
{
_AX=*b;
asm  xchg al,ah
*b=_AX;
}

main(int argc, char *argv[])
{
FILE *infile, *outfile, *o1,*o2,*o3,*o4;
struct HSI_head head;
int i,j,k;
BYTE pal[768];
BYTE in[8];
BYTE out[4];
long c,d,e;

if (argc<2)
	{
	printf("HSIraw-2-RAWPlanes Converter by JeZ\n\nUsage: HSI2RAWP <infile>");
	return (0);
	}


infile = fopen (argv[1], "rb");

if (infile==NULL)
	{
	printf("Error opening file...");
	return(-1);
	}

fread (&head, sizeof(head), 1, infile);

swapb (&head.version);
swapb (&head.pix_height);
swapb (&head.pix_width);
swapb (&head.pal_size);

printf ("\n%d x %d with %d-colorpalette", head.pix_width, head.pix_height, head.pal_size);

printf ("\nwriting palette.");

outfile = fopen ("palette", "wb");
fread (&pal, head.pal_size*3, 1, infile);
for (i=0;i<(head.pal_size*3);i++) pal[i]=pal[i]/4;
fwrite(&pal, head.pal_size*3, 1, outfile);
fclose (outfile);


printf ("\nwriting binaries.");

o1 = fopen ("map1", "wb");
o2 = fopen ("map2", "wb");
o3 = fopen ("map3", "wb");
o4 = fopen ("map4", "wb");


for (c=0;c<head.pix_height*(head.pix_width>>3); c++)
	{
	fread (&in, 8, 1, infile);
	out[0]=0;out[1]=0;out[2]=0;out[3]=0;
	for (i=0;i<8;i++)
		{
		for (j=0;j<4;j++) //4 maps
			{
			out[j]<<=1;
			out[j]+=((in[i]>>j)&1);
			}
		}
	fwrite (&out[0], 1, 1, o1);
	fwrite (&out[1], 1, 1, o2);
	fwrite (&out[2], 1, 1, o3);
	fwrite (&out[3], 1, 1, o4);
	}

fclose(o1);
fclose(o2);
fclose(o3);
fclose(o4);

fclose (infile);
}
