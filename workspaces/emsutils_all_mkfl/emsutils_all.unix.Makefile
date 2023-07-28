

targetName=emsutils_all

mkfile_path		=  $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir		=  $(shell dirname $(mkfile_path))

ifndef emsutilsRepoRoot
        emsutilsRepoRoot	:= $(shell curDir=`pwd` && cd $(mkfile_dir)/../.. && pwd && cd ${curDir})
endif


all:
	$(MAKE) -f $(emsutilsRepoRoot)/prj/tests/emsutils_unit_test_mult/emsutils_unit_test.unix.Makefile			&& \
	$(MAKE) -f $(emsutilsRepoRoot)/prj/tests/any_quick_test_mkfl/any_quick_test.unix.Makefile

.PHONY: clean
clean:
	$(MAKE) -f $(emsutilsRepoRoot)/prj/tests/emsutils_unit_test_mult/emsutils_unit_test.unix.Makefile clean
	$(MAKE) -f $(emsutilsRepoRoot)/prj/tests/any_quick_test_mkfl/any_quick_test.unix.Makefile clean
	
