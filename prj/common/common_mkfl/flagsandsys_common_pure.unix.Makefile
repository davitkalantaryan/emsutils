

mkfile_path		=  $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir		=  $(shell dirname $(mkfile_path))

cpputilsRepoRoot	:= $(shell curDir=`pwd` && cd $(mkfile_dir)/../../.. && pwd && cd ${curDir})

ifndef artifactRoot
        artifactRoot	= $(cpputilsRepoRoot)
endif

include $(cpputilsRepoRoot)/contrib/cinternal/prj/common/common_mkfl/flagsandsys_common_pure.unix.Makefile
COMMON_FLAGS	+= -I$(cpputilsRepoRoot)/include
