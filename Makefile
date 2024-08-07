NAME = Game.sfc
ASM:=ca65
LINKER:=ld65
MODE=--pause-mode=always
INC= Data/
CNFG= Data/Config/lorom256k.cfg
LABEL=Data/Config/labels.txt
DEBUG=Data/Debug/debugOutput.txt

SRC = main.asm
BIN = main.o

all: $(SRC)
	$(ASM) $(SRC) -g
	$(LINKER) -C $(CNFG) -o $(NAME) $(BIN) -Ln $(LABEL) --dbgfile $(DEBUG)
	
.PHONY: clean

clean:
	rm -f *.o *.sfc
