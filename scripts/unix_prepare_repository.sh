#!/bin/bash

# script to prepare developer host, to work with the code on this repo

#scriptFileFullPath=`readlink -f ${0}`
#scriptDirectory=`dirname ${scriptFileFullPath}`
#cd ${scriptDirectory}/../..
#repositoryRoot=`pwd`

# in mac os above short calculation will not work
# also realpath utilit is missing in mac

scriptDirectory=`dirname "${0}"`
scriptFileName=`basename "${0}"`
cd "${scriptDirectory}"
fileOrigin=`readlink "${scriptFileName}"` || :
while [ ! -z "${fileOrigin}" ]
do
	scriptDirectory=`dirname "${fileOrigin}"`
	scriptFileName=`basename "${fileOrigin}"`
	cd "${scriptDirectory}"
	fileOrigin=`readlink "${scriptFileName}"`  || :
done
cd ..
emsutilsRepoRoot=`pwd`
echo emsutilsRepoRoot=$emsutilsRepoRoot

git submodule sync --recursive
git submodule update --init --recursive

./contrib/cinternal/scripts/unix_prepare_repository.sh


# Let's prepare emsdk
if [ -z "$emSdkVersion" ]; then
	#emSdkVersion=latest
	#emSdkVersion=1.39.8
	#emSdkVersion=2.0.14  # this is for 5.15
	emSdkVersion=3.1.25  # this is for 6.5
fi
if [[ ! -f "${emsutilsRepoRoot}/contrib/emsdk_version_${emSdkVersion}_prepared" ]]; then
	cd "${emsutilsRepoRoot}/contrib/emsdk"
	./emsdk install ${emSdkVersion}
	./emsdk activate ${emSdkVersion}
	touch "${emsutilsRepoRoot}/contrib/emsdk_version_${emSdkVersion}_prepared"
else
	cd "${emsutilsRepoRoot}/contrib/emsdk"
	echo "emsdk already prepared for this repository"
fi

#source ${repositoryRoot}/scripts/unix_source_per_session.sh ${repositoryRoot}/scripts/unix_source_per_session.sh ${repositoryRoot}/scripts/unix_source_per_session.sh
