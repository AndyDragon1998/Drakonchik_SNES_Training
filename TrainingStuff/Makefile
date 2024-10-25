GAMEBIN = Game.sfc

ASM:=ca65
LINKER:=ld65

MODE=--pause-mode=always

INC= Data/

CNFIG=Data/Config/lorom256k.cfg
LABEL=Data/Config/labels.txt
DEBUG=Data/Debug/debugOutput.txt

Image_png = $(wildcard Graphics/Images/*.png)
Image_pal = $(addprefix Graphics/Palettes/,$(notdir $(Image_png:%.png=%.pal)))
Image_map = $(addprefix Graphics/Maps/,$(notdir $(Image_png:%.png=%.map)))
Image_chr = $(addprefix Graphics/Tiles/,$(notdir $(Image_png:%.png=%.chr)))

#path to the superfamiconv
IMGCONV=$(HOME)/SNESDevelopment/ImageConversion/superfamiconv

#path to the emulator
EMULATOR=$(HOME)/SNESDevelopment/bsnes-plus/bsnes/out/bsnes

SRC = main.asm
BIN = main.o

.PHONY: all

all: $(GAMEBIN)

Graphics/Palettes/%.pal: Graphics/Images/%.png
	$(IMGCONV) -i $^ -p $@

Graphics/Maps/%.map: Graphics/Images/%.png
	$(IMGCONV) -i $^ -m $@

Graphics/Tiles/%.chr: Graphics/Images/%.png
	$(IMGCONV) -i $^ -t $@
	
$(GAMEBIN): $(Image_pal) $(Image_map) $(Image_chr)
	$(ASM) $(SRC) -g
	$(LINKER) -C $(CNFIG) -o $@ $(BIN) -Ln $(LABEL) --dbgfile $(DEBUG)


	
.PHONY: run

run:
	$(EMULATOR) $(GAMEBIN)
	
	
.PHONY: clean

clean:
	rm -f *.o *.sfc
	rm -f $(Image_pal) $(Image_map) $(Image_chr)
