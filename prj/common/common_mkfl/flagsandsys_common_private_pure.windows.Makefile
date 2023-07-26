
!IFNDEF cpputilsRepoRoot
cpputilsRepoRoot	= $(MAKEDIR)\..\..\..
!ENDIF

!include <$(cpputilsRepoRoot)\prj\common\common_mkfl\flagsandsys_common_pure.windows.Makefile>

CFLAGS				= $(CFLAGS) /I"$(cpputilsRepoRoot)\src\include"
