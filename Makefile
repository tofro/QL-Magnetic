# Makefile for Magnetic
ASM  = win1_assembler_qmac
LK   = win1_assembler_qlink
LD   = win1_c68_ld
MK   = win1_c68_make
SH   = win1_c68_sh
TC   = win1_c68_touch
RM   = win1_c68_rm

#
# Assembler command line options
#
ASMCMD   = -list -link

TEMP=-tmpram2_
CFLAGS = ${TEMP} -h -O -stackopt=maximum -extension=yes -maxerr=5
LFLAGS=-ms
EXEC=ram1_magnetic_exe
TEST=ram1_test_exe

LIBS=-lm
LIB_PATHS=-Lwin1_c68_lib

# This is what we build
OBJECTS= main_o emu_o graphics_o ql_o
TESTOBJECTS=test_o mode8i_rel

ASMOBJECTS=mode8i_rel ipcom_rel

${EXEC}: ${OBJECTS} ${ASMOBJECTS}
  ld -o${EXEC} ${LIB_PATHS} ${LFLAGS} ${OBJECTS} ${ASMOBJECTS} ${LIBS}


all: ${OBJECTS}

ram1_test_exe: mode8i_rel test_o
  ld -o${TEST} ${LIB_PATHS} ${LFLAGS} ${TESTOBJECTS} ${LIBS}

clean:
	rm *_o *.o *_list *_rel ${EXEC} 

graphics.o: graphics.c graphics.h
main_o: ql_types_h
mode8i_rel: mode8i_asm

_asm_rel:
    ${ASM} $C$*_asm ${ASMCMD}

#End of Makefile
