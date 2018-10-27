@echo off

REM this file must reside in /.babun/cygwin/bin/
REM finding babun's ansible binary
for /f "delims=" %%a in ('cygpath --windows /bin') do @set CYGWIN_BIN=%%a

REM set shell binary
set SH=%CYGWIN_BIN%\bash.exe

echo "Babun - Vagrant - Ansible compatibility script starting..."

REM passing parameters
set v_params=%*

"%SH%" -c "ansible-playbook-shim.sh %v_params%"
