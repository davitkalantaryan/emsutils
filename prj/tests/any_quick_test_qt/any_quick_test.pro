#
# repo:			emsutils
# file:			any_quick_test.pro
# path:			prj/tests/any_quick_test_qt/any_quick_test.pro
# created on:	2021 Mar 07
# created by:	Davit Kalantaryan
#

message("!!! $${_PRO_FILE_}")
include ( "$${PWD}/../../common/common_qt/flagsandsys_common.pri" )
DESTDIR     = "$${artifactRoot}/sys/$${CODENAME}/$$CONFIGURATION/test"

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


SOURCES	+=		\
	"$${PWD}/../../../src/tests/main_any_quick_test.cpp"			\
	"$${PWD}/../../../src/core/emsutils_core_emscripten.cpp"	

HEADERS += $$files($${emsutilsRepoRoot}/include/*.h,true)
HEADERS += $$files($${emsutilsRepoRoot}/include/*.hpp,true)

OTHER_FILES += $$files($${PWD}/../any_quick_test_mkfl/*.Makefile,false)
