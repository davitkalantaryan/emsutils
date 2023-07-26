
!IFNDEF cutilsRepoRoot
cpputilsRepoRoot	= $(MAKEDIR)\..\..\..
!ENDIF

!include <$(cpputilsRepoRoot)\prj\common\common_mkfl\flagsandsys_common_private_pure.windows.Makefile>


!IFNDEF cinternalRepoRoot
cinternalRepoRoot	= $(cpputilsRepoRoot)\contrib\cinternal
!ENDIF

!include <$(cinternalRepoRoot)\prj\common\common_mkfl\flagsandsys_common_pure.windows.Makefile>
