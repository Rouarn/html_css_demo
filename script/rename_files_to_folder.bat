@echo off
setlocal enabledelayedexpansion

echo ���������������ļ�Ϊ�ļ��������ų�ͼƬ�ļ���...
echo.
 .png .gif .bmp .webp .tiff .svg"

:: ������ǰĿ¼�µ������ļ���
for /d %%F in (*) do (
    set "folder_name=%%F"
    echo �����ļ���: !folder_name!

    :: �����ļ����ڵ��ļ�
    for %%A in ("%%F\*.*") do (
        set "filename=%%~nA"
        set "file_ext=%%~xA"
        set "is_image=0"

        :: ����Ƿ���ͼƬ�ļ�
        for %%I in (%image_ext%) do (
            if /i "!file_ext!" == "%%I" set "is_image=1"
        )

        :: �������ͼƬ�ļ�����������
        if !is_image! == 0 (
            set "new_name=!folder_name!!file_ext!"
            if not "!filename!!file_ext!" == "!new_name!" (
                ren "%%A" "!new_name!"
                echo    ������: %%~nxA �� !new_name!
            )
        )
    )
)

echo.
echo ������ɣ�
pause