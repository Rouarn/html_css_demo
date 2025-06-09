@echo off
setlocal enabledelayedexpansion

echo 正在批量重命名文件为文件夹名（排除图片文件）...
echo.
 .png .gif .bmp .webp .tiff .svg"

:: 遍历当前目录下的所有文件夹
for /d %%F in (*) do (
    set "folder_name=%%F"
    echo 处理文件夹: !folder_name!

    :: 遍历文件夹内的文件
    for %%A in ("%%F\*.*") do (
        set "filename=%%~nA"
        set "file_ext=%%~xA"
        set "is_image=0"

        :: 检查是否是图片文件
        for %%I in (%image_ext%) do (
            if /i "!file_ext!" == "%%I" set "is_image=1"
        )

        :: 如果不是图片文件，则重命名
        if !is_image! == 0 (
            set "new_name=!folder_name!!file_ext!"
            if not "!filename!!file_ext!" == "!new_name!" (
                ren "%%A" "!new_name!"
                echo    重命名: %%~nxA → !new_name!
            )
        )
    )
)

echo.
echo 操作完成！
pause