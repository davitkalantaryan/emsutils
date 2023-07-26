

@echo off
setlocal EnableDelayedExpansion

rem some definations
set "Platform=x64"
set "Configuration=Debug"
rem set "ActionConfirm=build"

set scriptDirectory=%~dp0
cd /D %scriptDirectory%..\..
set "repositoryRoot=%cd%\"

cd "%repositoryRoot%prj\tests\cpputils_unit_test_mult"
if not "!ERRORLEVEL!"=="0" (exit /b !ERRORLEVEL!)
call nmake -f cpputils_unit_test.windows.Makefile Platform=!Platform! Configuration=!Configuration!
if not "!ERRORLEVEL!"=="0" (exit /b !ERRORLEVEL!)


exit /b 0

endlocal
