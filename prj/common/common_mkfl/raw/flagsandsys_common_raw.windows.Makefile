#
# repo:		cpputils
# file:		flagsandsys_common_pure.windows.Makefile
# created on:	2020 Dec 14
# created by:	Davit Kalantaryan (davit.kalantaryan@desy.de)
# purpose:	This file can be only as include
#


!IFNDEF MakeFileDir
MakeFileDir			= $(MAKEDIR)\..
!ENDIF

!IFNDEF emsutilsRepoRoot
emsutilsRepoRoot	= $(MakeFileDir)\..\..\..
!ENDIF

!IFNDEF artifactRoot
artifactRoot	= $(emsutilsRepoRoot)
!ENDIF

!IFNDEF cinternalRepoRoot
cinternalRepoRoot	= $(emsutilsRepoRoot)\contrib\cinternal
!ENDIF

!include <$(cinternalRepoRoot)\prj\common\common_mkfl\flagsandsys_common.windows.Makefile>

CFLAGS				= $(CFLAGS) /I"$(emsutilsRepoRoot)\include"

LFLAGS				= $(LFLAGS) /LIBPATH:"$(emsutilsRepoRoot)\sys\win_$(Platform)\$(Configuration)\lib"
LFLAGS				= $(LFLAGS) /LIBPATH:"$(emsutilsRepoRoot)\sys\win_$(Platform)\$(Configuration)\tlib"
