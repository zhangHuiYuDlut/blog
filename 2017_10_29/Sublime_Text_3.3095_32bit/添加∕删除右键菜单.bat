@ECHO OFF
PUSHD %~DP0
TITLE Sublime Text (���/ɾ���Ҽ��˵�)
echo.&echo ��� Sublime Text �Ҽ��˵�
echo.&echo ɾ�� Sublime Text �Ҽ��˵�
echo.&echo.
set /p a= �������ֻس���
if "%a%"=="y" Goto AddWebDetect
if "%a%"=="n" Goto AddYunShell
SET /P ST=����y����Ҽ��˵�������nɾ���Ҽ��˵���
if /I "%ST%"=="y" goto Add
if /I "%ST%"=="n" goto Remove
:Add
reg add "HKEY_CLASSES_ROOT\*\shell\SublimeText3" /ve /t REG_SZ /d "�� &SublimeText ��" /f
reg add "HKEY_CLASSES_ROOT\*\shell\SublimeText3\command" /ve /t REG_SZ /d "\"%~dp0sublime_text.exe\" ""%%1""" /f
SET E=���!&GOTO MSGBOX
:Remove
reg delete "HKLM\SOFTWARE\Classes\*\shell\SublimeText3" /f
reg delete "HKLM\SOFTWARE\Classes\Directory\shell\SublimeText3" /f
reg delete "HKLM\SOFTWARE\Classes\Directory\shell\SublimeText3" /f
reg delete "HKEY_CLASSES_ROOT\*\shell\SublimeText3" /f
SET E=���!&GOTO MSGBOX
:MsgBox
if "%1"=="" mshta VBScript:MsgBox("%e%",vbSystemModal,"")(close)& Cls&Goto Menu