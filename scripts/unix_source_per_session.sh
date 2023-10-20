

if [ $# -eq 0 ]; then
	if [ $0 != "/bin/bash" -a $0 != "bash" -a $0 != "-bash" ]; then
		sourcePath_local=`bash -c "source $0 1"`
	else
		sourcePath_local=${BASH_SOURCE[0]}
	fi
else
	if [ $# -eq 1 ]; then
		echo ${BASH_SOURCE[0]}
		return 0
	else
		sourcePath_local=${1}
	fi
fi


makeMainJob (){

	local sourcePath=${sourcePath_local}
	unset sourcePath_local
	echo sourcePath=$sourcePath

	local currentDirectory=`pwd`
	echo currentDirectory=$currentDirectory

	# in mac short directory calculation based on n'readlink' or 'realpath' will not work
	local scriptDirectory=`dirname "${sourcePath}"`
	local scriptFileName=`basename "${sourcePath}"`
	cd "${scriptDirectory}"
	local fileOrigin=`readlink "${scriptFileName}"` || :
	while [ ! -z "${fileOrigin}" ]
	do
		local scriptDirectory=`dirname "${fileOrigin}"`
		local scriptFileName=`basename "${fileOrigin}"`
		cd "${scriptDirectory}"
		local fileOrigin=`readlink "${scriptFileName}"`  || :
	done
	cd ..
	emsutilsRepoRoot=`pwd`
	export emsutilsRepoRoot
	echo emsutilsRepoRoot=$emsutilsRepoRoot

	source ${emsutilsRepoRoot}/contrib/cinternal/scripts/unix_source_per_session.sh ${emsutilsRepoRoot}/contrib/cinternal/scripts/unix_source_per_session.sh ${emsutilsRepoRoot}/contrib/cinternal/scripts/unix_source_per_session.sh

	case "$LD_LIBRARY_PATH" in
		${emsutilsRepoRoot}/sys/$lsbCode/Debug/lib:${emsutilsRepoRoot}/sys/$lsbCode/Release/lib:* )
			echo "LD_LIBRARY_PATH for emsutils has been already set"
			;;
		* )
			export LD_LIBRARY_PATH=${emsutilsRepoRoot}/sys/$lsbCode/Debug/lib:${emsutilsRepoRoot}/sys/$lsbCode/Release/lib::$LD_LIBRARY_PATH
			;;
	esac
	
	if [ -z "$EMSDK_FOR_EMSUTILS_SET03" ]
	then
	    source ${emsutilsRepoRoot}/contrib/emsdk/emsdk_env.sh
	    export EMSDK_FOR_EMSUTILS_SET03=1
	else
	      echo "emscriptian already inited"
	fi

	cd ${currentDirectory}
}


makeMainJob
return 0
