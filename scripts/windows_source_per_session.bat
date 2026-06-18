::
:: repo:	    emsutils
:: file:	    windows_source_per_session.bat
:: path:	    scripts\windows_source_per_session.bat
:: created on:	2026 Jun 18
:: created by:	Davit Kalantaryan (davit.kalantaryan@desy.de)
:: notice:	    call this to initialize session for development
::

@echo off
setlocal EnableDelayedExpansion enableextensions

set  scriptDirectory=%~dp0
cd /D "%scriptDirectory%.."
set "emsutilsRepoRoot=%cd%"
set "repositoryRoot=%emsutilsRepoRoot%\"


endlocal & (
    call "%emsutilsRepoRoot%\contrib\cinternal\scripts\windows_source_per_session.bat"
    set "emsutilsRepoRoot=%emsutilsRepoRoot%"
)
