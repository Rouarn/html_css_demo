@echo off
setlocal enabledelayedexpansion

:start
cls
echo 批量创建数字序列文件夹
echo.

set /p startNum=请输入起始数字: 
set /p endNum=请输入结束数字: 

:: 验证输入是否为数字
echo !startNum!| findstr /r "^[0-9]*$" >nul
if errorlevel 1 (
    echo 起始数字无效，请输入数字
    pause
    goto start
)

echo !endNum!| findstr /r "^[0-9]*$" >nul
if errorlevel 1 (
    echo 结束数字无效，请输入数字
    pause
    goto start
)

:: 验证起始数字是否小于等于结束数字
if !startNum! gtr !endNum! (
    echo 起始数字不能大于结束数字
    pause
    goto start
)

:: 创建文件夹
for /l %%i in (!startNum!, 1, !endNum!) do (
    if not exist "%%i" (
        mkdir "%%i"
        echo 已创建文件夹: %%i
    ) else (
        echo 文件夹已存在: %%i
    )
)

echo.
echo 文件夹创建完成！
pause