@echo off
echo [DPT-SCRIPTS-CORE] Log started. >7z_install.log
reg Query "HKLM\Hardware\Description\System\CentralProcessor\0" | find /i "x86" > NUL && set OS=32BIT || set OS=64BIT >nul
if %OS%==32BIT goto x86_32
if %OS%==64BIT goto x86_64
echo [DPT-SCRIPTS-CORE] Unknown error, script terminated.  >>7z_install.log
exit

:x86_32
echo [DPT-SCRIPTS-CORE] Found a 32-bit OS  >>7z_install.log
echo [DPT-SCRIPTS-WORKER] Downloading 7-Zip...  >>7z_install.log
start /wait bitsadmin /transfer debjob /download /priority normal https://dl.comss.ru/download/7z1900.exe redist\7z\7z1900.exe  >>7z_install.log
echo [DPT-SCRIPTS-WORKER] Installing 7-Zip...  >>7z_install.log
start /wait .\redist\7z\7z1900.exe /S  >>7z_install.log
copy %PROGRAMFILES(x86)%\7-Zip\7z.exe .\7z.exe >>nul
echo [DPT-SCRIPTS-WORKER] 7z.exe copyied  >>7z_install.log
copy %PROGRAMFILES(x86)%\7-Zip\7z.dll .\7z.dll >>nul
echo [DPT-SCRIPTS-WORKER] 7z.dll copyied  >>7z_install.log
goto end

:x86_64
echo [DPT-SCRIPTS-CORE] Found a 64-bit OS  >>7z_install.log
echo [DPT-SCRIPTS-WORKER] Downloading 7-Zip...  >>7z_install.log
start /wait bitsadmin /transfer debjob /download /priority normal https://dl.comss.ru/download/7z1900x64.exe redist\7z\7z1900x64.exe  >>7z_install.log
echo [DPT-SCRIPTS-WORKER] Installing 7-Zip...  >>7z_install.log
start /wait .\redist\7z\7z1900x64.exe /S  >>7z_install.log
copy %PROGRAMFILES%\7-Zip\7-Zip\7z.exe .\7z.exe >>nul
echo [DPT-SCRIPTS-WORKER] 7z.exe copyied  >>7z_install.log
copy %PROGRAMFILES%\7-Zip\7-Zip\7z.dll .\7z.dll >>nul
echo [DPT-SCRIPTS-WORKER] 7z.dll copyied  >>7z_install.log
goto end

:end
exit