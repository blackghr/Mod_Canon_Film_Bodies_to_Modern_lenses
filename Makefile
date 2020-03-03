
PROGRAMMER ?= usbtiny

all: old_canon_aperture_fix.hex

old_canon_aperture_fix.hex: old_canon_aperture_fix.asm
	avra -fI -l old_canon_aperture_fix.lst -o $@ $<

flash: old_canon_aperture_fix.hex
	avrdude -p attiny13 -c $(PROGRAMMER) -U flash:w:$< \
		-U lfuse:w:0x72:m \
		-U hfuse:w:0xfb:m

clean:
	rm -f *.hex *.lst *.cof *.obj
