#
# repo:         emsutils
# file:			emsutils_unit_test.pro
# path:			prj/tests/cpputils_unit_test_mult/cpputils_unit_test.pro
# created on:	2021 Mar 27
# created by:	Davit Kalantaryan
#

message("!!! $${_PRO_FILE_}")
include ( "$${PWD}/../../common/common_qt/flagsandsys_common.pri" )
DESTDIR = "$${ArifactFinal}/test"

QT -= gui
QT -= core
QT -= widgets
CONFIG -= qt
CONFIG += console

win32{
	LIBS += -lWs2_32
} else {
	LIBS += -pthread
}


DEFINES += CINTERNAL_UNIT_TEST_USE_GTEST_LIKE_MACROSES


SOURCES	+= $$files($${emsutilsRepoRoot}/src/core/*.cpp)  # I assume, that in core we will not have subdirs
SOURCES += $$files($${emsutilsRepoRoot}/src/tests/unit_test/*.cpp)

SOURCES +=  \
    "$${cinternalRepoRoot}/src/core/cinternal_core_logger.c"				\
    "$${cinternalRepoRoot}/src/core/cinternal_core_unit_test_checks.c"			\
    "$${cinternalRepoRoot}/src/core/cinternal_core_unit_test_main.c"



HEADERS =  $$files($${emsutilsRepoRoot}/include/*.h,true)
HEADERS += $$files($${emsutilsRepoRoot}/include/*.hpp,true)

OTHER_FILES += $$files($${PWD}/*.Makefile)
