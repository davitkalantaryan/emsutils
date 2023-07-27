#
# repo:		    cpputils
# file:		    Makefile (to create sss library)
# created on:	    2020 Dec 02
# created by:	
#


MakeFileName                    = cpputils_unit_test.windows.Makefile
TargetName			= cpputils_unit_test
TargetExtension			= exe
TargetCategory                  = test

# this is set automatically when needed
!IFNDEF MakeFileDir
MakeFileDir			= $(MAKEDIR)
!ENDIF


LINKER        			= link
DEFINES       			= $(DEFINES) /D "_WINDLL" /D "_MBCS" /D "CINTERNAL_UNIT_TEST_USE_GTEST_LIKE_MACROSES"

LIBS				= $(LIBS) "Ws2_32.lib"

Objects			=	..\contrib\cinternal\src\core\cinternal_core_unit_test_checks.x64_d_obj
Objects			=	$(Objects) ..\contrib\cinternal\src\core\cinternal_core_unit_test_main.x64_d_obj
Objects			=	$(Objects) ..\contrib\cinternal\src\core\cinternal_core_logger.x64_d_obj


#SourcesToCompile	=
#DirectoriesToCompile	= $(DirectoriesToCompile) nr-build\gen\cpp\sss\ssslang\antlr
DirectoriesToCompile	=
DirectoriesToCompile	= tests\googletest
DirectoriesToCompile	= $(DirectoriesToCompile) core

default: googletest


googletest: __preparationForSetObjects __setObjects


__buildGoogleTestLib:
	@cd $(MakeFileDir)
	@echo "!!!!!! 'msbuild -t:restore -p:RestorePackagesConfig=true' is not necessary anymore"

!include <$(RepoRootDir)\prj\common\common_mkfl\flagsandsys_common_private.windows.Makefile>
