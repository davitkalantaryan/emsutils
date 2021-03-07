

TEMPLATE = subdirs
#CONFIG += ordered


SUBDIRS		+=	$${PWD}/../../prj/tests/any_quick_test_qt/any_quick_test.pro

# devsheetlang.g4

OTHER_FILES	+=	\
	$${PWD}/../../.gitignore										\
	$${PWD}/../../README.md											\
	$${PWD}/../../scripts/.cicd/debian_prebuild.sh					\
	$${PWD}/../../scripts/linux_per_session.sh						\
	$${PWD}/../../scripts/part_debian_per_host_using_apt.sh			\
	$${PWD}/../../prj/contrib/antlr_mkfl/unix.antlrrt.Makefile		\
	$${PWD}/../../prj/common/common_mkfl/unix.common.Makefile		\
	$${PWD}/../../src/core/lang/devsheetlang.g4
