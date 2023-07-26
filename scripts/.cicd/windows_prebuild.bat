

@echo off
setlocal EnableDelayedExpansion

set scriptDirectory=%~dp0
cd /D %scriptDirectory%..\..
set "repositoryRoot=%cd%\"

git submodule sync --recursive
git submodule update --init --recursive

endlocal
