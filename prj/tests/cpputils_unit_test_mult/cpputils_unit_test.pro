#
# file:			cpputils_unit_test.pro
# path:			prj/tests/cpputils_unit_test_mult/cpputils_unit_test.pro
# created on:	2021 Mar 27
# created by:	Davit Kalantaryan
#

message("!!! $${_PRO_FILE_}")
include ( "$${PWD}/../../common/common_qt/flagsandsys_common.pri" )
DESTDIR     = "$${artifactRoot}/sys/$${CODENAME}/$$CONFIGURATION/test"

QT -= gui
QT -= core
QT -= widgets
CONFIG -= qt

win32{
} else {
	LIBS += -pthread
}

SRC_DIR=$${cpputilsRepoRoot}/src/tests/unit_test

DEFINES += CINTERNAL_UNIT_TEST_USE_GTEST_LIKE_MACROSES


SOURCES	+= $$files($${cpputilsRepoRoot}/src/core/*.cpp)  # I assume, that in core we will not have subdirs
COMMON_HDRS	= $$files($${cpputilsRepoRoot}/include/*.h,true)
COMMON_HDRSPP	= $$files($${cpputilsRepoRoot}/include/*.hpp,true)

UNITTEST_SRCS	= $$files($${SRC_DIR}/*.cpp,true)
UNITTEST_HDRS	= $$files($${SRC_DIR}/*.h,true)
UNITTEST_HDRSPP	= $$files($${SRC_DIR}/*.hpp,true)

SOURCES =  $$UNITTEST_SRCS
SOURCES += $$COMMON_SRCS
HEADERS =  $$UNITTEST_HDRS
HEADERS += $$UNITTEST_HDRSPP
HEADERS += $$COMMON_HDRS
HEADERS += $$COMMON_HDRSPP

OTHER_FILES += $$files($${PWD}/*.Makefile)
OTHER_FILES += "$${PWD}/packages.config.locked"
