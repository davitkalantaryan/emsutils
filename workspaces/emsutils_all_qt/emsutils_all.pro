

TEMPLATE = subdirs
#CONFIG += ordered

include ( "$${PWD}/../../prj/common/common_qt/flagsandsys_common_private.pri" )


SUBDIRS		+=	"$${emsutilsRepoRoot}/prj/tests/any_quick_test_qt/any_quick_test.pro"
SUBDIRS		+=	"$${emsutilsRepoRoot}/prj/tests/emsutils_unit_test_mult/emsutils_unit_test.pro"

cinternalFromHere{
        SUBDIRS	+= "$${cinternalRepoRoot}/workspaces/cinternal_all_qt/cinternal_all.pro"
}


OTHER_FILES += $$files($${emsutilsRepoRoot}/scripts/*.sh,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/scripts/*.bat,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/scripts/.cicd/*.sh,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/scripts/.cicd/*.bat,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/scripts/.raw/*.sh,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/scripts/.raw/*.bat,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/docs/*.md,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/docs/*.txt,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/.github/*.yml,true)
OTHER_FILES += $$files($${emsutilsRepoRoot}/prj/common/common_mkfl/*.Makefile)


OTHER_FILES	+=	\
        "$${emsutilsRepoRoot}/.gitattributes"						\
	"$${emsutilsRepoRoot}/.gitignore"						\
	"$${emsutilsRepoRoot}/.gitmodules"						\
	"$${emsutilsRepoRoot}/LICENSE"							\
	"$${emsutilsRepoRoot}/README.md"
