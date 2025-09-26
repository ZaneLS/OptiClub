@echo  off
mode 800
chcp 65001 >nul
title OptiClub V6.6-BETA -https://discord.gg/Np77z4C9qs
powershell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/MSI_UTIL_V3/refs/heads/main/Note.vbs" -OutFile "%temp%\Note.vbs"
start "" "%temp%\Note.vbs
color B
echo. 
echo. 
echo.                                   
echo.                              %p%░██╗░░░░░░░██╗███████╗██╗░░░░░░█████╗░░█████╗░███╗░░░███╗███████╗░
echo.                              %p%░██║░░██╗░░██║██╔════╝██║░░░░░██╔══██╗██╔══██╗████╗░████║██╔════╝░
echo.                              %p%░╚██╗████╗██╔╝█████╗░░██║░░░░░██║░░╚═╝██║░░██║██╔████╔██║█████╗░░░
echo.                              %p%░░████╔═████║░██╔══╝░░██║░░░░░██║░░██╗██║░░██║██║╚██╔╝██║██╔══╝░░░
echo.                              %p%░░╚██╔╝░╚██╔╝░███████╗███████╗╚█████╔╝╚█████╔╝██║░╚═╝░██║███████╗░
echo.                              %p%░░░╚═╝░░░╚═╝░░╚══════╝╚══════╝░╚════╝░░╚════╝░╚═╝░░░░░╚═╝╚══════╝░
echo.            %b%"══════════════════════════════════════════════════════════════════════════════════════════════════"%w%                                                                                                  
echo.                                           %w%  OptimizationClub's Hub V6         
echo.                                                                                                   
echo.
echo.                  I am not responsible for any problems/Damages with your pc this may cause (this barely happens)
echo.
echo.                    Press a Number on your keyboard followed by clicking you enter key to select an option
echo.
echo.                    Please Read All warnings, popups etc... dont just blindly press buttons without reading.
echo.
echo.            %b%"═══════════════════════════════════════════════════════════════════════════════════════════════════"
echo.
echo.
echo.                                          %w%    Press any key to continue...
pause >nul    

cls

:: Enable Delayed Expansion
setlocal enabledelayedexpansion

:: Set Powershell Execution Policy to Unrestricted
powershell "Set-ExecutionPolicy Unrestricted"

:: Enable ANSI Escape Sequences
reg add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "0" /f 

set z=[7m
set i=[1m
set q=[0m
echo %z%Do you want to Create a Restore Point?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto RestorePoint
if '%choice%'=='2' goto Continue
color b
:RestorePoint
:: Creating Restore Point
echo Creating Restore Point
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f
powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Optimization Club Restore Point' -RestorePointType 'MODIFY_SETTINGS'"
cls
md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\

echo HKLM, HKCU, HKCR Keys Exported in "Desktop\OptiClub\RegeditBackUpKeys"
REG EXPORT HKLM %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\HKLM.reg
REG EXPORT HKCU %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\HKCU.reg
REG EXPORT HKCR %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\HKCR.reg

timeout /t 2 /nobreak > NUL

start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\"
color B
:Continue
cls

:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f 

:: Getting Admin Permissions https://stackoverflow.com/questions/1894967/how-to-request-administrator-access-inside-a-batch-file
echo Checking for Administrative Privelages...
timeout /t 3 /nobreak > NUL
IF "%PROCESSOR_ARCHITECTURE%" EQU "amd64" (
>nul 2>&1 "%SYSTEMROOT%\SysWOW64\cacls.exe" "%SYSTEMROOT%\SysWOW64\config\system"
) ELSE (
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
)

if '%errorlevel%' NEQ '0' (
    goto UACPrompt
) else ( goto GotAdmin )

:UACPrompt
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\getadmin.vbs"
    set params= %*
    echo UAC.ShellExecute "cmd.exe", "/c ""%~s0"" %params:"=""%", "", "runas", 1 >> "%temp%\getadmin.vbs"

    "%temp%\getadmin.vbs"
    del "%temp%\getadmin.vbs"
    exit /B

:GotAdmin
    pushd "%CD%"
    CD /D "%~dp0"
	
	
chcp 65001 >nul
Reg.exe add "HKCU\CONSOLE" /v "VirtualTerminalLevel" /t REG_DWORD /d "1" /f
color b

:Menu
cls
color b
chcp 65001 >nul
mode con: cols=155 lines=45
cls
cls
echo.
echo.
echo.                                ██████╗ ██████╗ ████████╗██╗ ██████╗██╗     ██╗   ██╗██████╗ 	██╗   ██╗ ██████╗     ██████╗  
echo.                               ██╔═══██╗██╔══██╗╚══██╔══╝██║██╔════╝██║     ██║   ██║██╔══██╗	██║   ██║██╔════╝    ██╔════╝ 
echo.                               ██║   ██║██████╔╝   ██║   ██║██║     ██║     ██║   ██║██████╔╝	██║   ██║███████╗    ███████╗   
echo.                               ██║   ██║██╔═══╝    ██║   ██║██║     ██║     ██║   ██║██╔══██╗	╚██╗ ██╔╝██╔═══██╗   ██╔═══██╗   
echo.                               ╚██████╔╝██║        ██║   ██║╚██████╗███████╗╚██████╔╝██████╔╝	 ╚████╔╝ ╚██████╔╝██╗╚██████╔╝   
echo.                                ╚═════╝ ╚═╝        ╚═╝   ╚═╝ ╚═════╝╚══════╝ ╚═════╝ ╚═════╝ 	  ╚═══╝   ╚═════╝ ╚═╝ ╚═════╝ 
echo.                                                                                                                                                                         
echo.       %b%═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.       %b%
echo.       %w%                                                           %p%[%w%Z%p%]%w% Exit 																													
echo.       %w%                                                                                                                                                   
echo.       %w%                     %p%[%w%1%p%]%w% Optimize Performances             %p%[%w%2%p%]%w% Disable Services          %p%[%w%3%p%]%w% Disable Telemetry
echo.       %w%
echo.       %w%                     %p%[%w%4%p%]%w% Privacy Settings                  %p%[%w%5%p%]%w% Optimize Nvidia GPU       %p%[%w%6%p%]%w% Import CPU Powerplan
echo.       %w%
echo.       %w%                     %p%[%w%7%p%]%w% Optimize Windows Settings         %p%[%w%8%p%]%w% Debloat Windows           %p%[%w%9%p%]%w% Optimize Memory Management
echo.       %w%
echo.       %w%                     %p%[%w%10%p%]%w% Delete Temporary files           %p%[%w%11%p%]%w% Optimize AMD GPU	        %p%[%w%12%p%]%w% Internet Tweaks
echo.       %w%
echo.       %w%                     %p%[%w%13%p%]%w% Windows Apps Disabler            %p%[%w%14%p%]%w% FSO                      %p%[%w%15%p%]%w% All-In-One After install
echo.       %b%
echo.       %b%═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.       %w%                                                                                                                                                                                                                                      
echo.       %w%                     %p%[%w%A%p%]%w% UAC                               %p%[%w%B%p%]%w% Other Debloat Tools       %p%[%w%C%p%]%w% Discord
echo.       %w%                                                                                                                                                                                                                                                          
echo.       %b%═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.

color b

set /p input=:
color b
if /i %input% == 1 goto OptimizePerformances
if /i %input% == 2 goto DisableServices
if /i %input% == 3 goto DisableTelemetry
if /i %input% == 4 goto ChangePrivacySettings
if /i %input% == 5 goto ImportGPUNvidiaProfile
if /i %input% == 6 goto ImportCPUProfile
if /i %input% == 7 goto OptimizeWindowsSettings
if /i %input% == 8 goto DebloatWindows
if /i %input% == 9 goto OptimizeMemoryManagementAndUsage
if /i %input% == 10 goto CleanTempFiles
if /i %input% == 11 goto radeonOpti
if /i %input% == 12 goto NetworkTweaksPage
if /i %input% == 13 goto WindowsAppsDisabler
if /i %input% == 14 goto FSOChoices
if /i %input% == 15 goto AllInOneAfterInstall
if /i %input% == A goto UACEnblDsbl
if /i %input% == a goto UACEnblDsbl
if /i %input% == B goto Win10DebloatUIsnew
if /i %input% == b goto Win10DebloatUIsnew
if /i %input% == C start https://discord.gg/Np77z4C9qs
if /i %input% == c start https://discord.gg/Np77z4C9qs
if /i %input% == z exit
if /i %input% == Z exit

) ELSE (
echo Invalid Input & goto MisspellRedirect

:MisspellRedirect
color b
cls
echo Misspell Detected
timeout 2 
goto RedirectMenu

:RedirectMenu
cls
goto menu

:OptimizePerformances
color b
cls

echo %z%Windows 10 or Windows 11 ?%q%
echo.
echo %i%Windows 10 = 1%q%
echo.
echo %i%Windows 11 = 2%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto BCDTweaks
if '%choice%'=='2' goto OptimizePerformancesWindows11-10

:BCDTweaks
echo Exporting Current Settings (BCD)
bcdedit /export "%USERPROFILE%\Desktop\export_bcd.txt"
timeout /t 1 /nobreak > NUL
echo Applying MSI via BCD Tweaks
bcdedit /set MSI Default
timeout /t 1 /nobreak > NUL
echo Disabling uncontiguous portions of low-memory (may cause system freezes on unstable memory sticks)
bcdedit /set firstmegabytepolicy UseAll
bcdedit /set avoidlowmemory 0x8000000
bcdedit /set nolowmem Yes
timeout /t 1 /nobreak > NUL

goto OptimizePerformancesWindows11-10

:OptimizePerformancesWindows11-10
color b
cls
md %UserProfile%\Desktop\OptiClub\Win32PrioritySeparation\

PowerShell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/All-Win32Priority-Separation-Tweaks.png" -OutFile " %UserProfile%\Desktop\OptiClub\Win32PrioritySeparation\All-Win32Priority-Separation-Tweaks.png"
PowerShell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/All-Win32Priority-Separation-Tweaks-2.png" -OutFile " %UserProfile%\Desktop\OptiClub\Win32PrioritySeparation\All-Win32Priority-Separation-Tweaks-2.png"
PowerShell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/All-Win32Priority-Separation-Tweaks-3.png" -OutFile " %UserProfile%\Desktop\OptiClub\Win32PrioritySeparation\All-Win32Priority-Separation-Tweaks-3.png"
PowerShell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Recommended-Win32Priority-Separation-Tweak.png" -OutFile " %UserProfile%\Desktop\OptiClub\Win32PrioritySeparation\Recommended-Win32Priority-Separation-Tweak.png"

start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\Win32PrioritySeparation\"

echo Adding Win32Priority Separation Tweaks (Default value is "2", new one is "2")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "Win32PrioritySeparation" /t REG_DWORD /d "2" /f

timeout /t 1 /nobreak > NUL
cls
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Associations" /V "LowRiskFileTypes" /T "REG_SZ" /D ".avi;.bat;.cmd;.exe;.htm;.html;.lnk;.mpg;.mpeg;.mov;.mp3;.mp4;.mkv;.msi;.m3u;.rar;.reg;.txt;.vbs;.wav;.zip;.7z" /F
REG ADD "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\Attachments" /V "SaveZoneInformation" /T "REG_DWORD" /D "00000001" /F
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersionInternet Settings\Zones\3" /V "1806" /T "REG_DWORD" /D "00000000" /F
REG ADD "HKLM\Software\Microsoft\WindowsCurrentVersion\Internet Settings\Zones\3" /V "1806" /T "REG_DWORD" /D "00000000" /F
REG ADD "HKLM\SOFTWARE\Policies\Microsoft\Internet Explorer\Security" /V "DisableSecuritySettingsCheck" /T "REG_DWORD" /D "0" /F

timeout /t 1 /nobreak > NUL

cls
echo Changing "Performances" parameters
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "TaskbarAnimations" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "WindowAnimations" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "IconsOnly" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ThumbnailCacheSize" /t REG_DWORD /d 0 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "FontSmoothing" /t REG_DWORD /d 1 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Desktop" /v "VisualFXSetting" /t REG_DWORD /d 2 /f
REG ADD "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\VisualEffects" /v "MenuAnimations" /t REG_DWORD /d 0 /f
echo disabling smooth scroll (default value = deleted)
REG ADD "HKEY_CURRENT_USER\Control Panel\Desktop" /v "SmoothScroll" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > NUL

cls

echo Disabling Adaptive Refresh Rate
reg add "HKLM\CurrentControlSet\Control\Power\ModernSleep" /v "AdaptiveRefreshRate" /t REG_DWORD /d "0" /f

cls

echo disabling ThreadDPC (default value=deleted)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "ThreadDpcEnable" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls

echo Disabling GameBarPresenceWriter by regedit
reg add "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
echo Deleting/Rename GameBarPresenceWriter so it doesn't start anymore.
taskkill /im GameBarPresenceWriter.exe /f
takeown /f "%WinDir%\System32\GameBarPresenceWriter.exe" /a
icacls "%WinDir%\System32\GameBarPresenceWriter.exe" /grant:r Administrators:F /c
takeown /f "C:\Windows\System32\GameBarPresenceWriter.exe"
move "C:\Windows\System32\GameBarPresenceWriter.exe" "C:\Windows\System32\GameBarPresenceWriter.old"
taskkill /im GameBarPresenceWriter.exe /f
move "C:\Windows\System32\GameBarPresenceWriter.exe" "C:\Windows\System32\GameBarPresenceWriter.OLD"
timeout /t 3 /nobreak > NUL


timeout /t 1 /nobreak > NUL

cls

echo Adding key "IsLowPriority" for GPU Interference, this key is a "test" key and might not do anything (the default value is "1")
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\ThrottleGPUInterference" /v "IsLowPriority" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls

echo Disable TCP selective acks option for better CPU utilization (Default Value = 0/deleted on fresh install)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameter" /v "SackOpts" /t REG_DWORD /d "0" /f

timeout /t 1 /nobreak > NUL

cls

echo Disabling Tailored Experiences (Default value = 1..? (depends on the W10/11 Version/Tweaks already applied)
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f

timeout /t 1 /nobreak > NUL
cls

timeout /t 1 /nobreak > NUL
cls
color b
echo Disabling Transparency effects
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d 0 /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v EnableTransparency /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Enabling GameMode
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f 
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL
cls

echo Disabling Core Integrity (Default Value "1")
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Gamebar
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\GameDVR" /v "AppCaptureEnabled" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\WindowsRuntime\ActivatableClassId\Windows.Gaming.GameBar.PresenceServer.Internal.PresenceWriter" /v "ActivationType" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\ApplicationManagement" /v "AllowGameDVR" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL
reg add "HKEY_CURRENT_USER\System\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL
echo disabling BcastDRVUserService (default value = 3)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BcastDVRUserService" /v "Start" /t REG_DWORD /d "4" /f 
timeout /t 1 /nobreak > NUL

cls
color b
echo Enabling Hardware-Accelerated Gpu Scheduling (can cause issues for VR-Games)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchedMode" /t REG_DWORD /d "2" /f

echo "HAGS" apparently cause Stuttering problems ALL OVER windows 11, try it ON/OFF to see, sorry.

timeout /t 3 /nobreak > NUL

echo Enabling Windowed Game Optimizations and VRR for AMD
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;SwapEffectUpgradeEnable=1;" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Windows Insider Experiments
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Windows Tips
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Windows Spotlight
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Shared Experiences
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "NearShareChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Bing Search
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Background Apps
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo adding IRQ8 Priority (basic value doesn't exist, deleted)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

cls
echo Adding IRQ0 Priority
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ0Priority" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Adding MenuShowDelay tweak (basic value 1)
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
echo disabling power Throttling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL

cls

echo Disabling GPU Energy Driver
reg add "HKLM\SYSTEM\CurrentControlSet\Services\GpuEnergyDrv" /v "Start" /t REG_DWORD /d "4" /f
timeout /t 1 /nobreak > NUL

cls

echo Disabling Fast Startup
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls

echo Disabling Sleep Study
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

cls

echo Disabling Fault Tolerant Heap (default value "1")
reg add "HKLM\SOFTWARE\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

color b

goto ReduceSvcHosts

:ReduceSvcHosts
color b
cls
echo %z%Reduce SvcHosts?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%skip = 2%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableReduceSvcHostsScript
if '%choice%'=='2' goto performancesnew6
color b
:EnableReduceSvcHostsScript
color b
cls
echo %z%Select your Ram size?%q%
echo.
echo %i%4GB = 1%q%
echo.
echo %i%6GB = 2%q%
echo.
echo %i%8GB = 3%q%
echo.
echo %i%12GB = 4%q%
echo.
echo %i%16GB = 5%q%
echo.
echo %i%24GB = 6%q%
echo.
echo %i%32GB = 7%q%
echo.
echo %i%64GB = 8%q%
echo.
echo %i%128GB = 9%q%
echo.
echo %i%Revert = A%q%
echo.
echo %i%Auto = B%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto ReduceSvcHosts4GB
if '%choice%'=='2' goto ReduceSvcHosts6GB
if '%choice%'=='3' goto ReduceSvcHosts8GB
if '%choice%'=='4' goto ReduceSvcHosts12GB
if '%choice%'=='5' goto ReduceSvcHosts16GB
if '%choice%'=='6' goto ReduceSvcHosts24GB
if '%choice%'=='7' goto ReduceSvcHosts32GB
if '%choice%'=='8' goto ReduceSvcHosts64GB
if '%choice%'=='9' goto ReduceSvcHosts128GB
if '%choice%'=='A goto ReduceSvcHostsRevert
if '%choice%'=='a goto ReduceSvcHostsRevert
if '%choice%'=='B' goto ReduceSvcHostsAuto
if '%choice%'=='b' goto ReduceSvcHostsAuto
color b
:ReduceSvcHosts4GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "00400000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts6GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "00600000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts8GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "00800000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts12GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "00c00000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts16GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "01000000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts24GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "01800000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts32GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "02000000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts64GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "04000000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHosts128GB
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "08000000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHostsRevert
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "00380000" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:ReduceSvcHostsAuto
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v "SvcHostSplitThresholdInKB" /t REG_DWORD /d "4294967295" /f
echo Done.
timeout /t 5 /nobreak > NUL
goto performancesnew6

:performancesnew6
color b
cls


echo Disabling Memory Compression
PowerShell -Command "Disable-MMAgent -MemoryCompression"
timeout /t 1 /nobreak > NUL

echo Disabling Page Combining
PowerShell -Command "Disable-MMAgent -PageCombining"
timeout /t 1 /nobreak > NUL

echo Setting Game Priorities/MMCSS
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f
timeout /t 1 /nobreak > NUL

goto OptionalPerformancesTweaks
:OptionalPerformancesTweaks
color b
cls
echo %z%Would you like to use Optional Tweaks / VR Performances Tweaks?%q%
echo.
echo %i%Optional Performances Tweaks = 1%q%
echo.
echo %i%VR Optimization Tweaks = 2%q%
echo.
echo %i%skip = 3%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptionalPerformancesTweaks2
if '%choice%'=='2' goto VRTweaksForPerformances
if '%choice%'=='3' goto InSpectreThings

:OptionalPerformancesTweaks2
echo Downloading Autoruns in case you want to change settings
PowerShell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/MSI_UTIL_V3/refs/heads/main/Autoruns.exe" -OutFile "%temp%\Autoruns.exe"
start "" /wait "%temp%\Autoruns.exe"

cls
echo Download MSI UTIL V3 (Please set your GPU as "High" and make sure to chack on Msi checkbox)


powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/WhattodowithMSIUtil.txt" -OutFile "%temp%\WhatToDoWithMSIUtil.txt"
start "" "%temp%\WhatToDoWithMSIUtil.txt"


powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/MSI_util_v3.exe" -OutFile "%temp%\MSI_util_v3.exe"
start "" /wait "%temp%\MSI_util_v3.exe"

cls

echo starting System Performances. (Apply your settings)
%windir%\system32\SystemPropertiesPerformance.exe

goto InSpectreThings

:InSpectreThings
color b
cls
echo %z%Would you like to disable Meltdown Protection ?%q%
echo IMPORTANT ! : Disabling Meltdown and Spectre Protection is really risky.
echo Little Reminder! This will not help at all if your CPU is an Intel is higher than the 9Th Gen.
echo.
echo %i%Enable = 1%q%
echo.
echo %i%skip = 2%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto InSpectreDisabler
if '%choice%'=='2' goto Menu
color b

:InSpectreDisabler
color b
cls
echo Disable System Mitigations
echo Meltdown Protection/Spectre protection are really something you should keep activated.

powershell Invoke-WebRequest "https://www.grc.com/files/InSpectre.exe" -OutFile "%temp%\InSpectre.exe"
start "" /wait "%temp%\InSpectre.exe"

timeout /t 1 /nobreak > NUL

color b

goto Menu


:VRTweaksForPerformances
color b
cls
echo Disabling PC Asynchronous Spacewarp for Oculus PCVR
reg.exe add "HKLM\SOFTWARE\Oculus" /v "AswDisabled" /t REG_DWORD /d "1" /f
echo Disabling Link Sharpening
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Oculus\RemoteHeadset" /v "LinkSharpeningEnabled" /t REG_DWORD /d "2" /f
echo disabling HEVC-Codec for LINK
reg.exe add "HKEY_CURRENT_USER\SOFTWARE\Oculus\RemoteHeadset" /v "HEVC" /t REG_DWORD /d "0" /f
echo Adding "numSlices"
reg add "HKEY_CURRENT_USER\SOFTWARE\Oculus\RemoteHeadset" /v "numSlices" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/VR-Settings-Updated.txt" -OutFile "%temp%\VR-Settings.txt"
pause
start "" /wait "%temp%\VR-Settings.txt"

echo Downloading Meta Quest Link Optimized In-VR Desktop (No MSAA, Sharp Details, No smoothing)

md %UserProfile%\Documents\Dash\Preferences
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/dash.props" -OutFile "%UserProfile%\Documents\Dash\Preferences\dash.props"
timeout /t 1 /nobreak > NUL
cls
echo Disabling GPU-Web Acceleration on Steam
timeout /t 1 /nobreak > NUL
reg.exe add "HKCU\SOFTWARE\Valve\Steam" /v "GPUAccelWebViewsV3" /t REG_DWORD /d "0" /f
reg.exe add "HKCU\SOFTWARE\Valve\Steam" /v "H264HWAccel" /t REG_DWORD /d "0" /f

timeout /t 1 /nobreak > NUL

color b

goto Menu

:ImportGPUNvidiaProfile
cls

echo Enabling MSI Mode
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)
timeout /t 1 /nobreak > NUL

cls

echo Contigous Memory Allocation (Default value = deleted/0)
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PreferSystemMemoryContiguous" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

color b

cls

echo ReAllocating DMA Buffers (Default Value = 1/Depends on the GPU+DRIVER)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RmFbsrPagedDMA" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

echo MPO (Nvidia)
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "OverlayTestMode" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

echo Disable IndependentFlip, Force To Use Legacy Flip (Default value = deleted)
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm" /v "EnableIndependentFlip" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

echo Disabling TCC (Default value = DEPENDS ON THE GPU)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TCCSupported" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

echo Disabling NVIDIA Display Power Saving
reg add "HKLM\SYSTEM\CurrentControlSet\Services\nvlddmkm\Global\NVTweak" /v "DisplayPowerSaving" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

echo Disabling DirectX Event Tracking
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TrackResetEngine" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

echo Disabling High-bandwidth Digital Content Protection
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMHdcpKeyGlobZero" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

echo Disabling "Load-Balanced Power Gating"
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "RMElpgStateOnInit" /t REG_DWORD /d "3" /f 
timeout /t 1 /nobreak > NUL

cls
echo Applying a new Nvidia Profile
color b
timeout /t 1 /nobreak > NUL
echo Applying NVIDIA Inspector Profile (PLEASE MAKE SURE TO ENABLE RBAR IN THE APP, AND SET THE RIGHT SETTINGS IF NEEDED)
curl -g -k -L -# -o "%temp%\nvidiaProfileInspector.zip" "https://github.com/Orbmu2k/nvidiaProfileInspector/releases/latest/download/nvidiaProfileInspector.zip"
powershell -NoProfile Expand-Archive '%temp%\nvidiaProfileInspector.zip' -DestinationPath 'C:\NvidiaProfileInspector\'
curl -g -k -L -# -o "C:\NvidiaProfileInspector\Extreme2_VerticalSync_On3DGameSettings.nip" "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Extreme2_VerticalSync_On3DGameSettings.nip"
start "" /wait "C:\NvidiaProfileInspector\nvidiaProfileInspector.exe" "C:\NvidiaProfileInspector\Extreme2_VerticalSync_On3DGameSettings.nip"
start "" /wait "C:\NvidiaProfileInspector\nvidiaProfileInspector.exe"
echo Applying NVIDIA Inspector Profile (PLEASE MAKE SURE TO ENABLE RBAR IN THE APP, AND SET THE RIGHT SETTINGS IF NEEDED, AND MAKE SURE TO APPLY)
timeout /t 3 /nobreak > NUL

pause

goto Menu

:DisableServices
color 4
cls
echo Note! Please note that using some of those can "break" a few things within windows and "core componants" though,
echo it's mostly things like Microsoft Store, Windows Update or a few things, Just Re enable all services if you have a problem
echo (Warning for VR-Users, Disabling those services can "break" the "link" and stability of your VR Headset
pause
color b
cls
echo %z%Advanced or Basics?%q%
echo.
echo %i%Advanced = 1%q%
echo.
echo %i%Basics = 2%q%
echo.
echo %i%Untested (at your own risks) = 3%q%
echo.
echo %i%Revert Untested Services (FreshInstallSettings) = 4%q%
echo.
echo %i%Revert All (Basic) = 5%q%
echo.
echo %i%Revert All (FreshInstallSettings/Best) = 6%q%
echo.
echo %i%Enable Bluetooth and Wi-Fi = 7%q%
echo.
echo %i%Enable Microsoft Store = 8%q%
echo.
echo %i%Enable Windows Update = 9%q%
echo.
echo %i%Disable Intel(R) DAL Service = M%q%
echo.
echo %i%Disable WLAN Service (Useful if your internet is via an Ethernet Cable and you don't use Wi-Fi/Bluetooth) = D%q%
echo.
echo %i%Disable System Encryption Files (EFS) Service = B%q%
echo.
echo %i%Repair Notifications and ScreenSketch (Will start a few services) = N%q%
echo.
echo %i%Disable Other Services (will break things) = J%q%
echo.
echo %i%Enable Windows Search/Indexor = P%q%
echo.
echo %i%Menu = A%q%

color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto DisableUselessServicesAdvancedNew
if '%choice%'=='2' goto DisableUselessServicesBasicsNew
if '%choice%'=='3' goto UntestedServicesNew
if '%choice%'=='4' goto RevertUntestedServicesNew
if '%choice%'=='5' goto RevertAllServicesT
if '%choice%'=='6' goto revertallfreshinstallset
if '%choice%'=='7' goto bthwfsrvcsnbld
if '%choice%'=='8' goto enbldsblmcstre
if '%choice%'=='9' goto enblcwupdtsftwrsrvcs
if '%choice%'=='P' goto Wdsrchindexorchoice
if '%choice%'=='p' goto Wdsrchindexorchoice
if '%choice%'=='m' goto DisableIntelDynamicApplicationLoaderHostInterfaceService
if '%choice%'=='M' goto DisableIntelDynamicApplicationLoaderHostInterfaceService
if '%choice%'=='D' goto WlanSvcChoice
if '%choice%'=='d' goto WlanSvcChoice
if '%choice%'=='B' goto SystemEncryptionFilesServicesEFS
if '%choice%'=='b' goto SystemEncryptionFilesServicesEFS
if '%choice%'=='N' goto RepairScreenSketchAndNotifs
if '%choice%'=='n' goto RepairScreenSketchAndNotifs
if '%choice%'=='J' goto DisableMostServices
if '%choice%'=='j' goto DisableMostServices
if '%choice%'=='A' goto Menu
if '%choice%'=='a' goto Menu
color b





:DisableIntelDynamicApplicationLoaderHostInterfaceService
color b
cls
echo %z%Enable/Disable Intel Dynamic Application Loader Host Interface Service (INTEL-DAL INTERFACE) ?%q%
echo.
echo %i%Enable/Revert = 1%q%
echo.
echo %i%Disable = 2%q%
echo.
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnbljhiService
if '%choice%'=='2' goto DsbljhiService
color b

:EnbljhiService
color b
cls
color b
sc config jhi_service start= auto
sc start jhi_service
sc config WMIRegistrationService start= Auto
sc start WMIRegistrationService
cls
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:DsbljhiService
color b
cls
color b
sc config jhi_service start= disabled
sc stop jhi_service
sc config WMIRegistrationService start= disabled
sc stop WMIRegistrationService
cls
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b



:DisableMostServices
color b
cls
echo %z%Enable/Revert or Disable Services (will break things, this is optional and for tests only.)?%q%
echo.
echo %i%Enable/Revert = 1%q%
echo.
echo %i%Disable = 2%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableRvrtMostServices
if '%choice%'=='2' goto DisableMostServicesDisabler
color b
:EnableRvrtMostServices
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 3 /f
sc config DoSvc start= demand
sc start DoSvc
sc config netprofm start= demand
sc start netprofm
sc config EventLog start= auto
sc start EventLog
sc config WMPNetworkSvc start= auto
sc start WMPNetworkSvc
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:DisableMostServicesDisabler
color b
cls
echo default value = 3
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 4 /f
sc config DoSvc start= disabled
sc stop DoSvc
sc config stisvc start= disabled
sc stop stisvc
sc config netprofm start= disabled
sc stop netprofm
sc config EventLog start= disabled
sc stop EventLog
sc config WMPNetworkSvc start= disabled
sc stop WMPNetworkSvc
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:RepairScreenSketchAndNotifs
color b
cls
echo enabling services, this will Enable those : EFS, UevAgentService, WSearch, UsoSvc, WaaSMedicSvc, wuauserv
sc config EFS start= demand
sc start EFS
sc config UevAgentService start= demand
sc start UevAgentService
sc config WSearch start= demand
sc start WSearch
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc " /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 3 /f
sc start wuauserv
sc start WaaSMedicSvc
sc start UsoSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "DelayedAutostart" /t REG_DWORD /d 1 /f
sc start BITS
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:SystemEncryptionFilesServicesEFS
color b
cls
echo %z%Enable/Revert or Disable EFS Service (System Encryption Files, Security Use)?%q%
echo.
echo %i%Enable/Revert = 1%q%
echo.
echo %i%Disable = 2%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnblSystemEncryptionFilesServicesEFS
if '%choice%'=='2' goto DsblSystemEncryptionFilesServicesEFS
color b
:EnblSystemEncryptionFilesServicesEFS
color b
cls
sc config EFS start= demand
sc start EFS
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:DsblSystemEncryptionFilesServicesEFS
color b
cls
sc config EFS start= disabled
sc stop EFS
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:WlanSvcChoice
color b
cls
echo %z%Enable/Revert or Disable Wlan Service (Wi-Fi/Bluetooth)?%q%
echo.
echo %i%Enable/Revert = 1%q%
echo.
echo %i%Disable = 2%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnblWlanSvc
if '%choice%'=='2' goto DsblWlanSvc
color b
:EnblWlanSvc
color b
cls
sc config WlanSvc start= auto
sc start WlanSvc
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:DsblWlanSvc
color b
cls
sc config WlanSvc start= disabled
sc stop WlanSvc
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:Wdsrchindexorchoice
color b
cls
echo %z%Enable or Disable Windows Search/Indexor?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto windowsssearch
if '%choice%'=='2' goto windowssearchdisable
color b
:windowsssearch
color b
cls
sc config WSearch start= demand
sc start WSearch
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
:windowssearchdisable
color b
cls
sc config WSearch start= disabled
sc stop WSearch
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:enblcwupdtsftwrsrvcs
color b
cls
echo %z%Enable or Disable Windows Update?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto enblwupdtsftwr
if '%choice%'=='2' goto dsblwupdtsftr
color b
:enblwupdtsftwr
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc " /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "DelayedAutostart" /t REG_DWORD /d 1 /f
icacls "C:\Windows\System32\CompPkgSrv.exe" /remove:d Everyone
icacls "C:\Windows\System32\CompPkgSrv.exe" /setowner "NT Service\TrustedInstaller"
sc start BITS
sc start wuauserv
sc start WaaSMedicSvc
sc start UsoSvc

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:dsblwupdtsftr
color b
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc " /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 4 /f
sc stop BITS
sc stop wuauserv
sc stop WaaSMedicSvc
sc stop UsoSvc

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:enbldsblmcstre
color b
cls
echo %z%Enable or Disable Microsoft Store (Please, if this doesn't work enable windows update and restart your pc)?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto enblmcstr
if '%choice%'=='2' goto dsblmcstr
color b
:enblmcstr
color b
cls
sc config wlidsvc start= demand
sc config DusmSvc start= demand
sc config InstallService start= demand
sc config PcaSvc start= demand
sc config StorSvc start= demand
sc config UevAgentService start= demand
sc start UevAgentService
sc start StorSvc
sc start PcaSvc
sc start InstallService
sc start DusmSvc
sc start wlidsvc
sc config EFS start= demand
sc start EFS
sc config jhi_service start= auto
sc start jhi_service
sc config WlanSvc start= auto
sc start WlanSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "DelayedAutostart" /t REG_DWORD /d 1 /f
sc start BITS

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:dsblmcstr
color b
cls
sc config wlidsvc start= disabled
sc config DusmSvc start= disabled
sc config InstallService start= disabled
sc config PcaSvc start= disabled
sc config StorSvc start= disabled
sc config UevAgentService start= disabled
sc stop UevAgentService
sc stop StorSvc
sc stop PcaSvc
sc stop InstallService
sc stop DusmSvc
sc stop wlidsvc
sc config EFS start= disabled
sc stop EFS
sc config WlanSvc start= disabled
sc stop WlanSvc
sc config jhi_service start= disabled
sc stop jhi_service

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:bthwfsrvcsnbld
color b
cls
sc config Wcmsvc start= auto
sc start Wcmsvc
sc config WlanSvc start= auto
sc start WlanSvc
sc config NativeWifiP start= demand
sc start NativeWifiP
sc config NetSetupSvc start= demand
sc config Netman start= demand
sc config netprofm start= demand
sc config NlaSvc start= auto
sc config NcbService start= demand
sc config QWAVE start= auto
sc config BTAGService start= demand
sc config bthserv start= demand
sc config PcaSvc start= auto
sc config UevAgentService start= Auto
sc config ShellHWDetection start= auto
sc config DeviceAssociationService start= auto
sc config BthAvctpSvc start= auto
sc start BthAvctpSvc
sc start DeviceAssociationService
sc start Netman
sc start netprofm
sc start NlaSvc
sc start NetSetupSvc
sc start NcbService
sc start QWAVE
sc start bthserv
sc start BTAGService
sc start PcaSvc
sc start UevAgentService
sc start ShellHWDetection

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:revertallfreshinstallset
color b
cls
sc config AJRouter start= demand
sc config ALG start= demand
sc config AppHostSvc start= Auto
sc config AppIDSvc start= demand
sc config Appinfo start= demand
sc config AppMgmt start= demand
sc config AppReadiness start= demand
sc config AppXSvc start= demand
sc config aspnet_state start= demand
sc config AudioEndpointBuilder start= Auto
sc config Audiosrv start= Auto
sc config AxInstSV start= demand
sc config BDESVC start= demand
sc config BFE start= Auto
sc config BITS start= Auto
sc config BrokerInfrastructure start= Auto
sc config Browser start= demand
sc config BthHFSrv start= demand
sc config bthserv start= demand
sc config c2wts start= demand
sc config CDPSvc start= demand
sc config CertPropSvc start= demand
sc config ClipSVC start= demand
sc config COMSysApp start= demand
sc config CoreMessagingRegistrar start= Auto
sc config CryptSvc start= Auto
sc config CscService start= demand
sc config DcomLaunch start= Auto
sc config DcpSvc start= demand
sc config defragsvc start= demand
sc config DeviceAssociationService start= Auto
sc config DeviceInstall start= demand
sc config DevQueryBroker start= demand
sc config DhcpDhcp start= Auto
sc config diagnosticshub.standardcollector.service start= demand
sc config DiagTrack start= Auto
sc config DmEnrollmentSvc start= demand
sc config dmwappushservice start= Auto
sc config Dnscache start= Auto
sc config DoSvc start= Auto
sc config dot3svc start= demand
sc config DPS start= Auto
sc config DsmSvc start= demand
sc config DsRoleSvc start= demand
sc config DsSvc start= demand
sc config Eaphost start= demand
sc config EFS start= demand
sc config embeddedmode start= demand
sc config EntAppSvc start= demand
sc config EventLog start= Auto
sc config EventSystem start= Auto
sc config Fax start= demand
sc config fdPHost start= demand
sc config FDResPub start= demand
sc config fhsvc start= demand
sc config FontCache start= Auto
sc config FontCache3.0.0.0 start= demand
sc config ftpsvc start= Auto
sc config gpsvc start= Auto
sc config hidserv start= demand
sc config HomeGroupListener start= Auto
sc config HomeGroupProvider start= Auto
sc config HvHost start= Auto
sc config icssvc start= demand
sc config IEEtwCollectorService start= demand
sc config IISADMIN start= Auto
sc config IKEEXT start= demand
sc config iphlpsvc start= Auto
sc config iprip start= Auto
sc config KeyIso start= demand
sc config KtmRm start= demand
sc config LanmanServer start= Auto
sc config LanmanWorkstation start= Auto
sc config lfsvc start= demand
sc config LicenseManager start= demand
sc config lltdsvc start= demand
sc config lmhosts start= demand
sc config LPDSVC start= Auto
sc config LSM start= Auto
sc config MapsBroker start= Auto
sc config MpsSvc start= Auto
sc config MSDTC start= demand
sc config MSiSCSI start= demand
sc config msiserver start= demand
sc config MSMQ start= Auto
sc config MSMQTriggers start= Auto
sc config NcaSvc start= demand
sc config NcbService start= demand
sc config NcdAutoSetup start= demand
sc config Netlogon start= Auto
sc config Netman start= demand
sc config NetMsmqActivator start= Auto
sc config NetPipeActivator start= Auto
sc config netprofm start= demand
sc config NetSetupSvc start= demand
sc config NetTcpActivator start= Auto
sc config NetTcpPortSharing start= demand
sc config NgcCtnrSvc start= demand
sc config NgcSvc start= demand
sc config NlaSvc start= Auto
sc config nsi start= Auto
sc config p2pimsvc start= demand
sc config p2psvc start= demand
sc config PcaSvc start= Auto
sc config PeerDistSvc start= demand
sc config PerfHost start= demand
sc config pla start= demand
sc config PlugPlay start= demand
sc config PNRPAutoReg start= demand
sc config PNRPsvc start= demand
sc config PolicyAgent start= demand
sc config Power start= Auto
sc config PrintNotify start= demand
sc config ProfSvc start= Auto
sc config QWAVE start= demand
sc config RasAuto start= demand
sc config RasMan start= demand
sc config RemoteAccess start= Disabled
sc config RemoteRegistry start= Disabled
sc config RetailDemo start= demand
sc config RpcEptMapper start= Auto
sc config RpcLocator start= demand
sc config RpcSs start= Auto
sc config SamSs start= Auto
sc config SCardSvr start= Disabled
sc config ScDeviceEnum start= demand
sc config Schedule start= Auto
sc config SCPolicySvc start= demand
sc config SDRSVC start= demand
sc config seclogon start= demand
sc config SENS start= Auto
sc config SensorDataService start= demand
sc config SensorService start= demand
sc config SensrSvc start= demand
sc config SessionEnv start= demand
sc config SharedAccess start= demand
sc config ShellHWDetection start= Auto
sc config simptcp start= Auto
sc config smphost start= demand
sc config SmsRouter start= demand
sc config SNMP start= Auto
sc config SNMPTRAP start= demand
sc config Spooler start= Auto
sc config sppsvc start= Auto
sc config SSDPSRV start= demand
sc config SstpSvc start= demand
sc config StateRepository start= demand
sc config stisvc start= demand
sc config StorSvc start= demand
sc config svsvc start= demand
sc config swprv start= demand
sc config SysMain start= Auto
sc config SystemEventsBroker start= Auto
sc config TabletInputService start= Auto
sc config TapiSrv start= demand
sc config TermService start= Auto
sc config Themes start= Auto
sc config tiledatamodelsvc start= Auto
sc config TimeBroker start= demand
sc config TrkWks start= Auto
sc config TrustedInstaller start= demand
sc config UI0Detect start= demand
sc config UmRdpService start= demand
sc config upnphost start= demand
sc config UserManager start= Auto
sc config UsoSvc start= demand
sc config VaultSvc start= demand
sc config vds start= demand
sc config vmicguestinterface start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmicrdv start= demand
sc config vmicshutdown start= demand
sc config vmictimesync start= demand
sc config vmicvmsession start= demand
sc config vmicvss start= demand
sc config vmms start= Auto
sc config vmvss start= demand
sc config VSS start= demand
sc config W32Time start= Auto
sc config w3logsvc start= demand
sc config W3SVC start= Auto
sc config WalletService start= demand
sc config WAS start= demand
sc config wbengine start= demand
sc config WbioSrvc start= demand
sc config Wcmsvc start= Auto
sc config wcncsvc start= demand
sc config WcsPlugInService start= demand
sc config WdiServiceHost start= demand
sc config WdiSystemHost start= demand
sc config WdNisSvc start= demand
sc config WebClient start= demand
sc config Wecsvc start= demand
sc config WEPHOSTSVC start= demand
sc config wercplsupport start= demand
sc config WerSvc start= demand
sc config WiaRpc start= demand
sc config WinDefend start= Auto
sc config WinHttpAutoProxySvc start= demand
sc config Winmgmt start= Auto
sc config WinRM start= demand
sc config WlanSvc start= Auto
sc config wlidsvc start= demand
sc config wmiApSrv start= demand
sc config WMPNetworkSvc start= Auto
sc config Wms start= Auto
sc config WmsRepair start= Auto
sc config WMSVC start= demand
sc config workfolderssvc start= demand
sc config WPDBusEnum start= demand
sc config WpnService start= demand
sc config wscsvc start= Auto
sc config WSearch start= Auto
sc config WSService start= demand
sc config wuauserv start= demand
sc config wudfsvc start= demand
sc config WwanSvc start= Auto
sc config XblAuthManager start= demand
sc config XblGameSave start= demand
sc config XboxNetApiSvc start= demand
sc config wisvc start= demand
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc " /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CryptSvc" /v "Start" /t REG_DWORD /d 2 /f
sc config WMIRegistrationService start= demand
sc config UevAgentService start= demand
sc config tzautoupdate start= auto
sc config ssh-agent start= demand
sc config shpamsvc start= demand
sc config SCardSvr start= demand
sc config RemoteRegistry start= demand
sc config RemoteAccess start= demand
sc config MsKeyboardFilter start= demand
sc config InstallService start= demand
sc config DisplayEnhancementService start= demand
sc config DialogBlockingService start= demand
sc config BthAvctpSvc start= demand
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

color b

:RevertAllServicesT
color b
cls

echo basics
pause

sc config DiagTrack start= auto
sc config stisvc start= auto
sc config PhoneSvc start= auto
sc config SysMain start= auto
sc config TapiSrv start= auto
sc config Themes start= auto
sc config XboxGipSvc start= auto
sc config LanmanServer start= auto
sc config DisplayEnhancementService start= auto
sc config lfsvc start= auto
sc config RmSvc start= auto
sc config DPS start= auto
sc config TabletInputService start= auto
sc config edgeupdate start= auto
sc config edgeupdatem start= auto
sc config Spooler start= auto
sc config LanmanWorkstation start= auto
sc config DialogBlockingService start= auto
sc config RemoteAccess start= auto
sc config XblAuthManager start= auto
sc config MsKeyboardFilter start= auto
sc config DispBrokerDesktopSvc start= auto
sc config ssh-agent start= auto
sc config UevAgentService start= auto
sc config shpamsvc start= auto
sc config uhssvc start= auto
sc config AppVClient start= auto
sc config NetTcpPortSharing start= auto
sc config ALG start= auto
sc config RemoteRegistry start= auto
sc config wlidsvc start= auto
sc config BTAGService start= auto
sc config DusmSvc start= auto

echo others
pause

sc config FvSvc start= auto
sc config Fax start= auto
sc config XboxNetApiSvc start= auto
sc config WPDBusEnum start= auto
sc config InstallService start= auto
sc config FDResPub start= auto
sc config WMIRegistrationService start= auto
sc config WerSvc start= auto
sc config SmsRouter start= auto 
sc config BITS start= auto
sc config BDESVC start= auto
sc config BthAvctpSvc start= auto
sc config MicrosoftEdgeElevationService start= auto
sc config OneSyncSvc start= auto
sc config XblGameSave start= auto
sc config autotimesvc start= auto
sc config EventLog start= auto
sc config NvContainerLocalSystem start= auto
sc config NVDisplay.ContainerLocalSystem start= auto
sc config GamingServicesNet start= auto
sc config GamingServices start= auto
sc config RasMan start= auto
sc config PcaSvc start= auto
sc config ShellHWDetection start= auto
sc start ShellHWDetection
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppXSvc" /v "Start" /t REG_DWORD /d 3 /f
sc start AppXSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSVC" /v "Start" /t REG_DWORD /d 3 /f
sc start ClipSVC
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService" /v "Start" /t REG_DWORD /d 3 /f
sc start DeviceAssociationService
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 2 /f
sc config DoSvc start= auto
sc start DoSvc
sc config EventLog start= auto
sc start EventLog
sc config NcbService start= auto
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\netprofm" /v "Start" /t REG_DWORD /d 3 /f
sc start netprofm
sc config WpnService start= auto
sc start WpnService
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d 3 /f
sc config PimIndexMaintenanceSvc start= demand
sc start PimIndexMaintenanceSvc
sc config SENS start= auto
sc start SENS
sc config StorSvc start= auto
sc start StorSvc
sc config TrkWks start= auto
sc start TrkWks
sc config WbioSrvc start= auto
sc start WbioSrvc
sc config wisvc start= auto
sc start wisvc
sc config wuauserv start= demand
sc config WaaSMedicSvc start= demand
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc " /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 3 /f
sc start WaaSMedicSvc
sc start wuauserv
sc start UsoSvc
sc config WSearch start= auto
sc start WSearch
sc config EventSystem start= auto
sc start EventSystem
sc config SSDPSRV start= auto
sc start SSDPSRV
sc config tzautoupdate start= auto
sc start tzautoupdate
sc config RtkAudioUniversalService start= auto
sc start RtkAudioUniversalService
sc config bthserv start= auto
sc start bthserv
sc config WbioSrvc start= auto
sc start WbioSrvc
sc config W32Time start= auto
sc start W32Time
sc config GraphicsPerfSvc start= demand
sc start GraphicsPerfSvc
sc config SstpSvc start= demand
sc start SstpSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService" /v "Start" /t REG_DWORD /d 2 /f
sc config DeviceAssociationService start= auto
sc start DeviceAssociationService
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CryptSvc" /v "Start" /t REG_DWORD /d 2 /f
sc start CryptSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FontCache" /v "Start" /t REG_DWORD /d 2 /f
sc start FontCache
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d 3 /f
sc start QWAVE
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\dmwappushservice" /v "Start" /t REG_DWORD /d 2 /f
sc start dmwappushservice
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\diagnosticshub.standardcollector.service" /v "Start" /t REG_DWORD /d 2 /f
sc start diagnosticshub.standardcollector.service

color b

timeout /t 1 /nobreak > NUL

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:DisableUselessServicesAdvancedNew
color b
cls

echo basics
pause

sc config jhi_service start= disabled
sc stop jhi_service
sc config FvSvc start= disabled
sc config DiagTrack start= disabled
sc config stisvc start= disabled
sc config PhoneSvc start= disabled
sc config SysMain start= disabled
sc config TapiSrv start= disabled
sc config Themes start= disabled
sc config XboxGipSvc start= disabled
sc config LanmanServer start= disabled
sc config DisplayEnhancementService start= disabled
sc config lfsvc start= disabled
sc config RmSvc start= disabled
sc config DPS start= disabled
sc config TabletInputService start= disabled
sc config edgeupdate start= disabled
sc config edgeupdatem start= disabled
sc config Spooler start= disabled
sc config LanmanWorkstation start= disabled
sc config DialogBlockingService start= disabled
sc config RemoteAccess start= disabled
sc config XblAuthManager start= disabled
sc config MsKeyboardFilter start= disabled
sc config DispBrokerDesktopSvc start= disabled
sc config ssh-agent start= disabled
sc config UevAgentService start= disabled
sc config shpamsvc start= disabled
sc config uhssvc start= disabled
sc config AppVClient start= disabled
sc config NetTcpPortSharing start= disabled
sc config ALG start= disabled
sc config RemoteRegistry start= disabled
sc config wlidsvc start= disabled
sc config BTAGService start= disabled
sc config DusmSvc start= disabled

cls

echo others
pause

sc config Fax start= disabled
sc config XboxNetApiSvc start= disabled
sc config WPDBusEnum start= disabled
sc config InstallService start= disabled
sc config FDResPub start= disabled 
sc config WMIRegistrationService start= disabled
sc config WerSvc start= auto
sc config SmsRouter start= disabled 
sc config BITS start= disabled
sc config BDESVC start= disabled
sc config BthAvctpSvc start= disabled
sc config MicrosoftEdgeElevationService start= disabled
sc config OneSyncSvc start= disabled
sc config XblGameSave start= disabled
sc config autotimesvc start= disabled
sc config EventLog start= auto
sc config camsvc start= auto
sc config NvContainerLocalSystem start= disabled
sc config GamingServicesNet start= disabled
sc config GamingServices start= disabled
sc config RasMan start= disabled
sc config PcaSvc start= disabled
sc config ShellHWDetection start= disabled
sc stop ShellHWDetection
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService" /v "Start" /t REG_DWORD /d 4 /f
sc stop DeviceAssociationService
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 4 /f
sc config DoSvc start= disabled
sc stop DoSvc
sc config WpnService start= disabled
sc stop WpnService
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PimIndexMaintenanceSvc" /v "Start" /t REG_DWORD /d 4 /f
sc stop PimIndexMaintenanceSvc
sc config SENS start= disabled
sc stop SENS
sc config StorSvc start= disabled
sc stop StorSvc
sc config TrkWks start= Auto
sc config wisvc start= disabled
sc stop wisvc
sc config SSDPSRV start= disabled
sc stop SSDPSRV
sc config WSearch start= disabled
sc stop WSearch
sc config wisvc start= disabled
sc stop wisvc
sc config wuauserv start= disabled
sc config WaaSMedicSvc start= disabled
sc config EventSystem start= disabled
sc stop EventSystem
sc config SSDPSRV start= disabled
sc stop SSDPSRV
sc config tzautoupdate start= auto
sc config RtkAudioUniversalService start= disabled
sc stop RtkAudioUniversalService
sc config bthserv start= disabled
sc stop bthserv
sc config WbioSrvc start= disabled
sc stop WbioSrvc
sc config W32Time start= auto
sc config GraphicsPerfSvc start= disabled
sc stop GraphicsPerfSvc
sc config SstpSvc start= disabled
sc stop SstpSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DeviceAssociationService" /v "Start" /t REG_DWORD /d 4 /f
sc config DeviceAssociationService start= disabled
sc stop DeviceAssociationService
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lmhosts" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\QWAVE" /v "Start" /t REG_DWORD /d 4 /f
sc stop QWAVE
sc stop smphost
sc config smphost start= disabled
echo disabling a few other services
sc config MapsBroker start= disabled

cls

echo Windows update disable

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc " /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 4 /f

sc stop WaaSMedicSvc
sc stop wuauserv
sc stop UsoSvc

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:DisableUselessServicesBasicsNew
color b

cls

sc config DiagTrack start= disabled
sc config stisvc start= disabled
sc config PhoneSvc start= disabled
sc config SysMain start= disabled
sc config TapiSrv start= disabled
sc config Themes start= disabled
sc config XboxGipSvc start= disabled
sc config LanmanServer start= disabled
sc config DisplayEnhancementService start= disabled
sc config lfsvc start= disabled
sc config RmSvc start= disabled
sc config DPS start= disabled
sc config TabletInputService start= disabled
sc config edgeupdate start= disabled
sc config edgeupdatem start= disabled
sc config Spooler start= disabled
sc config LanmanWorkstation start= disabled
sc config DialogBlockingService start= disabled
sc config RemoteAccess start= disabled
sc config MsKeyboardFilter start= disabled
sc config DispBrokerDesktopSvc start= disabled
sc config ssh-agent start= disabled
sc config UevAgentService start= disabled
sc config shpamsvc start= disabled
sc config uhssvc start= disabled
sc config AppVClient start= disabled
sc config NetTcpPortSharing start= disabled
sc config ALG start= disabled
sc config RemoteRegistry start= disabled
sc config BTAGService start= disabled

echo others
pause

sc config Fax start= disabled
sc config XboxNetApiSvc start= disabled
sc config WPDBusEnum start= disabled
sc config InstallService start= disabled
sc config FDResPub start= disabled 
sc config WMIRegistrationService start= disabled
sc config WerSvc start= auto
sc config SmsRouter start= disabled 

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:UntestedServicesNew
color b
cls
echo Untested Services (at your own risks)
sc config NcbService start= disabled
sc stop NcbService
sc config WerSvc start= disabled
sc stop NcbService
sc config W32Time start= disabled
sc stop W32Time
sc config tzautoupdate start= disabled
sc stop tzautoupdate
sc config TrkWks start= Disabled
sc stop TrkWks
sc config swprv start= disabled
sc stop swprv
sc config CertPropSvc start= disabled
sc stop CertPropSvc
sc config UmRdpService start= disabled
sc stop UmRdpService
sc config TermService start= Disabled
sc stop TermService
sc config FrameServer start= disabled
sc stop FrameServer
sc config wlidsvc start= disabled
sc config XblAuthManager start= disabled
sc config CryptSvc start= disabled
sc stop CryptSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "DelayedAutostart" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d 4 /f
sc stop stisvc

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:RevertUntestedServicesNew
color b
cls
echo Untested Services (at your own risks)
sc config NcbService start= auto
sc start NcbService
sc config WerSvc start= auto
sc start NcbService
sc config W32Time start= auto
sc start W32Time
sc config tzautoupdate start= auto
sc start tzautoupdate
sc config TrkWks start= auto
sc start TrkWks
sc config swprv start= demand
sc start swprv
sc config CertPropSvc start= demand
sc start CertPropSvc
sc config UmRdpService start= demand
sc start UmRdpService
sc config TermService start= demand
sc start TermService
sc config FrameServer start= demand
sc start FrameServer
sc config Wcmsvc start= auto
sc start Wcmsvc
sc config wlidsvc start= demand
sc config XblAuthManager start= demand
sc config CryptSvc start= auto
sc start CryptSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "DelayedAutostart" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d 2 /f
sc start stisvc
sc start BITS

color b

timeout /t 5 /nobreak > NUL
goto Menu
color b
:DisableTelemetry
color b
cls
echo %z%Windows 10 or Windows 11 ?%q%
echo.
echo %i%Windows 10 = 1%q%
echo.
echo %i%Windows 11 = 2%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OOSU
if '%choice%'=='2' goto DisableTelemetryContinue


:OOSU
color b

cls

powershell Invoke-WebRequest "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -OutFile "%temp%\OOSU10.exe"
timeout /t 3 /nobreak > NUL
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/OptiClubV6.1_ooShutUpWindows.cfg" -OutFile "%temp%\OptiClub-TelemetryDisabler.cfg"
set OOSUPath="%temp%\OOSU10.exe"
set ConfigPath="%temp%\OptiClub-TelemetryDisabler.cfg"

if exist %OOSUPath% (
    if exist %ConfigPath% (
        %OOSUPath% %ConfigPath%
    )
)
start "" /wait "%temp%\OOSU10.exe
echo Done.
timeout /t 5 /nobreak > NUL
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/WPD.exe" -OutFile "%temp%\WPD.exe"
start "" /wait "%temp%\WPD.exe
echo Done.
timeout /t 1 /nobreak > NUL

goto DisableTelemetryContinue

:DisableTelemetryContinue
color b
cls
color b
echo Disable Telemetry Services
echo Disabling Telemetry Services 
sc stop DiagTrack 
sc config DiagTrack start= disabled 
sc stop dmwappushservice 
sc config dmwappushservice start= disabled 
sc stop diagnosticshub.standardcollector.service 
sc config diagnosticshub.standardcollector.service start= disabled 
timeout /t 1 /nobreak > NUL
cls
echo adding NDU Tweak
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 4 /f
cls
color b
echo Disabling Delivery Optimization
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL
echo disabling location Tracking
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SOFTWARE\\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
echo adding a few regedit Tweaks
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
reg add "HKCU\SOFTWARE\Policies\Microsoft\Windows\Windows Feeds" /v "EnableFeeds" /t REG_DWORD /d "0" /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Feeds" /v "ShellFeedsTaskbarViewMode" /d "2" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\Feeds" /v "IsFeedsAvailable" /d "2" /f
pause
echo Disabling Consumer Features (Windows 10 will not automatically install any games, third-party apps
echo or application links from the Windows Store for the signed-in user. Some default Apps will be inaccessible (eg. Phone Link)
pause
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f


reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvide" /t REG_DWORD /d "1" /f
color b
timeout /t 1 /nobreak > NUL
echo Done.

goto Menu

:ChangePrivacySettings
color b
cls
echo Setting Windows Privacy Settings
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\activity" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appDiagnostics" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\appointments" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\bluetoothSync" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\broadFileSystemAccess" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\cellularData\Microsoft.Win32WebViewHost_cw5n1h2txyewy" /v "Value" /t REG_SZ /d "Allow" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\chat" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\contacts" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\documentsLibrary" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\email" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\gazeInput" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location\Microsoft.Win32WebViewHost_cw5n1h2txyewy" /v "Value" /t REG_SZ /d "Prompt" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone" /v "Value" /t REG_SZ /d "Allow" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\microphone\Microsoft.Win32WebViewHost_cw5n1h2txyewy" /v "Value" /t REG_SZ /d "Prompt" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCall" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\phoneCallHistory" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\picturesLibrary" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\radios" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userAccountInformation\Microsoft.AccountsControl_cw5n1h2txyewy" /v "Value" /t REG_SZ /d "Prompt" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userDataTasks" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\userNotificationListener" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\videosLibrary" /v "Value" /t REG_SZ /d "Deny" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam" /v "Value" /t REG_SZ /d "Allow" /f 
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\webcam\Microsoft.Win32WebViewHost_cw5n1h2txyewy" /v "Value" /t REG_SZ /d "Allow" /f 
timeout /t 1 /nobreak > NUL

echo Disabling Location Tracking (FROM https://github.com/ChrisTitusTech/winutil/blob/main/config/tweaks.json)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
reg add "HKLM\SYSTEM\Maps" /v "AutoUpdateEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\lfsvc\Service\Configuration" /v "Status" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Sensor\Overrides\{BFA794E4-F964-4FDB-90F6-51056BFE4B44}" /v "SensorPermissionState" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\InputPersonalization\TrainedDataStore" /v "HarvestContacts" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\AdvertisingInfo" /v "Enabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\AdvertisingInfo" /v "DisabledByGroupPolicy" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo disabling error reporting
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
timeout /t 1 /nobreak > NUL
echo adding a few regedit Tweaks
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Privacy" /v "TailoredExperiencesWithDiagnosticDataEnabled" /t REG_DWORD /d "0" /f

reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "ContentDeliveryAllowed" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "FeatureManagementEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "OemPreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "PreInstalledAppsEverEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SilentInstalledAppsEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SlideshowEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SystemPaneSuggestionsEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Remote Assistance" /v "fAllowToGetHelp" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DriverSearching" /v "SearchOrderConfig" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo disabling AeroPeek
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
color b
timeout /t 1 /nobreak > NUL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
cls

echo Disable sending Windows Media Player statistics
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "TabServicesEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d "00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "00000000" /f

cls
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b

:ImportCPUProfile
color b
cls
echo %z%Windows 10 or 11 ?%q%
echo.
echo %i%Windows 10 = 1%q%
echo.
echo %i%Windows 11 = 2%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto IntelOrRyzenWindows10
if '%choice%'=='2' goto IntelOrRyzenWindows11


:IntelOrRyzenWindows10
color b
cls
echo %z%Intel or Ryzen ?%q%
echo.
echo %i%Intel = 1%q%
echo.
echo %i%Ryzen = 2%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto IntelCPUPowerplansAndTweaksWindows10
if '%choice%'=='2' goto RyzenCPUPowerplansAndTweaksWindows10

:IntelCPUPowerplansAndTweaksWindows10
color b
cls
powershell Invoke-WebRequest "https://github.com/Her-Starlight/MSI_UTIL_V3/raw/refs/heads/main/OptiClub-PowerplanV3.pow" -OutFile "%temp%\OptiClub-PowerplanV3.pow"
pause
powercfg -import "%temp%\OptiClub-PowerplanV3.pow"
start control powercfg.cpl
echo Successfully Imported Custom Powerplan
timeout /t 3 /nobreak > NUL

echo optimizing Power usage (CPU)

echo disabling Hibernation (Default value : "1") (useless if on desktop PC, good for laptops tho)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
powercfg.exe /hibernate off
cls
echo Disabling Power Throttling (Default Value = 1)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Disabling "EnergyEstimationEnabled" (Default Value = 1)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EnergyEstimationEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
echo Disabling "EventProcessorEnabled" (Default Value = 1)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "EventProcessorEnabled" /t REG_DWORD /d "0" /f

timeout /t 3 /nobreak > NUL

echo Disabling Energy Logging
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "DisableTaggedEnergyLogging" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxApplication" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\EnergyEstimation\TaggedEnergy" /v "TelemetryMaxTagPerApplication" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
echo Values :
echo "DisableTaggedEnergyLogging" Default Value = 0
echo "TelemetryMaxApplication" Default Value = 250
echo "TelemetryMaxTagPerApplication" Default Value = 50
timeout /t 1 /nobreak > NUL
echo Disabling Standby (CsEnabled+AoAcOverride) (Default Value = Deleted/None)
echo ###INFO###
echo Disabling standby "Prevents Windows from keeping apps in a low-power state, reducing background resource usage."
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "CsEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "PlatformAoAcOverride" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
powercfg -h off
pause

color b

goto Menu

:RyzenCPUPowerplansAndTweaksWindows10
color b
cls
color b
cls
powershell Invoke-WebRequest "https://github.com/Her-Starlight/MSI_UTIL_V3/raw/refs/heads/main/OptiClub-PowerplanV3.pow" -OutFile "%temp%\OptiClub-PowerplanV3.pow"
pause
powercfg -import "%temp%\OptiClub-PowerplanV3.pow"
start control powercfg.cpl
echo Successfully Imported Custom Powerplan
timeout /t 3 /nobreak > NUL

goto Menu

:IntelOrRyzenWindows11
color b
cls
echo %z%Intel or Ryzen ?%q%
echo.
echo %i%Intel = 1%q%
echo.
echo %i%Ryzen = 2%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto IntelCPUPowerplansAndTweaksWindows11
if '%choice%'=='2' goto RyzenCPUPowerplansAndTweaksWindows11

:IntelCPUPowerplansAndTweaksWindows11
color b
cls
powershell Invoke-WebRequest "https://github.com/Her-Starlight/MSI_UTIL_V3/raw/refs/heads/main/OptiClub-PowerplanV3.pow" -OutFile "%temp%\OptiClub-PowerplanV3.pow"
pause
powercfg -import "%temp%\OptiClub-PowerplanV3.pow"
start control powercfg.cpl
echo Successfully Imported Custom Powerplan
timeout /t 3 /nobreak > NUL

goto Menu

:RyzenCPUPowerplansAndTweaksWindows11
color b
cls

cls
powershell Invoke-WebRequest "https://github.com/Her-Starlight/MSI_UTIL_V3/raw/refs/heads/main/OptiClub-PowerplanV3.pow" -OutFile "%temp%\OptiClub-PowerplanV3.pow"
pause
powercfg -import "%temp%\OptiClub-PowerplanV3.pow"
start control powercfg.cpl
echo Successfully Imported Custom Powerplan
timeout /t 1 /nobreak > NUL

goto Menu

:OptimizeWindowsSettings
color b
cls
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d 1 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d 1 /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisableAnimations" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f 
timeout /t 3 /nobreak > NUL
cls
echo adding IRQ8 Priority (because, well.. yeah, IRQ8 Tweak/Priority is an Idea that has been around for like 20 years and will not die, some claim it doesn't do anything, others says it does...)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl" /v "IRQ8Priority" /t REG_DWORD /d "1" /f
pause
cls
echo Setting Up "NoLazyMode" (Test value, basic values are non existant so you can just delete those two in case there is a problem)
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NoLazyMode" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "AlwaysOn" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d "0" /f
timeout /t 3 /nobreak > NUL
echo Setting Game Priorities
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f 
pause
cls
echo LatencySensitive (Test value, this value doesn't exist normally so you can just delete it if there is a problem)
Reg.exe add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\DisplayPostProcessing" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d 1 /f
reg add "HKCU\Software\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL
cls
echo Adding Games Priority
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/6664447942.bat" -OutFile "%temp%\6664447942.bat"
start "" /wait "%temp%\6664447942.bat
echo Done.
timeout /t 1 /nobreak > NUL
cls
echo Reducing A few apps (Discord, Steam, Wallpaper) Priority
echo Note : If something goes wrong you can just delete the value.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steam.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamwebhelper.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Video.UI.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wallpaper32.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PhotosApp.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Reducing Svchost Priority (this *MAY* cause problems!)
echo Note : If something goes wrong you can just delete the value.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\svchost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Setting up Services Priorities
echo Note : If something goes wrong you can just delete the value.
echo Setting "lsass.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\lsass.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Setting "TrustedInstaller.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TrustedInstaller.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Setting "wuauclt.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wuauclt.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Setting "TextInputHost.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\TextInputHost.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Setting "PhotosService.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\PhotosService.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Setting "SearchIndexer.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\SearchIndexer.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f
timeout /t 1 /nobreak > NUL
echo Setting "vrmonitor.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrmonitor.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f
timeout /t 1 /nobreak > NUL
echo Setting "vrdashboard.exe" Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrdashboard.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "5" /f
timeout /t 1 /nobreak > NUL
echo Disabling msfeed sync.
msfeedssync disable
timeout /t 2 /nobreak > NUL
echo Disabling MicrosoftUpdate Icon in TaskbarAnimations
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "TrayIconVisibility" /t REG_DWORD /d "0" /f
timeout /t 2 /nobreak > NUL

cls

echo Done

color b

goto AMDPROCESSESLOWERER

:AMDPROCESSESLOWERER
color b
cls
echo %z%Do you have an AMD GPU, If so, Do you want to lower the priority of the AMD Driver Services ?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto AmdDriverServicesLower
if '%choice%'=='2' goto Menu

:AmdDriverServicesLower
color b
cls
echo Lowering Prorities

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cncmd.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\atieclxx.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f

timeout /t 2 /nobreak > NUL

echo Done!

goto Menu



:DebloatWindows
color b
cls

echo PowerShellPackages
echo Removing Unnecessary Powershell Packages
PowerShell -Command "Get-AppxPackage -allusers *bing* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *bingfinance* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *bingsports* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *BingWeather* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *CommsPhone* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *Drawboard PDF* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *Facebook* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *Getstarted* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *Microsoft.Messaging* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *MicrosoftOfficeHub* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *Office.OneNote* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *OneNote* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *people* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *SkypeApp* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *solit* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *Sway* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *Twitter* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *WindowsAlarms* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *WindowsPhone* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *WindowsMaps* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *WindowsFeedbackHub* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *WindowsSoundRecorder* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage -allusers *windowscommunicationsapps* | Remove-AppxPackage" 
PowerShell -Command "Get-AppxPackage Microsoft.XboxGamingOverlay | Remove-AppxPackage"

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Start\Companions\Microsoft.YourPhone_8wekyb3d8bbwe" /v "IsEnabled" /t REG_DWORD /d "00000000" /f 
   
timeout /t 5 /nobreak > NUL

cls

echo DisableOneDrive
echo Disabling OneDrive
start /wait "" "%SYSTEMROOT%\SYSWOW64\ONEDRIVESETUP.EXE" /UNINSTALL
rd C:\OneDriveTemp /q /s 
rd "%USERPROFILE%\OneDrive" /q /s 
rd "%LOCALAPPDATA%\Microsoft\OneDrive" /q /s 
rd "%PROGRAMDATA%\Microsoft OneDrive" /q /s 
reg add "HKCR\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v "Attributes" /t REG_DWORD /d "0" 
reg add "HKCR\Wow6432Node\CLSID\{018D5C66-4533-4307-9B53-224DE2ED1FE6}\ShellFolder" /f /v "Attributes" /t REG_DWORD /d "0" 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSync" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableFileSyncNGSC" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableMeteredNetworkFileSync" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\OneDrive" /v "DisableLibrariesDefaultSaveToOneDrive" /t REG_DWORD /d "0" /f 
timeout /t 3 /nobreak > NUL

cls

taskkill/im msedge.exe
cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application\1*\Installer
cd C:\Program Files (x86)\Microsoft\Edge\Application\125.0.2535.79\Installer
setup.exe --uninstall --system-level --verbose-logging --force-uninstall
rd /s /q "C:\Program Files (x86)\Microsoft\Edge"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView"
rd /s /q "C:\Program Files (x86)\Microsoft\Temp"
takeown /f "C:\Program Files (x86)\Microsoft"
reg add "HKLM\Software\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f 
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Edge_Removal.bat" -OutFile "%temp%\Edge_Removal.bat"
start "" "%temp%\Edge_Removal.bat
timeout /t 1 /nobreak > NUL
icacls "C:\Program Files (x86)\Microsoft" /deny Everyone:(X)
icacls "C:\Program Files (x86)\Microsoft\EdgeUpdate\MicrosoftEdgeUpdate.exe" /deny Everyone:(X)

del /q "C:\Program Files (x86)\Microsoft\EdgeUpdate\*"
echo Disabling Edge/I.E/WebView can cause problems on games like roblox
timeout /t 3 /nobreak > NUL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "EdgeShoppingAssistantEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "TabServicesEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "AlternateErrorPagesEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageContentEnabled" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "NewTabPageHideDefaultTopSites" /t REG_DWORD /d "00000001" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "DiagnosticData" /t REG_DWORD /d "00000000" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Edge" /v "PersonalizationReportingEnabled" /t REG_DWORD /d "00000000" /f

cls

echo DisableCortana
echo Disabling Cortana
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortana" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCloudSearch" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowCortanaAboveLock" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "AllowSearchToUseLocation" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWeb" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "ConnectedSearchUseWebOverMeteredConnections" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Search" /v "DisableWebSearch" /t REG_DWORD /d "0" /f 
Powershell -Command "Get-appxpackage -allusers *Microsoft.549981C3F5F10* | Remove-AppxPackage" 
timeout /t 3 /nobreak > NUL

color b

echo Done
pause

goto Menu

:OptimizeMemoryManagementAndUsage
color b
cls

echo %z%Enable/Disable Memory Optimizations (might cause problems when you run out of physical ram)?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable (revert to Fresh install settings) = 2%q%
echo.
echo %i%Xaiyot's Personal Config = 3%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto MemoManageAuSgEnbl
if '%choice%'=='2' goto MemoManageAuSgRevrtFrshInstall
if '%choice%'=='3' goto Xaiyotpersonalmemorymanagementconfig
color b
:MemoManageAuSgEnbl
color 4
cls

echo WARNING 
echo THIS WILL DISABLE THINGS LIKE PAGING EXECUTIVE, SO MAKE SURE YOU HAVE AT LEAST MORE THAN 16GB/32GB OF PHYSICAL RAM
pause
color b
cls

echo Enabling Memory Management Optimizations 

echo Disabling Paging Executive
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "1" /f 
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d "1" /f 

echo Disabling Prefetch and superfetch
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablingPrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablingSuperfetch" /t REG_DWORD /d "0" /f

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /t REG_DWORD /d "0" /f

echo Optimizing Memory Managment
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "1024" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "192" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "4294967295" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /t REG_DWORD /d "3" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /t REG_DWORD /d "96" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "Start" /t REG_DWORD /d "4" /f

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:MemoManageAuSgRevrtFrshInstall
color b
cls

echo Reverting Memory Optimizations (Windows 10 FreshInstall Settings)

echo Disabling Paging Executive
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /t REG_DWORD /d "0" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /f 

echo Disabling Prefetch and superfetch
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablingPrefetcher" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablingSuperfetch" /f

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "3" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /f

echo Reverting Memory Managment
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "48" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride"  /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "Start" /f

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto EnablePrefetcherBasicFreshinstall

:Xaiyotpersonalmemorymanagementconfig
color b

echo say "yes"

Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "3" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablingSuperfetch" /f

Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnableSuperfetch" /f

Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "DisablePagingExecutive" /f 
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverride"  /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettingsOverrideMask" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PoolUsageMaximum" /f
Reg.exe delete "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "Start" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "ClearPageFileAtShutdown" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "NonPagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolQuota" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PagedPoolSize" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SecondLevelDataCache" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionPoolSize" /t REG_DWORD /d "4" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SessionViewSize" /t REG_DWORD /d "48" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "SystemPages" /t REG_DWORD /d "0" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "PhysicalAddressExtension" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" /v "FeatureSettings" /t REG_DWORD /d "0" /f

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto EnablePrefetcherBasicFreshinstall

:EnablePrefetcherBasicFreshinstall
color b
cls
Reg.exe add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "3" /f

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto NDUTweak

:NDUTweak
cls
echo %z%Enable/Disable NDU?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo.
echo %i%Menu = 3%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableNDUTweak
if '%choice%'=='2' goto DisableNDUTweak
if '%choice%'=='3' goto Menu
color b
:EnableNDUTweak
color b
cls
echo Revert/Enabling NDU
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 2 /f

color b

timeout /t 2 /nobreak > NUL
cls
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:DisableNDUTweak
color b
cls
echo Disabling NDU
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 4 /f

color b

timeout /t 2 /nobreak > NUL
cls
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:CleanTempFiles
color b
cls
echo off
for /F "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G")
color b
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/NewEventLogCleaner.bat" -OutFile "%temp%\NewEventLogCleaner.bat"
start "" /wait "%temp%\NewEventLogCleaner.bat
echo Event Logs have been cleared!
pause
cls
echo Cleaning files
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Temp\*"
timeout /t 1 /nobreak > NUL
del /q  "%LocalAppData%\Temp\*"
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Prefetch\*"
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Logs\CBS\*"
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Logs\DISM\*"
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\InboxApps\*"
timeout /t 1 /nobreak > NUL
echo Removing Logs (.log files)
timeout /t 1 /nobreak > NUL
del /s /f /q %systemdrive%\*.log
timeout /t 1 /nobreak > NUL
cls
echo Advanced
echo USO Logs
del /q "C:\ProgramData\USOShared\Logs\System\*"
timeout /t 1 /nobreak > NUL
del /q "C:\ProgramData\USOShared\Logs\User\*"
timeout /t 1 /nobreak > NUL
cls
echo Advanced
echo Windows Update Logs
del /q "C:\Windows\Logs\waasmedic\*"
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Logs\WindowsUpdate\*"
timeout /t 1 /nobreak > NUL
cls
echo Advanced
echo Edge Update Logs
del /q "C:\ProgramData\Microsoft\EdgeUpdate\Log\*"
timeout /t 1 /nobreak > NUL
cls
echo Advanced
echo Squirrel-Install/Setup Logs (Delete only old files)
del /q "%LocalAppData%\SquirrelTemp\*"
timeout /t 1 /nobreak > NUL
cls
echo Advanced
echo Microsoft SoftwareDistribution Files (unsure if you can delete those, those are usually created by Updates and once they are done you can normally safely delete them)
del /q "C:\Windows\SoftwareDistribution\Download\*"
timeout /t 1 /nobreak > NUL
cls
echo Advanced
echo Windows Health Security Logs 
del /q "C:\ProgramData\Microsoft\Windows Security Health\Logs\*"
cls
echo Removing "Recycle Bin" Files
del /s /f /q %systemdrive%\recycled\*.*
del /s /f /q %systemdrive%\$Recycle.Bin\*.*
cls
echo DiskCleaner.
start %windir%\system32\cleanmgr.exe
start %windir%\system32\dfrgui.exe

echo If your pc is a bit laggy after this (happens rarely) just restart it

pause
timeout /t 1 /nobreak > NUL

color b

pause
goto Menu

:UACEnblDsbl
color b
cls
echo %z%Enable/Disable UAC?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnblUAC
if '%choice%'=='2' goto DsblUAC
color b
:EnblUAC
color b
cls
echo enabling UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "1" /f 

color b

cls

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:DsblUAC
color b
cls
echo enabling UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f 

color b

cls

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:radeonOpti
color b
cls
echo Adding a few Tweaks
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AutoColorDepthReduction_NA" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSubscription" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSkins" /t REG_SZ /d "false" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableBlockWrite" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > NUL
echo Disabling Power Gating
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableUVDPowerGatingDynamic" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDrmdmaPowerGating" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableVCEPowerGating" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisablePowerGating" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableSAMUPowerGating" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Disabling ULPS (Default Values = 1)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_SZ /d "0" /f 
timeout /t 1 /nobreak > NUL
echo Enabling De-Lag (Default Value = 0)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_DeLagEnabled" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL
echo Disabling Frame Rate Target
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "KMD_FRTEnabled" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL
cls
echo Disabling Anti Aliasing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "0" /f
timeout /t 1 /nobreak > NUL

echo Disabling High-Bandwidth Digital Content Protection
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\DAL2_DATA__2_0\DisplayPath_4\EDID_D109_78E9\Option" /v "ProtectionControl" /t REG_BINARY /d "0100000001000000" /f

timeout /t 1 /nobreak > NUL

echo Enabling MSI-Mode for AMD Gpu
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "0" /f
)
timeout /t 1 /nobreak > NUL
echo Applying Melody AMD Tweaks
for %%a in (LTRSnoopL1Latency LTRSnoopL0Latency LTRNoSnoopL1Latency LTRMaxNoSnoopLatency KMD_RpmComputeLatency
        DalUrgentLatencyNs memClockSwitchLatency PP_RTPMComputeF1Latency PP_DGBMMMaxTransitionLatencyUvd
        PP_DGBPMMaxTransitionLatencyGfx DalNBLatencyForUnderFlow
        BGM_LTRSnoopL1Latency BGM_LTRSnoopL0Latency BGM_LTRNoSnoopL1Latency BGM_LTRNoSnoopL0Latency
        BGM_LTRMaxSnoopLatencyValue BGM_LTRMaxNoSnoopLatencyValue) do (reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "%%a" /t REG_DWORD /d "1" /f 
)

echo Disabling DMA
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL

echo Disabling MobileLink (OverCloudAuth)
reg add  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MobileLinkOverCloudAuth_NA" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

echo Successfully Optimized Radeon GPU
timeout /t 3 /nobreak > NUL

goto DisableRADEONPWRGATING

:DisableRADEONPWRGATING
cls
echo %z%Enable/Disable DynamicPStates?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo.
echo %i%Menu = 3%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnablePWRGating
if '%choice%'=='2' goto DisablePWRGating
if '%choice%'=='3' goto Menu


:EnablePWRGating
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "0" /f
echo Successfully Enabled GPU Powergating
timeout /t 3 /nobreak > NUL
goto ExperimentalRadeonGPUValues

:DisablePWRGating
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
echo Successfully Disabled GPU Powergating
timeout /t 3 /nobreak > NUL
goto ExperimentalRadeonGPUValues

:ExperimentalRadeonGPUValues
color b 
cls
echo %z%Enable/Revert Experimental Values ?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Revert = 2%q%
echo.
echo %i%Menu = 3%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableAMDGPUExperimentalTweaks
if '%choice%'=='2' goto RevertAMDGPUExperimentalTweaks
if '%choice%'=='3' goto Menu

:EnableAMDGPUExperimentalTweaks
color b
cls
echo Adding experimental Tweaks
timeout /t 1 /nobreak > NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AreaAniso_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TextureLod_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "1" /f
timeout /t 1 /nobreak > NUL
echo UMD Tweaks
timeout /t 1 /nobreak > NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TextureOpt" /t REG_BINARY /d "31 00 00" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TextureOpt_DEF" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION" /t REG_BINARY /d "16 00 00" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "1" /f
echo Done! 
timeout /t 3 /nobreak > NUL
Goto Menu


:RevertAMDGPUExperimentalTweaks
color b
cls
echo Reverting experimental Tweaks
timeout /t 1 /nobreak > NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AreaAniso_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TemporalAAMultiplier_NA" /t REG_SZ /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "TextureLod_NA" /t REG_SZ /d "1" /f
timeout /t 1 /nobreak > NUL
echo UMD Tweaks
timeout /t 1 /nobreak > NUL
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TextureOpt" /t REG_BINARY /d "30 00 00" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "TextureOpt_DEF" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION" /t REG_BINARY /d "30 00 00" /f
echo Done! 
timeout /t 3 /nobreak > NUL
Goto Menu

color b

goto Menu

:NetworkTweaksPage
color b
cls
echo %w%════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════%y%
echo.
echo.
echo				%w%[%y% %c%%u%1%q%%t% %w%]%y% %c%Basic Network Tweaks%t%
echo.
echo				%w%[%y% %c%%u%2%q%%t% %w%]%y% %c%Bufferbloat Tweaks%t%
echo.
echo				%w%[%y% %c%%u%3%q%%t% %w%]%y% %c%Reset Internet Settings%t%
echo.
echo				%w%[%y% %c%%u%4%q%%t% %w%]%y% %c%Disable IPv6%t%
echo.
echo.                                     
echo.
echo.
echo.
echo.
echo.
echo. 
echo.
echo.
echo.
echo.
echo				%w%[%y% %c%%u%A%q%%t% %w%]%y% %c%Menu%t%
echo.
echo.
echo.

color b

set choice=
set /p choice=
if '%choice%'=='1' goto NetworkTweaksUpdated336
if '%choice%'=='2' goto BufferbloatReduceNewest
if '%choice%'=='3' goto ResetInternetEthSettingsviaNETSH
if '%choice%'=='4' goto DisableIPV6
if '%choice%'=='a' goto Menu
if '%choice%'=='A' goto Menu
color b
:DisableIPV6
::For security perspective.
color b 
cls
netsh int teredo set state disable 
::https://en.wikiversity.org/wiki/Netsh/Teredo
netsh int 6to4 set state disabled
::https://en.wikiversity.org/wiki/Netsh/6to4
netsh int isatap set state disabled
::https://en.wikiversity.org/wiki/Netsh/Isatap
color b

goto NetworkTweaksPage

color b

:ResetInternetEthSettingsviaNETSH
color b
cls
echo Resetting Internet
ipconfig /release
ipconfig /renew
ipconfig /flushdns
netsh int ip reset
netsh int ipv4 reset
netsh int ipv6 reset
netsh int tcp reset
netsh winsock reset
netsh advfirewall reset
netsh branchcache reset
netsh http flush logbuffer
timeout /t 3 /nobreak > NUL

color b

goto NetworkTweaksPage

:NetworkTweaksUpdated336
color b
cls
echo %z%Do you want to Create a Restore Point?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto RP2
if '%choice%'=='2' goto NetworkTweaksUpdateContinue
color b
:RP2
color b
:: Creating Restore Point
echo Creating Restore Point
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\SystemRestore" /v "SystemRestorePointCreationFrequency" /t REG_DWORD /d "0" /f
powershell -ExecutionPolicy Bypass -Command "Checkpoint-Computer -Description 'Optimization Club Restore Point' -RestorePointType 'MODIFY_SETTINGS'"

color b

pause

color b

goto NetworkTweaksUpdateContinue

:NetworkTweaksUpdateContinue
color b
cls
echo HKLM, HKCU, HKCR Keys Exported in "C:\Windows\Temp\"
REG EXPORT HKLM C:\Windows\Temp\HKLM-BEFORE-NETWORK-TWEAKS.reg
REG EXPORT HKCU C:\Windows\Temp\HKCU-BEFORE-NETWORK-TWEAKS.reg
REG EXPORT HKCR C:\Windows\Temp\HKCR-BEFORE-NETWORK-TWEAKS.reg
pause

color b

echo Done.
timeout /t 3 /nobreak > NUL

goto NetworkTweaksUpdateContinue2

:NetworkTweaksUpdateContinue2
color b
cls

echo Disabling Network Throttling
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d "4294967295" /f
timeout /t 1 /nobreak > NUL

echo Disabling Teredo
netsh int teredo set state disabled
timeout /t 1 /nobreak > NUL

echo Disabling Jumbo Frame
reg add "%%n" /v "JumboPacket" /t REG_SZ /d "1514" /f
timeout /t 1 /nobreak > NUL

pause

color b

cls

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto TCPOptimizerDLPGE


:TCPOptimizerDLPGE
color b
cls
echo %z%Would you like to use TCP Optimizer?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
echo.
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto TCPOptimizerDL
if '%choice%'=='2' goto NetworkTweaksPage
color b
:TCPOptimizerDL
color b
cls
powershell Invoke-WebRequest "https://www.speedguide.net/files/TCPOptimizer.exe" -OutFile "%temp%\TCPOptimizer.exe"
start "" /wait "%temp%\TCPOptimizer.exe"

color b

pause

goto NetworkTweaksPage



###BUFFERBLOATS


:BufferbloatReduceNewest
color b
cls
echo %z%Would you like to reduce Bufferbloat (this will lower download/upload speed, but reduce latency.)?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert = 2%q%
echo.
echo %i%No = 3%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableBufferbloatTweaks
if '%choice%'=='2' goto RevertBufferbloatTweaks
if '%choice%'=='3' goto NetworkTweaksPage
color b
:EnableBufferbloatTweaks
color b
cls

echo Set DNS, Local, Hosts Priority

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d 6 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d 5 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d 7 /f
timeout /t 1 /nobreak > NUL


echo Set MaxUserPort, TcpTimedWaitDelay, and DefaultTTL
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /t REG_DWORD /d 65534 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /t REG_DWORD /d 30 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /t REG_DWORD /d 64 /f
timeout /t 1 /nobreak > NUL

netsh int tcp set global autotuninglevel=normal
timeout /t 1 /nobreak > NUL

echo Set Network Throttling Index and System Responsiveness
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > NUL

echo PowerShell commands for offload and network settings
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSegmentCoalescing disabled
PowerShell.exe Set-NetOffloadGlobalSetting -ReceiveSideScaling disabled
PowerShell.exe Set-NetOffloadGlobalSetting -Chimney disabled
PowerShell.exe Disable-NetAdapterLso -Name *
PowerShell.exe Disable-NetAdapterChecksumOffload -Name *
timeout /t 1 /nobreak > NUL

echo PowerShell commands for TCP settings
PowerShell.exe Set-NetTCPSetting -SettingName internet -AutoTuningLevelLocal disabled
PowerShell.exe Set-NetTCPSetting -SettingName internet -ScalingHeuristics disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -EcnCapability enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -Timestamps enabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -MaxSynRetransmissions 2
PowerShell.exe Set-NetTcpSetting -SettingName internet -NonSackRttResiliency disabled
PowerShell.exe Set-NetTcpSetting -SettingName internet -InitialRto 2000
PowerShell.exe Set-NetTcpSetting -SettingName internet -MinRto 300
timeout /t 1 /nobreak > NUL

echo netsh commands for TCP settings and MTU
netsh int tcp set supplemental internet congestionprovider=ctcp
netsh interface ipv4 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Wi-Fi" mtu=1500 store=persistent
netsh interface ipv4 set subinterface "Ethernet" mtu=1500 store=persistent
netsh interface ipv6 set subinterface "Ethernet" mtu=1500 store=persistent

timeout /t 1 /nobreak > NUL

echo Complete
pause

color b

goto NetworkTweaksPage

:RevertBufferbloatTweaks
color b
cls

echo Revert DNS, Local, Hosts Priority

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "DnsPriority" /t REG_DWORD /d 2000 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "LocalPriority" /t REG_DWORD /d 499 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "HostsPriority" /t REG_DWORD /d 500 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\ServiceProvider" /v "NetbtPriority" /t REG_DWORD /d 2001 /f
timeout /t 1 /nobreak > NUL


echo Revert MaxUserPort, TcpTimedWaitDelay, and DefaultTTL
Reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "MaxUserPort" /f
Reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "TcpTimedWaitDelay" /f
Reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Tcpip\Parameters" /v "DefaultTTL" /f
timeout /t 1 /nobreak > NUL

netsh int tcp set global autotuninglevel=normal
timeout /t 1 /nobreak > NUL

echo Set Network Throttling Index and System Responsiveness
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "NetworkThrottlingIndex" /t REG_DWORD /d 0xffffffff /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile" /v "SystemResponsiveness" /t REG_DWORD /d 0 /f
timeout /t 1 /nobreak > NUL

echo THERE IS A LOT MORE TO REVERT, TO DO SO, DOWNLOAD TCP OPTIMIZER AND APPLY "windows default" SETTINGS
echo THERE IS A LOT MORE TO REVERT, TO DO SO, DOWNLOAD TCP OPTIMIZER AND APPLY "windows default" SETTINGS

pause

color b

goto NetworkTweaksPage

:Win10DebloatUIsnew
color b
cls
echo %w%════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════%y%
echo.
echo					%w%[%y% %c%%u%1%q%%t% %w%]%y% %c%Christitus Debloat Script%t%
echo.
echo					%w%[%y% %c%%u%2%q%%t% %w%]%y% %c%Known W10 Debloat Script%t%
echo.
echo					%w%[%y% %c%%u%3%q%%t% %w%]%y% %c%Run OOSU%t%
echo.
echo					%w%[%y% %c%%u%4%q%%t% %w%]%y% %c%UTW 4%t%
echo.
echo					%w%[%y% %c%%u%5%q%%t% %w%]%y% %c%WinAeroTweaker%t%
echo.
echo					%w%[%y% %c%%u%6%q%%t% %w%]%y% %c%Windows 10 Activator%t%
echo.
echo					%w%[%y% %c%%u%A%q%%t% %w%]%y% %c%Menu%t%
echo.
echo					%w%[%y% %c%%u%B%q%%t% %w%]%y% %c%Experimental Values%t%


color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto ChristitusDebloatScriptnew
if '%choice%'=='2' goto BasicW10SCRIPTnew
if '%choice%'=='3' goto RunOOSUnew
if '%choice%'=='A' goto Menu
if '%choice%'=='a' goto Menu
if '%choice%'=='4' goto UTW4DLnew
if '%choice%'=='5' goto WinAeroTweaker
if '%choice%'=='6' goto win10activatornew
if '%choice%'=='B' goto ExperimentalValues
if '%choice%'=='b' goto ExperimentalValues



:ExperimentalValues
color b
cls
echo %w%════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════%y%
echo.
echo				%w%[%y% %c%%u%1%q%%t% %w%]%y% %c%Optimize Ressources Policies Tweak%t%
echo.
echo				%w%[%y% %c%%u%2%q%%t% %w%]%y% %c%Disable Drivers%t%
echo.
echo				%w%[%y% %c%%u%3%q%%t% %w%]%y% %c%DirectX Optimizations%t%
echo.
echo				%w%[%y% %c%%u%4%q%%t% %w%]%y% %c%DWM Optimizations%t%
echo.
echo				%w%[%y% %c%%u%5%q%%t% %w%]%y% %c%Environment Optimizations%t%
echo.
echo				%w%[%y% %c%%u%A%q%%t% %w%]%y% %c%Menu%t%
echo.
echo				%w%[%y% %c%%u%B%q%%t% %w%]%y% %c%TestScript1%t%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptimizeRessourcePolicy
if '%choice%'=='2' goto DriversDisablers
if '%choice%'=='3' goto DirectXOptimizations
if '%choice%'=='4' goto DWMOptimizations
if '%choice%'=='5' goto EnvironmentOptimizations
if '%choice%'=='A' goto Menu
if '%choice%'=='a' goto Menu
if '%choice%'=='B' goto WindowsInsideAppsAndServicesDisabler
if '%choice%'=='b' goto WindowsInsideAppsAndServicesDisabler


:WindowsInsideAppsAndServicesDisabler
color b
cls
echo %z%This will Disable tons of things, Only use it when you play an intensive game, then use it again to revert the changes, are you sure ?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert/No = 2%q%
echo.
echo %i%Menu = A%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto WindowsALLDisabler
if '%choice%'=='2' goto WindowsALLReverter
if '%choice%'=='A' goto Menu
if '%choice%'=='a' goto Menu
color b

:WindowsALLDisabler
cls
echo Goodluck! 
timeout /t 1 /nobreak > NUL
taskkill /f /im explorer.exe
taskkill /f /im TextInputHost.exe
taskkill /f /im TabTip.exe
taskkill /f /im CompPkgSrv.exe
taskkill /f /im ShellExperienceHost.exe
taskkill /f /im smartscreen.exe
taskkill /f /im TrustedInstaller.exe
taskkill /f /im unsecapp.exe
taskkill /f /im MicrosoftEdgeUpdate.exe
timeout /t 1 /nobreak > NUL
echo Disabling Services
sc config WpnService start= Disabled
sc stop WpnService
sc config UsoSvc start= Disabled
sc stop UsoSvc
sc config TrustedInstaller start= Disabled
sc stop TrustedInstaller
sc config Themes start= disabled
sc stop Themes


echo When you're done playing, write in the opened cmd tab "start explorer.exe"
pause
timeout /t 3 /nobreak > NUL
echo Now starting an explorer tab, start your game/launcher with It
start explorer.exe c:
start cmd.exe

timeout /t 1 /nobreak > NUL

echo Done! 
timeout /t 3 /nobreak > NUL
Goto Menu

:WindowsALLReverter
cls
echo Reverting !
timeout /t 1 /nobreak > NUL
start explorer.exe
start TextInputHost.exe
start TabTip.exe
start CompPkgSrv.exe
start ShellExperienceHost.exe
start smartscreen.exe
start TrustedInstaller.exe
start unsecapp.exe
timeout /t 1 /nobreak > NUL
echo Reverting Services
sc config WpnService start= Auto
sc start WpnService
sc config UsoSvc start= delayed-auto
sc start UsoSvc
sc config TrustedInstaller start= demand
sc start TrustedInstaller
sc config Themes start= auto
sc start Themes

timeout /t 1 /nobreak > NUL

echo Done! 
timeout /t 3 /nobreak > NUL
Goto Menu

:DriversDisablers
color b
cls
echo %z%Would you like to Disable Drivers ?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert/No = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto DisablerDrivers
if '%choice%'=='2' goto RevertDrivers
color b

:DisablerDrivers
color 4
cls
echo disabling Drivers

echo WARNING! This *MAY* Cause problems on laptop PCs (Specifically, Keyboard and Mousepad!) Proceed with caution and only if you have an USB Keyboard/Mouse in case something happens :D
pause

cls

color b

cls

echo disabling NDU (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
echo Disabling flpydisk (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\flpydisk" /v "Start" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
echo Disabling FileCrypt (Default value "1")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileCrypt" /v "Start" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
echo Disabling fdc (Default value "1")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fdc" /v "Start" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
echo disabling 1394ohci (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\1394ohci" /v "Start" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
echo disabling i8042prt (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt" /v "Start" /t REG_DWORD /d 4 /f

echo Done! 
timeout /t 3 /nobreak > NUL
Goto Menu

:RevertDrivers
cls

color b

cls

echo disabling NDU (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 3 /f

echo Disabling flpydisk (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\flpydisk" /v "Start" /t REG_DWORD /d 3 /f

echo Disabling FileCrypt (Default value "1")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileCrypt" /v "Start" /t REG_DWORD /d 1 /f

echo Disabling fdc (Default value "1")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fdc" /v "Start" /t REG_DWORD /d 1 /f

echo disabling 1394ohci (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\1394ohci" /v "Start" /t REG_DWORD /d 3 /f

echo disabling i8042prt (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt" /v "Start" /t REG_DWORD /d 3 /f

echo Done! 
timeout /t 3 /nobreak > NUL
Goto Menu



:OptimizeRessourcePolicy
cls
echo %z%Optimize Ressource Policies? (TEST VALUES)%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert = 2%q%
echo.
echo %i%Menu = 3%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptimizeRessourcesPoliciesON
if '%choice%'=='2' goto RevertOptimizeRessourcesPolicies
if '%choice%'=='3' goto Menu

color b

:OptimizeRessourcesPoliciesON
color b
cls
echo Optimizing Ressources Policy
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "SchedulingType" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "SchedulingType" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "SchedulingType" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "CapPercentage" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "SchedulingType" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\ThrottleGPUInterference" /v "IsLowPriority" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\IO\NoCap" /v "IOBandwidth" /t REG_DWORD /d "0"
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Memory\NoCap" /v "CommitLimit" /t REG_DWORD /d "4294967295" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Memory\NoCap" /v "CommitTarget" /t REG_DWORD /d "4294967295" /f

echo Done.
timeout /t 3 /nobreak > NUL
goto Menu

:RevertOptimizeRessourcesPolicies
color b
cls
echo Reverting Policy Values
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "CapPercentage" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\HardCap0" /v "SchedulingType" /t REG_DWORD /d "3" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "CapPercentage" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\Paused" /v "SchedulingType" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "CapPercentage" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapFull" /v "SchedulingType" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "CapPercentage" /t REG_DWORD /d "100" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\CPU\SoftCapLow" /v "SchedulingType" /t REG_DWORD /d "2" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\Flags\ThrottleGPUInterference" /v "IsLowPriority" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\ResourcePolicyStore\ResourceSets\Policies\IO\NoCap" /v "IOBandwidth" /t REG_DWORD /d "0"


echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

color b

:DirectXOptimizations
cls
echo %z%Optimize DirectX11-12 ? (Test Values)%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert = 2%q%
echo.
echo %i%Menu = 3%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto DirectXOptimizationsYes
if '%choice%'=='2' goto RevertDirectXOptimizations
if '%choice%'=='3' goto Menu

:DirectXOptimizationsYes
color b 
cls
echo Optimizing DirectX Values
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_UNSAFE_COMMAND_BUFFER_REUSE" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_RUNTIME_DRIVER_OPTIMIZATIONS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESOURCE_ALIGNMENT" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_MULTITHREADED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_MULTITHREADED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_DEFERRED_CONTEXTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_DEFERRED_CONTEXTS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_ALLOW_TILING" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D11_ENABLE_DYNAMIC_CODEGEN" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_ALLOW_TILING" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_CPU_PAGE_TABLE_ENABLED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_HEAP_SERIALIZATION_ENABLED" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_MAP_HEAP_ALLOCATIONS" /t REG_DWORD /d "1" /f
Reg.exe add "HKLM\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESIDENCY_MANAGEMENT_ENABLED" /t REG_DWORD /d "1" /f

echo Done.
timeout /t 3 /nobreak > NUL
goto Menu

:RevertDirectXOptimizations
color b
cls
echo Reverting DirectX Values
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_UNSAFE_COMMAND_BUFFER_REUSE" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_ENABLE_RUNTIME_DRIVER_OPTIMIZATIONS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESOURCE_ALIGNMENT" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D11_MULTITHREADED" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_MULTITHREADED" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D11_DEFERRED_CONTEXTS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_DEFERRED_CONTEXTS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D11_ALLOW_TILING" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D11_ENABLE_DYNAMIC_CODEGEN" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_ALLOW_TILING" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_CPU_PAGE_TABLE_ENABLED" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_HEAP_SERIALIZATION_ENABLED" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_MAP_HEAP_ALLOCATIONS" /f
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DirectX" /v "D3D12_RESIDENCY_MANAGEMENT_ENABLED" /f

echo Done.
timeout /t 3 /nobreak > NUL
goto Menu

:DWMOptimizations
cls
echo %z%Optimize DWM ? (Test Values)%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert = 2%q%
echo.
echo %i%Menu = 3%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto DWMOptimizationsYes
if '%choice%'=='2' goto RevertDWMOptimizations
if '%choice%'=='3' goto Menu

:DWMOptimizationsYes
color b 
cls
echo Optimizing DWM.exe

reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v AnimationsShiftKey /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v AnimationAttributionEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v AnimationAttributionHashingEnabled /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v DisableProjectedShadowsRendering /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v DisableProjectedShadows /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v EnableEffectCaching /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v EnableDesktopOverlays /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v ResampleModeOverride /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v FrameLatency /t REG_DWORD /d 00000002 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v ForceDirectDrawSync /t REG_DWORD /d 00000000 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v MaxQueuedPresentBuffers /t REG_DWORD /d 00000001 /f
timeout /t 2 /nobreak > NUL
echo Those may be deprecated
timeout /t 2 /nobreak > NUL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM" /v FrameLatency /t REG_DWORD /d "00000002" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM" /v ForceDirectDrawSync /t REG_DWORD /d "00000002" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\DWM" /v MaxQueuedPresentBuffers /t REG_DWORD /d "00000001" /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v EnableResizeOptimization /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v DisableAdvancedDirectFlip /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL
taskkill /f /im dwm.exe
timeout /t 2
start %windir%\system32\dwm.exe

echo Done.
timeout /t 3 /nobreak > NUL
goto Menu

:RevertDWMOptimizations
color b 
cls
echo Reverting DWM.exe tweaks

reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v AnimationsShiftKey /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v AnimationAttributionEnabled /t REG_DWORD /d 1 /f
reg add "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v AnimationAttributionHashingEnabled /t REG_DWORD /d 1 /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v FrameLatency /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v ForceDirectDrawSync /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v MaxQueuedPresentBuffers /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v EnableResizeOptimization /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v DisableProjectedShadows /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v DisableProjectedShadowsRendering /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v EnableEffectCaching /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v EnableDesktopOverlays /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v ResampleModeOverride /f
reg delete "HKLM\SOFTWARE\Microsoft\WINDOWS\DWM" /v DisableAdvancedDirectFlip /f

timeout /t 1 /nobreak > NUL
taskkill /f /im dwm.exe
timeout /t 2
start %windir%\system32\dwm.exe

echo Done.
timeout /t 3 /nobreak > NUL
goto Menu


:EnvironmentOptimizations
color b
cls
echo %z%Optimize Environment ? (Test Values)%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert = 2%q%
echo.
echo %i%Menu = 3%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto OptimizeEnvironmentYes
if '%choice%'=='2' goto RevertEnvironmentValues
if '%choice%'=='3' goto Menu
color b

:OptimizeEnvironmentYes
color b
cls
echo Optimizing Environment.
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Max-Pending-Interrupts.reg" -OutFile "%temp%\Max-Pending-Interrupts.reg"
start "" /wait "%temp%\Max-Pending-Interrupts.reg"

echo Done.
timeout /t 2 /nobreak > NUL
goto Menu

:RevertEnvironmentValues
color b
cls
echo Reverting Environment tweaks
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Revert-Max-Pending-Interrupts.reg" -OutFile "%temp%\Revert-Max-Pending-Interrupts.reg"
start "" /wait "%temp%\Revert-Max-Pending-Interrupts.reg"


echo Done.
timeout /t 2 /nobreak > NUL
goto Menu



:WinAeroTweaker
color b

cls
powershell Invoke-WebRequest "https://winaerotweaker.com/download/winaerotweaker.zip" -OutFile "%temp%\winaerotweaker.zip"
pause
start "" /wait "%temp%\winaerotweaker.zip

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Win10DebloatUIsnew


:ChristitusDebloatScriptnew
color b

cls

powershell -Command "irm https://christitus.com/win | iex"

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Win10DebloatUIsnew

:BasicW10SCRIPTnew
color b

cls

powershell -Command "iwr -useb https://git.io/debloat|iex"

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Win10DebloatUIsnew

:RunOOSUnew
color b
cls
powershell Invoke-WebRequest "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -OutFile "%temp%\OOSU10.exe"
start "" /wait "%temp%\OOSU10.exe

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Win10DebloatUIsnew

:UTW4DLnew
color b
cls
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/UltimateWindowsTweaker4.8.exe" -OutFile "%temp%\UltimateWindowsTweaker4.8.exe"
pause
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/ButtonExtended.dll" -OutFile "%temp%\ButtonExtended.dll"
start "" /wait "%temp%\UltimateWindowsTweaker4.8.exe

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Win10DebloatUIsnew

:win10activatornew
color b
cls

powershell -Command "irm https://get.activated.win | iex"

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:: Windows Processes Disabler

:WindowsAppsDisabler
color b
cls
echo %z%Enable/Disable Windows Apps ?%q%
echo Note: Enable them to use Update or Store.
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableWindowsApps01
if '%choice%'=='2' goto DisableWindowsApps02
color b

:EnableWindowsApps01
cls
echo Enabling Apps that we disabled
echo Enabling HelpPane.exe
icacls %WinDir%\HelpPane.exe /remove:d Everyone
icacls %WinDir%\HelpPane.exe /setowner "NT Service\TrustedInstaller"
move "%WinDir%\HelpPane.old" "%WinDir%\HelpPane.exe"
timeout /t 1 /nobreak > NUL
echo Enabling TextInputHost.exe
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" /remove:d Everyone
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" /setowner "NT Service\TrustedInstaller"
timeout /t 1 /nobreak > NUL
echo Enabling mobsync.exe
icacls "C:\Windows\System32\mobsync.exe" /remove:d Everyone
icacls "C:\Windows\System32\mobsync.exe" /setowner "NT Service\TrustedInstaller"
timeout /t 1 /nobreak > NUL
echo Component Package Support Server
icacls "C:\Windows\System32\CompPkgSrv.exe" /remove:d Everyone
icacls "C:\Windows\System32\CompPkgSrv.exe" /setowner "NT Service\TrustedInstaller"
timeout /t 1 /nobreak > NUL
echo Enabling SmartScreen.exe
icacls "C:\Windows\System32\smartscreen.exe" /remove:d Everyone
icacls "C:\Windows\System32\smartscreen.exe" /setowner "NT Service\TrustedInstaller"
timeout /t 1 /nobreak > NUL
enabling Bonjour service
icacls "C:\Program Files (x86)\Bonjour\mDNSResponder.exe" /remove:d Everyone
icacls "C:\Program Files (x86)\Bonjour\mDNSResponder.exe" /setowner "NT Service\TrustedInstaller"
icacls "C:\Program Files\Bonjour" /remove:d Everyone
icacls "C:\Program Files\Bonjour" /setowner "NT Service\TrustedInstaller"
timeout /t 1 /nobreak > NUL
echo Enabling TabTip
icacls "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe" /remove:d Everyone
icacls "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe" /setowner "NT Service\TrustedInstaller"
timeout /t 1 /nobreak > NUL

echo Done (Ignore it if windows says "couldn't access")
echo Small Tip: This sets the permissions to only "Nt Service\TrustedInstaller" (So, TrustedInstaller) While this should NORMALLY BE ENOUGH, sometimes you will need to manually give yourself (and windows) permissions :D
echo (Sorry if this cause problems, we're still working on things)

pause

echo Done

timeout /t 1 /nobreak > NUL

goto Menu

:DisableWindowsApps02

echo Windows Processes Disabler (NEW :D)!
echo this thing is still in BETA, being worked on by Starligns and Ezzi, say it if it causes problems)

pause

cls

echo Disabling HelpPane.exe
taskkill /f /im HelpPane.exe
takeown /f %WinDir%\HelpPane.exe
icacls %WinDir%\HelpPane.exe /deny Everyone:(X)
takeown /f %WinDir%\HelpPane.exe
move "%WinDir%\HelpPane.exe" "%WinDir%\HelpPane.old"
taskkill /im HelpPane.exe /f
timeout /t 1 /nobreak > NUL

echo Disabling TextInputHost.exe
echo Warning! This is another attempt at disabling TextInputHost, it sometimes can cause a very weird bug in windows where 
echo desktop icons randomly (after a few seconds) gets refreshed and it loops in this bug.
echo this cause performances Issues if it happens, please go to the discord and download "EnableApps.bat" to enable those apps again
pause
echo.
timeout /t 1 /nobreak > NUL
taskkill /f /im TextInputHost.exe
takeown /f "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe"
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe" /deny Everyone:(X)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnablePerformanceMode" /t REG_DWORD /d 0x00000001 /f
timeout /t 1 /nobreak > NUL

echo Disabling MobSync.exe (MicrosoftSync)
taskkill /f /im mobsync.exe
takeown /f "C:\Windows\System32\mobsync.exe"
icacls "C:\Windows\System32\mobsync.exe" /deny Everyone:(X)
icacls "C:\Windows\System32\mobsync.exe" /remove Everyone:f
timeout /t 1 /nobreak > NUL

echo Disabling Component Package Support Server (CompPkgSrv.exe) (it may cause upfc.exe to show up after an update, normal)
echo (It's apparently "not so useful and can be disabled" you can revert this at any times in the Discord)
echo (please enable it again if you use Microsoft Store or Microsoft Update)
echo.
taskkill /f /im CompPkgSrv.exe
takeown /f "C:\Windows\System32\CompPkgSrv.exe"
icacls "C:\Windows\System32\CompPkgSrv.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

echo Disabling SmartScreen.exe (Already disabled, but just in case, we'll revoke the permissions to use it)
taskkill /f /im smartscreen.exe
takeown /f "C:\Windows\System32\smartscreen.exe"
icacls "C:\Windows\System32\smartscreen.exe" /deny Everyone:(X)
icacls "C:\Windows\System32\smartscreen.exe"/remove Everyone:f
timeout /t 1 /nobreak > NUL

echo Disabling Bonjour Service (mdnsNSP.dll)
taskkill /f /im mDNSResponder.exe
takeown /f "C:\Program Files (x86)\Bonjour\mDNSResponder.exe"
icacls "C:\Program Files (x86)\Bonjour\mDNSResponder.exe" /deny Everyone:(X)

takeown /f "C:\Program Files\BonjourmDNSResponder.exe"
icacls "C:\Program Files\Bonjour\mDNSResponder.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

timeout /t 1 /nobreak > NUL

takeown /f "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe"
icacls "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

echo All files Directories

echo HelpPane.exe : "C:\Windows\HelpPane.exe"
echo TextInputHost : "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe"
echo mobsync.exe : "C:\Windows\System32\mobsync.exe"
echo Component Package Server : "C:\Windows\System32\CompPkgSrv.exe"
echo smartscreen.exe : "C:\Windows\System32\smartscreen.exe"
echo TabTip.exe : "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe"
pause

echo Done!

goto menu

:FSOChoices
cls
md %UserProfile%\Desktop\OptiClub\FSO

echo Exporting Current FSO Regedit Keys to "\Desktop\OptiClub\FSO"
REG EXPORT HKEY_CURRENT_USER\System\GameConfigStore\ %UserProfile%\Desktop\OptiClub\FSO\FSO.reg
timeout /t 2 /nobreak > NUL

start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\FSO"

cls
color b
cls
echo %z%Enable/Disable Fullscreen Optimizations?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo.
echo %i%FreshInstall/Basic = 3%q%
echo.
echo %i%FreshInstall/Newest = 4%q%
echo.
echo %i%AnotherConfig = 5%q%
echo.
echo %i%TheWindowsClub Config = 6%q%
echo.
echo %i%Personal Config = 7%q%
echo.
echo %i%Skip (Do if you're unsure, check youtube tutorials) = 8%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableFullScreenOptimizationsNew
if '%choice%'=='2' goto DisableFullScreenOptimizationsNew
if '%choice%'=='3' goto FreshInstallBasicNew
if '%choice%'=='4' goto FreshInstallBasicNewestNew
if '%choice%'=='5' goto AnotherConfigInstallDVRNew
if '%choice%'=='6' goto TheWindowsClubFSOEnableNew
if '%choice%'=='7' goto PersonalConfigNew
if '%choice%'=='8' goto Menu

cls

:EnableFullScreenOptimizationsNew
color b
cls
echo Enabling Full Screen Optimizations
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f 

echo Enabling Windowed Game Optimizations
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;SwapEffectUpgradeEnable=1;" /f
timeout /t 1 /nobreak > NUL
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:DisableFullScreenOptimizationsNew
cls
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /f
echo Done.
timeout /t 5 /nobreak > NUL
color b
goto Menu

:FreshInstallBasicNew
cls
echo deleting regedit settings
timeout /t 1 /nobreak > NUL
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /f
timeout /t 1 /nobreak > NUL
color b
pause
cls
echo adding regedit settings
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f 
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /f

echo Enabling Windowed Game Optimizations
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;SwapEffectUpgradeEnable=1;" /f 
timeout /t 1 /nobreak > NUL

echo Done.
timeout /t 5 /nobreak > NUL
color b
goto Menu

:AnotherConfigInstallDVRNew
cls
echo deleting regedit settings
timeout /t 1 /nobreak > NUL
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /f
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /f
timeout /t 1 /nobreak > NUL

echo Enabling Windowed Game Optimizations
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;SwapEffectUpgradeEnable=1;" /f
timeout /t 1 /nobreak > NUL
color b
timeout /t 5 /nobreak > NUL
goto Menu

:TheWindowsClubFSOEnableNew
cls
echo adding regedit settings
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /t REG_DWORD /d "2" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "1" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "2" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /f 

echo Enabling Windowed Game Optimizations
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;SwapEffectUpgradeEnable=1;" /f
timeout /t 1 /nobreak > NUL

echo Done.
timeout /t 5 /nobreak > NUL
color b
goto Menu

:PersonalConfigNew
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DXGIHonorFSEWindowsCompatible" /t REG_DWORD /d "1" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_EFSEFeatureFlags" /t REG_DWORD /d "0" /f
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_Enabled" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehavior" /t REG_DWORD /d "2" /f  
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_FSEBehaviorMode" /t REG_DWORD /d "0" /f 
reg add "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_HonorUserFSEBehaviorMode" /t REG_DWORD /d "1" /f 
reg delete "HKCU\SYSTEM\GameConfigStore" /v "GameDVR_DSEBehavior" /f
timeout /t 1 /nobreak > NUL

echo Enabling Windowed Game Optimizations
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;SwapEffectUpgradeEnable=1;" /f
timeout /t 1 /nobreak > NUL

echo Done.
timeout /t 5 /nobreak > NUL
color b
goto Menu

:AllInOneAfterInstall
cls
color b
echo Downloading Ressources...

md %UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Apps
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Apps.rar" -OutFile "%UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Apps\Apps.rar"
timeout /t 1 /nobreak > NUL
md %UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Video+Picture-Codecs
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Video+Picture-Codecs.rar" -OutFile "%UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Video+Picture-Codecs\Video+Picture-Codecs.rar"
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/HEVC-Codecs.rar" -OutFile "%UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Video+Picture-Codecs\HEVC-Codecs.rar"
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Microsoft.HEVCVideoExtension_2.4.13.0_neutral_~_8wekyb3d8bbwe.AppxBundle" -OutFile "%UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Video+Picture-Codecs\HEVCVideoExtension_2.4.13.0_neutral_~_8wekyb3d8bbwe.AppxBundle"
timeout /t 1 /nobreak > NUL
md %UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Windows-Apps-Installer
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Read..txt" -OutFile "%UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Windows-Apps-Installer\Read..txt"
start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\"
timeout /t 1 /nobreak > NUL
md %UserProfile%\Desktop\OptiClub\Browsers\
powershell Invoke-WebRequest "https://referrals.brave.com/latest/BraveBrowserSetup-BRV013.exe" -OutFile "%UserProfile%\Desktop\OptiClub\Browsers\BraveBrowserSetup.exe"
start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\Browsers"


pause

echo Done, now Downloading and starting the script

powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Script-Right-After-Windows-Install-PreBuild.bat" -OutFile "%temp%\Script-Right-After-Windows-Install-PreBuild.bat"
start "" /wait "%temp%\Script-Right-After-Windows-Install-PreBuild.bat

echo Done!
echo GPU optimizations aren't done, do them in the main script.

goto Menu

