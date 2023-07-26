
targetName=cpputils_unit_test

mkfile_path		=  $(abspath $(lastword $(MAKEFILE_LIST)))
mkfile_dir		=  $(shell dirname $(mkfile_path))


firstTarget: all

include $(mkfile_dir)/../../common/common_mkfl/flagsandsys_common_private.unix.Makefile

GTEST_SRC_DIR=$(cpputilsRepoRoot)/src/tests/unit_test
COMMON_SRC_DIR=$(cpputilsRepoRoot)/src/core

GTEST_SRCS	= $(shell find $(GTEST_SRC_DIR) -name "*.cpp")
COMMON_SRCS	= $(shell find $(COMMON_SRC_DIR) -name "*.cpp")

CPPFLAGS += -I$(cpputilsRepoRoot)/contrib/googletest/googletest/include
# c=+ 11 is needed for google test
CPPFLAGS += -std=c++11

LIBS += -pthread

all: $(artifactRoot)/sys/$(lsbCode)/$(Configuration)/test/$(targetName)

$(artifactRoot)/sys/$(lsbCode)/$(Configuration)/test/$(targetName): \
			$(GTEST_SRCS:%=$(artifactRoot)/sys/$(lsbCode)/$(Configuration)/.objects/$(targetName)/%.o)	\
			$(COMMON_SRCS:%=$(artifactRoot)/sys/$(lsbCode)/$(Configuration)/.objects/$(targetName)/%.o)
	@mkdir -p $(@D)
	@$(LINK) $^ $(LIBS) $(LFLAGS) -o $@

.PHONY: clean
clean:
	@rm -rf $(artifactRoot)/sys/$(lsbCode)/$(Configuration)/.objects/$(targetName)
	@rm -f  $(artifactRoot)/sys/$(lsbCode)/$(Configuration)/test/$(targetName)
	@echo "  " cleaning of cpputils $(targetName) complete !!!
