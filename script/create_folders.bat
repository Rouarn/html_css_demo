@echo off
setlocal enabledelayedexpansion

:start
cls
echo �����������������ļ���
echo.

set /p startNum=��������ʼ����: 
set /p endNum=�������������: 

:: ��֤�����Ƿ�Ϊ����
echo !startNum!| findstr /r "^[0-9]*$" >nul
if errorlevel 1 (
    echo ��ʼ������Ч������������
    pause
    goto start
)

echo !endNum!| findstr /r "^[0-9]*$" >nul
if errorlevel 1 (
    echo ����������Ч������������
    pause
    goto start
)

:: ��֤��ʼ�����Ƿ�С�ڵ��ڽ�������
if !startNum! gtr !endNum! (
    echo ��ʼ���ֲ��ܴ��ڽ�������
    pause
    goto start
)

:: �����ļ���
for /l %%i in (!startNum!, 1, !endNum!) do (
    if not exist "%%i" (
        mkdir "%%i"
        echo �Ѵ����ļ���: %%i
    ) else (
        echo �ļ����Ѵ���: %%i
    )
)

echo.
echo �ļ��д�����ɣ�
pause