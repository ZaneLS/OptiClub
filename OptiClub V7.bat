@echo  off
chcp 65001 >nul
title OptiClub V7.0.1-BETA -https://discord.gg/Np77z4C9qs Dev Ver -PreRelease V7
cd C:\Windows
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
::log
md %UserProfile%\Desktop\OptiClub\LogFile\Logs
echo OptiClub V7-B Log > %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

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
:Continue
cls
cls
echo.  %b%════════════════════════════════════════════════════════════════════════════════════════════════════
echo.  %b%
echo.  %w%	Do you want to save your Regedit as a backup    							
echo.  %w%      
echo.  %w%	Please do before applying tweaks to revert any changed regedit key			
echo.  %w%    						 
echo.  %b%
echo.  %w%                             
echo.  %w%      %p%[%w%1%p%]%w% Export Regedit          
echo.  %w%                             
echo.  %w%      %p%[%w%2%p%]%w% Skip  
color b
set /p input=:
color b
if /i %input% == 1 goto SaveRegedit
if /i %input% == 2 goto UacDisablerPretweak


:SaveRegedit
cls
md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\

echo HKLM, HKCU, HKCR Keys Exported in "Desktop\OptiClub\RegeditBackUpKeys"
REG EXPORT HKLM %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\HKLM.reg
REG EXPORT HKCU %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\HKCU.reg
REG EXPORT HKCR %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\HKCR.reg

md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\DriversCurrentConfig

reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Enum" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\DriversCurrentConfig\Enum.reg
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\DriversCurrentConfig\CurrentControlSet.reg
reg export "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\DriversCurrentConfig\ControlSet001.reg
timeout /t 2 /nobreak > NUL

md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\AutoFolderDiscovery
reg export "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\AutoFolderDiscovery\Bags.reg
reg export "HKCU\Software\Classes\Local Settings\Software\Microsoft\Windows\Shell\Bags\AllFolders\Shell" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\AutoFolderDiscovery\Shell.reg

echo Exporting Current Ram Regedit Values.
md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\RAM
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\RAM\MemoryManagement.reg
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\RAM\MemoryManagement2.reg

md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\Services
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\Services\HKLM-Services.reg
echo Exported Current Services Values before applying new ones. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt


md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\StickyKeys
echo Exporting your current "Sticky keys" default value to "%UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\StickyKeys\StickyKeys.reg"
REG EXPORT "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" "%UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\StickyKeys\StickyKeys.reg"

md %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\NumLock
REG EXPORT "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" "%UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\NumLock\Keyboard.reg"
echo Num Lock has been Force-Enable on Startup. See tool for documentations. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\"

goto UacDisablerPretweak

:UacDisablerPretweak
cls

:: Disable UAC
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" /v "EnableLUA" /t REG_DWORD /d "0" /f 
echo Disabled UAC > %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

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
echo.  %b%═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.  %b%
echo.  %w%                             
echo.  %w%      %p%[%w%1%p%]%w% Optimize Performances          
echo.  %w%                             
echo.  %w%      %p%[%w%2%p%]%w% Disable Telemetry   
echo.  %w%                             
echo.  %w%      %p%[%w%3%p%]%w% Disable Services    
echo.  %w%                             
echo.  %w%      %p%[%w%4%p%]%w% Optimize Nvidia GPU (Probably Outdated)
echo.  %w%                             
echo.  %w%      %p%[%w%5%p%]%w% Optimize AMD GPU (Kept Updated. Not Compatible Recent Drivers, Pending Updates)
echo.  %w%                             
echo.  %w%      %p%[%w%6%p%]%w% Debloat Windows
echo.  %w%      
echo.  %w%      %p%[%w%7%p%]%w% Import GitHub Powerplan
echo.  %w%      
echo.  %w%      %p%[%w%8%p%]%w% Premade CFGs (Not Updated Yet)
echo.  %w%      
echo.  %w%      %p%[%w%9%p%]%w% Windows System Processes Disabler
echo.  %w%    
echo.  %w%    
echo.  %w%      %p%[%w%B%p%]%w% Tools		%p%[%w%C%p%]%w% UAC 
echo.  %w%    
echo.  %w%      %p%[%w%D%p%]%w% Other Tools
color b
set /p input=:
color b
if /i %input% == 1 goto OptimizePerformances
if /i %input% == 2 goto DisableTelemetry
if /i %input% == 3 goto DisableServices
if /i %input% == 4 goto OptimizeNvidiaGPU
if /i %input% == 5 goto OptimizeAMDGPU
if /i %input% == 6 goto DebloatWindows
if /i %input% == 7 goto ImportCPUProfile
if /i %input% == 8 goto PremadeCFGs
if /i %input% == 9 goto WindowsAppsDisabler
if /i %input% == B goto ManualToolsV2
if /i %input% == b goto ManualToolsV2
if /i %input% == C goto UACManagement
if /i %input% == c goto UACManagement
if /i %input% == D goto Win10DebloatUIsnew
if /i %input% == d goto Win10DebloatUIsnew
if /i %input% == cmd start cmd.exe
if /i %input% == explorer start explorer.exe

:OptimizePerformances
echo User Used Optimize Performances Tweaks. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Exporting Current Settings (BCD)
bcdedit /export "%USERPROFILE%\Desktop\bcdcurrentsettings.txt"
bcdedit /export "%USERPROFILE%\Desktop\bcdbackup.bcd"   
bcdedit /set MSI Default
echo "MSI Mode" as default is the normal, default value, but still it's better to set that value in BCD Configs to make sure it is enabled, though still monitor latency after enabling it, you can revert. do enable MSI Mode for your GPU (the script will do it later).
timeout /t 1 /nobreak > NUL
echo Enabled MSI-Mode in BCD Config. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

https://dl2.bitsum.com/files/coredirectorsetup.exe"

echo Disabling Overlays (Default Value = 0, New Value = 0)
::Why, it can causes weird screen (on multi-monitor setups) flickering or even black screen errors, this seems to be "specific" but disabled in case)
echo Overlays has been re-enabled 'Graphic Drivers Overlays' because disabling them can cause weird GPU Issues. Note, We're talking about other overlays than just your AMD Gpu Driver overlays. It's something else. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverlays" /t REG_DWORD /d 0 /f
echo Disabling Prefetcher (Default Value = 1, New Value = 0)
::Prefetcher is made to "Optimize app startups" on Old Windows OS, Files are in "C:\Windows\Prefetch" It's now "most likely useless" you can leave it enabled, it depends on configs
echo Prefetcher has been disabled This does not break anything critical on modern OS, at worse it will worsen performances if your OS is on an HDD disk, you can revert the values to "1" . >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetch" /t REG_DWORD /d "0" /f
reg add "HKLM\System\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v "EnablePrefetcher" /t REG_DWORD /d "0" /f
echo Disabling Sysmain
::Sysmain is useless if your Windows OS Runs on an SSD disk, it can be "useful" if your Swap memory (Memory-On-Disk) is on HDD.
::Disabling Sysmain is fully safe, it Does not cause any harm
echo Sysmain has Been disabled under "Performances Optimizations" This does not break anything critical and is safe. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d "4" /f 
echo Disabling all Animations
::"EnableTransparency" Is the key related to Windows Transparency Effects (that you can change in your settings app), Default value is "1", we disabled it.
echo Disabled Windows Transparency Effect. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
REG ADD "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v "EnableTransparency" /t REG_DWORD /d "0" /f
echo Adding MenuShowDelay tweak (basic value 1)
::MenuShowDelay removes the delay before menu opens or close, this makes the UI overrall faster.
echo Disabled Menus Opening and Closing Delay. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\Control Panel\Desktop" /v "MenuShowDelay" /t REG_DWORD /d "0" /f
:: 2
echo Disabling taskbar animations (drop-shadow effect) (Default value = 1)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "TaskbarAnimations" /t  REG_DWORD "0" /f
echo Disabled Taskbar/Lists Shadow Effects. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
::"ListViewShadow" Is used for the Shadow effects in lists, default value is "1", we disabled it.
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "ListviewShadow" /t REG_DWORD /d "0" /f
echo Disabling cursor shadow (Default value = del)
::"CursorShadow" Is just the little shadow under your cursor, default value is "1", we disabled it.
echo Disabled Cursor Shading effects >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKEY_CURRENT_USER\Control Panel\Cursors" /v "CursorShadow" /t REG_DWORD /d "0" /f
echo Disabling selection fading (Default value = del)
echo Disabled Selection Fading effects >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
::Selection fading is the animations windows use when selecting things. default value is "1", we disabled it.
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v "SelectionFade" /t REG_DWORD /d "0" /f
echo Disabling Save thumbnails in Taskbar. (default value = 1, new value = 0)
echo Disabled Thumbnails In Taskbar with regedit. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\DWM" /v "AlwaysHibernateThumbnails" /t REG_DWORD /d "0" /f
echo Windows Animations have been fully Disabled, Please read the tool itself for documentations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling all Animations
md %UserProfile%\Desktop\OptiClub\Animations\DisableAnimations\
md %UserProfile%\Desktop\OptiClub\Animations\EnableAnimations\
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/dfsfsfd.reg" -OutFile "%UserProfile%\Desktop\OptiClub\Animations\DisableAnimations\DisableAnimations.reg"
powershell Invoke-WebRequest "https://github.com/ZaneLS/Regroup/raw/refs/heads/main/DisableAnimations.bat" -OutFile "%UserProfile%\Desktop\OptiClub\Animations\DisableAnimations\DisableAnimations.bat"
powershell Invoke-WebRequest "https://github.com/ZaneLS/Regroup/raw/refs/heads/main/EnableAnimations.bat" -OutFile "%UserProfile%\Desktop\OptiClub\Animations\EnableAnimations\EnableAnimations.bat"
powershell Invoke-WebRequest "https://github.com/ZaneLS/Regroup/raw/refs/heads/main/EnableAnimations.reg" -OutFile "%UserProfile%\Desktop\OptiClub\Animations\EnableAnimations\EnableAnimations.reg"
start "" /wait powershell "" "%UserProfile%\Desktop\OptiClub\Animations\DisableAnimations\DisableAnimations.reg"
echo Created folder Desktop\Opticlub\Animations\DisableAnimations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Created folder Desktop\OptiClub\Animations\EnableAnimations\ >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Downloaded a Regedit file through GitHub to Disable other Animations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Downloaded Other files from Github to disable and enable windows and DWM.exe animations in "Desktop\Opticlub\Animations" >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
pause
echo Disabling Shaking to minimize
::shaking to minimize is what the name means, we disable it, default value is 0, this doesn't really improve performances and is safe to change.
echo Disabled Shaking to Minimize >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced" /v "DisallowShaking" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL

pause

echo Disabling AeroPeek
::Aeropeek is the desktop preview/hover effects (most likely transparency) we disable it for performances, default value "1"
reg add "HKCU\Software\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm\ExtendedComposition" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\DWM" /v "EnableAeroPeek" /t REG_DWORD /d "0" /f
echo DWM.exe Aeropeek has been disabled, this is used for animations and effects. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling DWM CPU Clipping
::CPU Clipping within DWM.exe is an "undocumented tweak" it aims to disable CPU clipping for the app itself to improve performances (latency wise) by relying only on the legacy DWM composition pipeline. This is most likely "ignored" by windows now.
echo Disabled CPU Clipping for Dwm.exe, Though, This key might be "Ignored" now, and it's "undocumented" however there is no harm seen in adding it, "Ignored" means it's deprecated. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v "EnableCpuClipping" /t REG_DWORD /d "0" /f
echo Disabling DWM Animations
::"ForceDisableModeChangeAnimation" Is a "Mode" within Dwm.exe to fully disable Animations when changing Displays, Resolutions, or others., Default Value is "0", we set it to "1" to disable animations.
echo Disabled overrall animations and effects for Dwm.exe. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v ForceDisableModeChangeAnimation /t REG_DWORD /d 1 /f 
::"ForceEffectMode" Was Used in Old versions of Windows 10 (I think) and was part of Dwm.exe's Visual Rendering Pipeline, In theory, it fully disables any effects related to Dwm.exe, In modern Windows, this key is "Ignored" (deprecated), adding it causes no harm.
echo Added an Undocumented Key for Dwm.exe (Old Versions, Ignored on Modern Windows, adding the key causes no harm at all. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SOFTWARE\Microsoft\Windows\Dwm" /v ForceEffectMode /t REG_DWORD /d 0 /f


taskkill /f /im dwm.exe
start %windir%\system32\dwm.exe
taskkill /f /im explorer.exe & start explorer.exe
echo Dwm.exe has been Restarted >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Done!
echo Please restart your PC to apply all the settings later.
timeout /t 2 /nobreak > NUL

cls

echo Disabling remnant touches and the shortcut to enable it
::Remnant touches are "Sticky keys" (The menu that shows up when you press shift 5 times) (Default value here depends on your windows install) (No harm in using the key, at worse you'll enable them or enter an incorrect key, in which case windows Ignores.
echo Sticky Keys have been Disabled through regedit and your current keys got exported in Desktop\Opticlub\RegeditBackupKeys\StickyKeys >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
reg add "HKEY_CURRENT_USER\Control Panel\Accessibility\StickyKeys" /v "Flags" /t REG_SZ /d "482" /f
timeout /t 1 /nobreak > NUL

cls
echo Enabling Num Lock on Startup (value can be 2147483648 or 80000002 or just 2)
::Num Luck is the Num Lock on your keyboard, sometimes it's disabled on startup or "laggy", This forces it Enabled. Your current regedit key got exported too in case you need to revert. (This causes no harm)
echo Num Lock has been Force-Enable on Startup. See tool for documentations. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
reg add "HKEY_USERS\.DEFAULT\Control Panel\Keyboard" /v "InitialKeyboardIndicators" /t REG_SZ /d "2" /f
timeout /t 1 /nobreak > NUL

cls
echo Disabling Core parking via Regedit (Default value = 1, changed to 0)
::Core Parking is Power-Management Feature within Windows and Your BIOS that basically puts some of your CPU Cores in an "Idling" State to reduce Power consumption and heat.
::Core Parking Logically Is used to Enable only the fastest Cores of your CPU (example P-Cores for Intel CPUs) when the "Workload" is light enough so that other Cores don't need to work actively.
::Core Parking Logically Can help For the Only "Active Cores" (Non-Idling Cores) To reach Higher Frequencies while boosting, Problem is that it's useful only for Laptops
::Core Parking On laptops should be kept Enabled if your battery isn't good enough or if your CPU overheats, but it adds latency and lower performances, on a Desktop, you should disable it

powershell Invoke-WebRequest "https://coderbag.com/assets/downloads/disable-cpu-core-parking/Unpark-CPU-App.zip" -OutFile "%UserProfile%\Desktop\OptiClub\Animations\UnparkCPU\Unpark-CPU-App.zip"
powershell -NoProfile Expand-Archive '%UserProfile%\Desktop\OptiClub\Animations\DisableAnimations\Unpark-CPU-App.zip' -DestinationPath '%UserProfile%\Desktop\OptiClub\Animations\UnparkCPU\Unpark-CPU-App.zip'
start "" /wait "%UserProfile%\Desktop\OptiClub\Animations\UnparkCPU\Unpark-CPU-App.zip\unparkCPU.exe
echo Core Parking has been Fully Disabled. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Downloaded And Started an App to Disable or Enable CPU Core Parking. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling Disk-Timeout
powercfg -change -disk-timeout-ac 0
echo Disabled Disk Timeout >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

echo Enabling GameMode
::Game Mode is A Known and Documented "Tweak" in Windows Settings to Improve 1% lows and Frame consistency by allowing a higher priority overrall to Games and Reducing Windows's Background Activity when a game is actively in need of ressources or started.
::Those Keys Can be only used as "1" and "0" like many others, else windows will "Ignore" them and use it's default, Legacy options (which is 0 = Game Mode Disabled)
echo Enabled Windows Game Mode. Read The Tool for Documentations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AllowAutoGameMode" /t REG_DWORD /d "1" /f 
reg add "HKCU\SOFTWARE\Microsoft\GameBar" /v "AutoGameModeEnabled" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL
echo Disabling Core Integrity (Default Value "1")
::Core Integrity is known as "Core Isolation" and "Kernel Memory Integrity", Or just "Memory Integrity", It allows Windows to uses VBS to protect itself from Viruses. (No real "Harm" in changing this key, it just disables Memory Integrity Protection though.
::Core Integrity is Known to take a bit of ressources when enabled, People who Only do Gaming and who don't download random shit can have it as Disabled
::Default key is "1", we set it to "0"
::Core Integrity can take up to 11% of performances on old hardware and around 3-6% on Modern one.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f
::Def value : 1
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\DeviceGuard" /v "EnableVirtualizationBasedSecurity" /t REG_DWORD /d "0" /f
echo Core Integrity has been Disabled. Read The Tool for Documentations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
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
goto WindowsGraphicSettingsTweaking
timeout /t 1 /nobreak > NUL
:WindowsGraphicSettingsTweaking
color b
start ms-settings:display-advancedgraphics
cls
echo %z%Do You want To Enable HAGS/VRR/Windowed Optimizations ?%q%
echo %z%Those Settings can be found in System, Screens and Graphic settings, a window should have opened to do it all manually, because those settings aren't available everywhere.%q%
echo.
echo %i%HAGS = 1%q%
echo.
echo %i%VRR = 2%q%
echo.
echo %i%Windowed Game Optimizations = 3%q%
echo.
echo %i%ALL = 4%q%
echo.
echo %i%Skip = 5%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto HagsEnableCHoice
if '%choice%'=='2' goto VRREnableCHoice
if '%choice%'=='3' goto WindowedGamesOptimizationsChoice
if '%choice%'=='4' goto HAGSVRRWindowedGamesOptimizationsChoice
if '%choice%'=='5' goto OptimizePerformances2

:HagsEnableCHoice
::HAGS (Hardware-Accelerated GPU Scheduling) Is used to Allow the GPU to Directly manage some part of it's scheduling work instead of relying on the CPU.
::Enabling HAGS can Reduce Latency, Have better Frame Pacing and Consistency and Better "0.1/1% lows. Although, it depends on What hardware and system you have.
::HAGS Values are "0" to "Disable HAGS Fully", "1" To Enable HAGS Under User Control (Depends), "2" to Force-Enable HAGS. We Set it to "2".
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchedMode" /t REG_DWORD /d "2" /f
echo HAGS Has been Force-Enabled. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Windowed Games Optimizations and VRR and HAGS have all been Enabled via Regedit. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 3 /nobreak > NUL

goto OptimizePerformances2
:VRREnableCHoice
::VRROptimizeEnable Enable Windows' Variable Refresh Rate Optimization Preferences, You can only put =1 to enable at the end of the key, and =0 to Disable. It's helpful to have a smoother gameplay and reduce screen tearing overrall
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;" /f
echo Enabled Windows VRR with regedit. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 3 /nobreak > NUL


goto OptimizePerformances2
:WindowedGamesOptimizationsChoice
::SwapEffectUpgradeCache Is another attempt to have better "Frame Consistency/Pacing and lower Latency for Windowed Games", This key only reacts to "0" and "1", default value is "0" (Disabled), We Enabled it to allow better caching ("1"). - This key is Deprecated on Windows 11, Because the key just above does the same thing.
reg add "HKEY_CURRENT_USER\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d 1 /f
::SwapEffectUpgradeEnable allows DirectX Apps to use a more Modern model rendering path. You can only put =1 to enable and =0 to disable, this can help to lower latency and have better frame consistency and pacing. It can help to reduce overhead and help under load. It's Also just known as "Windowed Games Optimizations" :D
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "SwapEffectUpgradeEnable=1;" /f

goto OptimizePerformances2
:HAGSVRRWindowedGamesOptimizationsChoice
echo Enabling Windowed Game Optimizations, VRR and HAGS.
::VRROptimizeEnable Enable Windows' Variable Refresh Rate Optimization Preferences, You can only put =1 to enable at the end of the key, and =0 to Disable. It's helpful to have a smoother gameplay and reduce screen tearing overrall
::SwapEffectUpgradeEnable allows DirectX Apps to use a more Modern model rendering path. You can only put =1 to enable and =0 to disable, this can help to lower latency and have better frame consistency and pacing. It can help to reduce overhead and help under load. It's Also just known as "Windowed Games Optimizations" :D
reg add "HKCU\SOFTWARE\Microsoft\DirectX\UserGpuPreferences" /v "DirectXUserGlobalSettings" /t REG_SZ /d "VRROptimizeEnable=1;SwapEffectUpgradeEnable=1;" /f
echo Enabled Windows VRR and Windowed Games Optimizations with regedit. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
::SwapEffectUpgradeCache Is another attempt to have better "Frame Consistency/Pacing and lower Latency for Windowed Games", This key only reacts to "0" and "1", default value is "0" (Disabled), We Enabled it to allow better caching ("1"). - This key is Deprecated on Windows 11, Because the key just above does the same thing.
reg add "HKEY_CURRENT_USER\Software\Microsoft\DirectX\GraphicsSettings" /v "SwapEffectUpgradeCache" /t REG_DWORD /d 1 /f
echo Enabling HAGS (please delete the keys if you're on Windows Server (IoT LTSC) HAGS Is not supported here.
::HAGS (Hardware-Accelerated GPU Scheduling) Is used to Allow the GPU to Directly manage some part of it's scheduling work instead of relying on the CPU.
::Enabling HAGS can Reduce Latency, Have better Frame Pacing and Consistency and Better "0.1/1% lows. Although, it depends on What hardware and system you have.
::HAGS Values are "0" to "Disable HAGS Fully", "1" To Enable HAGS Under User Control (Depends), "2" to Force-Enable HAGS. We Set it to "2".
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchMode" /t REG_DWORD /d "2" /f 
reg add "HKLM\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "HwSchedMode" /t REG_DWORD /d "2" /f
echo HAGS Has been Force-Enabled. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Windowed Games Optimizations and VRR and HAGS have all been Enabled via Regedit. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 3 /nobreak > NUL
goto OptimizePerformances2

:OptimizePerformances2
Echo Disabling Windows Basic Bullshit...
color b
echo Disabling Windows Insider Experiments
::Windows Insider Experiments are Tests that Microsoft can run on Users in the Windows Insider Program to test new features. default values for those keys are "1", we disabled them. ("0")
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\current\device\System" /v "AllowExperimentation" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\PolicyManager\default\System\AllowExperimentation" /v "value" /t REG_DWORD /d "0" /f
echo Windows Insider Experiments have been Disabled. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
cls
color b
echo Disabling Windows Tips
::Windows Tips are just Useless. (Default value = Deleted or "1")
echo Disabled Windows Tips >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "SoftLandingEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Windows Spotlight
::Windows Spotlight is basically a  part of the Windows Content Delivery Manager, it can show overlay contents on the lock screen images and "Informations" about the background picture.
::Default value is "1", We Disabled it
echo Disabled Windows SpotLight and Overlay Contents. Read tool for documentations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "RotatingLockScreenOverlayEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Shared Experiences
echo Disabled Windows Shared Experiences >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "CdpSessionUserAuthzPolicy" /t REG_DWORD /d "0" /f
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\CDP" /v "NearShareChannelUserAuthzPolicy" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Bing Search
echo Disabled Bing Search through Taskbar. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Search" /v "BingSearchEnabled" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL

cls
color b
echo Disabling Background Apps
::Disabling Background Apps is a key made for Windows 10 and 11 (Logically) but which is now getting Ignored by Apps and other "Policies" within Windows 11.
::Those keys still work fully For Windows 10 and they "Force-Disable" Background Application Access. (which lots and lots of people manually disabled in Settings > Privacy > Background Apps.
reg add "HKCU\Software\Microsoft\Windows\CurrentVersion\BackgroundAccessApplications" /v "GlobalUserDisabled" /t REG_DWORD /d "1" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Search" /v "BackgroundAppGlobalToggle" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\AppPrivacy" /v "LetAppsRunInBackground" /t REG_DWORD /d "2" /f
echo Disabled Background Apps, Read the tool for Documentations. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Note : Disabling Background Apps key should be removed if you use Windows 11. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

cls
echo disabling power Throttling
::Power Throttling is Logically used to manage and reduce overrall CPU usage by running "background apps" in a more "efficient way" to save up battery life and reduce heat. It can be good for laptop but not desktops.
::Power Throttling can add Latency when Enabled. "Default Value "0" (Power Throttling is enabled) We set it to "1" (Power Throttling is Disabled)
::Small Note, on Windows 11 you'd prefer to keep it Enabled because Windows now manages this better than it used to on Windows 10.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power\PowerThrottling" /v "PowerThrottlingOff" /t REG_DWORD /d 1 /f
echo Disabled Power Throttling, Read the tool for Documentations. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL

echo Disabling Fast Startup
::Fast Startup, or Hiberboot, or Hybrid Boot, is a Feature within Windows that's made to speed up Shutting down and booting up process by "Hibernating" the Current Kernel Session instead of fully shutting down the PC.
::On Desktops, This is Useless.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "HiberbootEnabled" /t REG_DWORD /d "0" /f
echo Disabled Fast Startup. Read tool for Documentations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL

cls

echo Disabling Sleep Study
::Sleep Study is a feature that tracks what happens in Windows while the PC is in standby, this is useless and should just be disabled. It's used as logs and diagnostic.
::Default value "0"
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\Power" /v "SleepStudyDisabled" /t REG_DWORD /d "1" /f
echo Disabled Sleep Study. Read tool for Documentations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL

cls

echo Keeping Fault Tolerant Heap (default value "1")
::Fault Tolerant Heap is a Windows Memory Protection Feature that logs and detects when an application crashes due to memory corruptions and "try to apply mitigations" to prevent further crashes.
::FTH is a Feature in Windows Error Reporting
::On Modern Systems, Disabling this will not help in performances at all because it only activates when an app crashes repeatedly
::Default Value "1"
reg add "HKLM\SOFTWARE\Microsoft\FTH" /v "Enabled" /t REG_DWORD /d "1" /f
echo Enabled Fault Tolerant Heap, Read tool for Documentations >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL

echo Disabling Service Host Splitting (SvcHosts)
::Documentation : "https://learn.microsoft.com/en-us/windows/application-management/svchost-service-refactoring")

powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Disable-SvcHosts-Splitting.ps1" -OutFile "%temp%\Disable-SvcHosts-Splitting.ps1"
start powershell "" "%temp%\Disable-SvcHosts-Splitting.ps1"
echo Disabled Services Host Splitting >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

echo Enabling MSI Mode
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "3" /f
)
timeout /t 1 /nobreak > NUL

color b
cls
echo Setting Game Priorities/MMCSS
::Documentation is Really easy to find on the Internet, please do search.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "GPU Priority" /t REG_DWORD /d "8" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Priority" /t REG_DWORD /d "6" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Scheduling Category" /t REG_SZ /d "High" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Priority" /t REG_SZ /d "High" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Latency Sensitive" /t REG_SZ /d "True" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "SFIO Rate" /t REG_DWORD /d "4" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Multimedia\SystemProfile\Tasks\Games" /v "Background Priority" /t REG_DWORD /d "1" /f 
echo Enabled MMCSS Tweaks to apply a higher priority >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL

echo Disabling Windows Media Foundation Frame Server Mode for 32-Bits Apps
::Windows Media Foundation Frame Server is a system component that acts as an intermediary between webcams/capture devices and applications.
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Microsoft\Windows Media Foundation" /v "EnableFrameServerMode" /t REG_DWORD /d "0" /f 
echo Disabled Windows Media Foundation Frame Server. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

echo fully disabling SmartScreen.
::For Documentation, SmartScreen is nothing else than a pop-up asking if you "really want to start a program" while it remains active in background forever, taking between 9 to 117mb of ram (at peak usage after hours, for some reason)
::if you really want to Enable it again, put the values that we set to "0" back to "1" and "off" to "on", you can revert permissions in the Script Menu.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "EnableSmartScreen" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows Defender SmartScreen" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableSmartScreen" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
echo SmartScreen has been Disabled through regedit, Read Tool for Documentation. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling SmartScreen.exe (Already disabled, but just in case, we'll revoke the permissions to use it)
taskkill /f /im smartscreen.exe
takeown /f "C:\Windows\System32\smartscreen.exe"
icacls "C:\Windows\System32\smartscreen.exe" /deny Everyone:(X)
icacls "C:\Windows\System32\smartscreen.exe"/remove Everyone:f
echo Permissions to start SmartScreen.exe have been revoked, read tool for Documentation. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL

echo Disabling Bonjour Service (mdnsNSP.dll)
taskkill /f /im mDNSResponder.exe
takeown /f "C:\Program Files (x86)\Bonjour\mDNSResponder.exe"
icacls "C:\Program Files (x86)\Bonjour\mDNSResponder.exe" /deny Everyone:(X)

echo Disabling Cross Device Resume
taskkill /f /im CrossDeviceResume.exe
takeown /f "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe"
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe" /deny Everyone:(X)

color b
echo Disabling Delivery Optimization
::Note : It can be good to disable Delivery Optimizations, Disabling it sets your windows Updates and App Updates to "Internet/Cloud Download Only" Only through MS-Servers.
::Note : To Revert, just set the keys back to "1" instead of "0".
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DODownloadMode" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Config" /v "DownloadMode" /t REG_DWORD /d "0" /f 
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\DeliveryOptimization\Settings" /v "DownloadMode" /t REG_DWORD /d "0" /f 
echo Done Disabling "Delivery Optimizations". >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Enabling Cache Aware Scheduling. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

echo Enabling CacheAwareScheduling
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Session Manager\kernel" /v "CacheAwareScheduling" /t REG_DWORD /d "7" /f
echo Possible Values
echo 0, Disabled
echo 1, Enabled, Basic cache-aware Scheduling
echo 2, Enhanced Cache-Aware Scheduling, Best for multi core systems apparently)
echo 7, Full cache-aware scheduling (combination of flags; default on some systems).
echo Default Value : Deleted
cls
echo Disabling additional NTFS/ReFS mitigations (Default value "1")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager" /v "ProtectionMode" /t REG_DWORD /d "0" /f
cls
echo You need to be in Windows Safe mode to use this.
echo Windows Defender Tweaks.
pause
cls
echo Adding regedit Keys.
echo  virus and threat protection - manage settings
echo  real time protection - needs safe boot as trusted installer - windows turns this back on automatically (Key Default Value = 0)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableRealtimeMonitoring" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
echo  dev drive protection - needs safe boot as trusted installer (Key Default Value = 0)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Real-Time Protection" /v "DisableAsyncScanOnOpen" /t REG_DWORD /d "1" /f 
timeout /t 1 /nobreak > NUL
echo  cloud delivered protection - needs safe boot as trusted installer (Key Default Value = 2)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SpyNetReporting" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
echo  automatic sample submission (Key Default Value = 1)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Spynet" /v "SubmitSamplesConsent" /t REG_DWORD /d "0" /f 
timeout /t 1 /nobreak > NUL
echo  tamper protection - needs safe boot as trusted installer (Key Default Value = 1)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Features" /v "TamperProtection" /t REG_DWORD /d "4" /f
timeout /t 1 /nobreak > NUL
echo  virus and threat protection - manage ransomware protection
echo  controlled folder access
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows Defender\Windows Defender Exploit Guard\Controlled Folder Access" /v "EnableControlledFolderAccess" /t REG_DWORD /d "0" /f
timeout /t 1 /nobreak > NUL
echo Fully disabling SmartScreen.
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\AppHost" /v "EnableWebContentEvaluation" /t REG_DWORD /d "0" /f 
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Edge\SmartScreenEnabled" /ve /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /v "SmartScreenEnabled" /t REG_SZ /d "Off" /f
echo Disabling Core Integrity (Default Value "1")
reg add "HKLM\SYSTEM\CurrentControlSet\Control\DeviceGuard\Scenarios\HypervisorEnforcedCodeIntegrity" /v "Enabled" /t REG_DWORD /d "0" /f
echo Done!
pause

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
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\wallpaper64.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
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
echo Setting "csrss.exe" Priority to RT. (Real Time)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "4" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\csrss.exe\PerfOptions" /v "IoPriority" /t REG_DWORD /d "3" /f
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
echo Reducing Discord Priority.
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discord.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\Discordptb.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\DiscordCanary.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
echo Lowered Windows Apps Priorities. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
echo Disabling msfeed sync.
echo Disabled msfeed sync. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
msfeedssync disable
timeout /t 2 /nobreak > NUL
echo Disabling MicrosoftUpdate Icon in TaskbarAnimations
reg add "HKLM\SOFTWARE\Microsoft\WindowsUpdate\UX\Settings" /v "TrayIconVisibility" /t REG_DWORD /d "0" /f
timeout /t 2 /nobreak > NUL
echo Disabling tabtip.exe (Only for desktop)
reg add "HKEY_CURRENT_USER\Software\Microsoft\TabletTip\1.7" /v "EnableDesktopModeAutoInvoke" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\TabletTip\1.7" /v "EnableTabTip" /t REG_DWORD /d "0" /f
echo Disabled Windows Update Taskbar Icon. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CSC" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /v "Start" /t REG_DWORD /d 4 /f   

echo Disabling MobSync.exe (MicrosoftSync)
taskkill /f /im mobsync.exe
takeown /f "C:\Windows\System32\mobsync.exe"
icacls "C:\Windows\System32\mobsync.exe" /deny Everyone:(X)
icacls "C:\Windows\System32\mobsync.exe" /remove Everyone:f
timeout /t 1 /nobreak > NUL
echo Done Optimizing Performances, Returning to Menu. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Done Optimizing Performances, Returning to Menu.
timeout /t 2 /nobreak > NUL
echo Disabling Windows Upon Start Apps Startup Delay (shell:start initialize delay)
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "WaitForIdleState" /t REG_DWORD /d 0 /f   
reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Serialize" /v "StartupDelayInMSec" /t REG_DWORD /d 0 /f  
goto AMDPROCESSESLOWERER

:AMDPROCESSESLOWERER
color b
cls
echo %z%Do you have an AMD GPU, If so, Do you want to lower the priority of the AMD Driver Services and disable a few AMD Radeon Settings ?%q%
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
echo User lowered AMD GPU Services Priorities >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
echo Lowering Prorities

reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\cncmd.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\atieclxx.exe\PerfOptions" /v "CpuPriorityClass" /t REG_DWORD /d "1" /f

timeout /t 2 /nobreak > NUL

echo Disabling MobileLink (OverCloudAuth)
reg add  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MobileLinkOverCloudAuth_NA" /t REG_DWORD /d "0" /f
echo Disabled AMD Mobile Link. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabled Animated Effects, Transparency and Web Content in Radeon Software.
reg add "HKCU\Software\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f
echo Disabled Animated Effects, Transparency and Web Content in Radeon Software. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabled DVR.
echo Disabled AMD DVR. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
echo Disabling ULPS (Default Values = 1)
echo Disabled AMD ULPS. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_SZ /d "1" /f 

echo Done!

goto Menu

:DisableTelemetry
echo User Used Disable Telemetry. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
color b

cls

md %UserProfile%\Desktop\OptiClub\OOSU10\Cfg

powershell Invoke-WebRequest "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -OutFile "%UserProfile%\Desktop\OptiClub\OOSU10\OOSU10.exe"
timeout /t 3 /nobreak > NUL
powershell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/OOSU-Config/refs/heads/main/Opticlub-V6.7.cfg" -OutFile "%UserProfile%\Desktop\OptiClub\OOSU10\Cfg\Opticlub-V6.7.cfg"
set OOSUPath="%UserProfile%\Desktop\OptiClub\OOSU10\OOSU10.exe"
set ConfigPath="%UserProfile%\Desktop\OptiClub\OOSU10\Cfg\Opticlub-V6.7.cfg"

if exist %OOSUPath% (
    if exist %ConfigPath% (
        %OOSUPath% %ConfigPath%
    )
)
start "" /wait "%UserProfile%\Desktop\OptiClub\OOSU10\OOSU10.exe"
echo Done.
echo Downloaded OOSU10.exe. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Downloaded OptiClub's OOSU Config File >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Exported and Applied OptiClub's Config File. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 2 /nobreak > NUL
echo Disabled Telemetry Services After Using OOSU10.exe. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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

reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\CloudContent" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
reg add "HKEY_CURRENT_USER\SOFTWARE\Microsoft\Windows\CurrentVersion\ContentDeliveryManager" /v "DisableWindowsConsumerFeatures" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvide" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableWindowsLocationProvider" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocationScripting" /t REG_DWORD /d "1" /f 
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\LocationAndSensors" /v "DisableLocation" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Disabling RPC over Scheduler. (default value = del)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Schedule" /v "DisableRpcOverTcp" /t REG_DWORD /d "00000001" /f
echo Disabled WindowsConsumerFeatures and Location Provide. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabled RPC over Scheduler. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling Location Tracking (FROM https://github.com/ChrisTitusTech/winutil/blob/main/config/tweaks.json)
reg add "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\CapabilityAccessManager\ConsentStore\location" /v "Value" /t REG_SZ /d "Deny" /f
echo Disabled Location Tracking, See Tool for Documentation. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling Windows Automatic Error Reporting.
echo Disabling Windows Automatic Error Reporting. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
::Note, This Disables Automatic Windows Error Reporting for all Users, this "Key" is usually used for Windows Servers, because "ServerWerOptin /Disable" Became "Useless" or Ignored.
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "DoReport" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\Windows Error Reporting" /v "LoggingDisabled" /t REG_DWORD /d "1" /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\PCHealth\ErrorReporting" /v "DoReport" /t REG_DWORD /d "0" /f
reg add "HKLM\SOFTWARE\Microsoft\Windows\Windows Error Reporting" /v "Disabled" /t REG_DWORD /d "1" /f
echo Disabled Windows Automatic Error Reporting. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling Data Collection
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\DataCollection" /v "MaxTelemetryAllowed" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\DataCollection" /v "AllowTelemetry" /t REG_DWORD /d "0" /f
echo Disabled Data Collection. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disable sending Windows Media Player statistics
reg add "HKCU\SOFTWARE\Microsoft\MediaPlayer\Preferences" /v "UsageTracking" /t REG_DWORD /d "0" /f
reg add "HKEY_CURRENT_USER\Software\Microsoft\Personalization\Settings" /v "AcceptedPrivacyPolicy" /t REG_DWORD /d "00000000" /f
echo Disabled Sending Windows Media Player Statistics. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabling WpnService connection to Microsoft (This keeps the service enabled and working, just disable its connection to online servers)
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\PushNotifications" /v "NoCloudApplicationNotification" /t REG_DWORD /d "1" /f
echo Disabling User Activity Feed and Publishing.
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "EnableActivityFeed" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "PublishUserActivities" /t REG_DWORD /d 0 /f
reg add "HKLM\SOFTWARE\Policies\Microsoft\Windows\System" /v "UploadUserActivities" /t REG_DWORD /d 0 /f
echo Disabling Co-Pilot.
echo Disabled Cop-Pilot >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\Software\Policies\Microsoft\Windows\WindowsCopilot" /v TurnOffWindowsCopilot /t REG_DWORD /d 1 /f
echo Removing Co-Pilot Package in Windows Files through Powershell.
Powershell -Command "Get-AppxPackage -AllUsers -Name "Microsoft.Windows.Copilot" | Remove-AppxPackage -AllUsers    
timeout /t 1 /nobreak > NUL
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f 
echo Removed Powershell package. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CSC" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Services\CscService" /v "Start" /t REG_DWORD /d 4 /f   

timeout /t 3 /nobreak > NUL

echo Done Disabled Telemetry, Returning to Menu. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Done
timeout /t 2 /nobreak > NUL
Goto Menu

:DisableServices
color b
cls
echo Note! Please note that using some of those can "break" a few things within windows and "core componants" though,
echo it's mostly things like Microsoft Store, Windows Update or a few things, Just Re enable all services if you have a problem
echo (Warning for VR-Users, Disabling those services can "break" the "link" and stability of your VR Headset
echo User Used Disable Services Tool. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
pause
color b
cls
echo %z%Advanced or Basics?%q%
echo.
echo %i%Basics = 1%q%
echo.
echo %i%Revert All Services = 2%q%
echo.
echo.
echo.
echo.
echo.
echo %i%Menu = A%q%
echo.
echo %i%Service Management = B%q%


color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto DisableUselessServicesBasicsNew
if '%choice%'=='2' goto RevertEveryServices
if '%choice%'=='a' goto Menu
if '%choice%'=='A' goto Menu
if '%choice%'=='B' goto ServiceManagementsTool
if '%choice%'=='b' goto ServiceManagementsTool




:DisableUselessServicesBasicsNew
echo Disabling Basic Services. (they will break things on laptops)
echo Note : Those services are disabled for DESKTOP PCs, if you're on Laptop or Tablet-PC, please check what is needed for your PC to work correctly.
echo User Disabled Basic Services. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
color b
echo All Services will be exported in the Logfile and exported in Desktop's OptiClub file, RegeditBackUpKeys.
reg export "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services" %UserProfile%\Desktop\OptiClub\RegeditBackUpKeys\Services\HKLM-Services.reg
echo Exported Current Services Values before applying new ones. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
cls
timeout /t 1 /nobreak > NUL
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DiagTrack" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\stisvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PhoneSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysMain" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TapiSrv" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Themes" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lfsvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RmSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TabletInputService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Spooler" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanWorkstation" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DialogBlockingService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteAccess" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MsKeyboardFilter" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DispBrokerDesktopSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ssh-agent" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UevAgentService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\shpamsvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\uhssvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AppVClient" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetTcpPortSharing" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ALG" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTAGService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMPNetworkSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Fax" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMIRegistrationService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SmsRouter" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SensorService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LanmanServer" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\StorSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\GamingServices" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\GamingServicesNet" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblAuthManager" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WSAIFabricSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcCtnrSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DPS" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BDESVC" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WPDBusEnum" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrkWks" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\smphost" /v "Start" /t REG_DWORD /d 4 /f
sc config PrintDeviceConfigurationService start= disabled
sc stop WPDBusEnum
sc stop BDESVC
sc stop DiagTrack
sc stop stisvc
sc stop PhoneSvc
sc stop SysMain
sc stop TapiSrv
sc stop Themes
sc stop lfsvc
sc stop RmSvc
sc stop DPS
sc stop TabletInputService
sc stop Spooler
sc stop LanmanWorkstation
sc stop DialogBlockingService
sc stop RemoteAccess
sc stop MsKeyboardFilter
sc stop DispBrokerDesktopSvc
sc stop ssh-agent
sc stop UevAgentService
sc stop shpamsvc
sc stop AppVClient
sc stop NetTcpPortSharing
sc stop ALG
sc stop RemoteRegistry
sc stop BTAGService
sc stop WMPNetworkSvc
sc stop Fax
sc stop WMIRegistrationService
sc stop SmsRouter
sc stop Ndu
sc stop DoSvc
sc stop SensorService
sc stop ShellHWDetection
sc stop CDPSvc
sc stop SSDPSRV
sc stop RasMan
sc stop TermService
sc stop LanmanServer
sc stop StorSvc
sc stop XblAuthManager
sc stop WSAIFabricSvc
sc stop BDESVC
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:RevertEveryServices
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
sc config WMPNetworkSvc start= Auto
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
sc config TermService start= Auto
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\DoSvc" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SensorService" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v "Start" /t REG_DWORD /d 2 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CDPSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan" /v "Start" /t REG_DWORD /d 2 /f
sc config WSAIFabricSvc start= Auto
sc start WSAIFabricSvc
sc config PrintDeviceConfigurationService start= demand

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

color b

:ServiceManagementsTool
cls
echo Services Managements Tool.
echo.
echo %i%Windows Update Management = 1%q%
echo.
echo %i%Windows Store Management = 2%q%
echo.
echo %i%Bluetooth Management = 3%q%
echo.
echo %i%Intel Services = 4%q%
echo.
echo %i%Disable WLAN Service (Useful if your internet is via an Ethernet Cable and you don't use Wi-Fi/Bluetooth) = 5%q%
echo.
echo %i%Windows Search Indexor = 6%q%
echo.
echo %i%QWAVE Service Management = 7%q%
echo.
echo %i%HID Service (Debug/Dontdisable) = 8%q%
echo.
echo %i%Menu = A%q%

color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto WindowsUpdateServicesChoice
if '%choice%'=='2' goto enbldsblmcstre
if '%choice%'=='3' goto bthwfsrvcsnbld
if '%choice%'=='4' goto DisableIntelDynamicApplicationLoaderHostInterfaceService
if '%choice%'=='5' goto WlanSvcChoice
if '%choice%'=='6' goto Wdsrchindexorchoice
if '%choice%'=='7' goto QWAVEservicemanagement
if '%choice%'=='8' goto hidservservicemanagement
if '%choice%'=='A' goto Menu
if '%choice%'=='a' goto Menu
color b

:WindowsUpdateServicesChoice
echo Windows Update Services Management.
echo User Used Windows Update Service Management. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "0" /f
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
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d 3 /f
sc config wlidsvc start= demand
sc start wlidsvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcCtnrSvc" /v "Start" /t REG_DWORD /d 3 /f
sc start NgcSvc
sc start NgcCtnrSvc
color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b
:dsblwupdtsftr
color b
cls
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UsoSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WaaSMedicSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 4 /f
sc stop BITS
sc stop wuauserv
sc stop WaaSMedicSvc
sc stop UsoSvc
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wlidsvc" /v "Start" /t REG_DWORD /d 4 /f
sc config wlidsvc start= disabled
sc stop wlidsvc
pause
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
echo User Used Windows Store Service Management. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
icacls "C:\Windows\System32\CompPkgSrv.exe" /remove:d Everyone
icacls "C:\Windows\System32\CompPkgSrv.exe" /setowner "NT Service\TrustedInstaller"
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
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v "DelayedAutostart" /t REG_DWORD /d 1 /f
sc config BITS start= demand
sc start BITS
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NgcCtnrSvc" /v "Start" /t REG_DWORD /d 3 /f
sc start NgcSvc
sc start NgcCtnrSvc

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
echo %z%Enable or Disable Bluetooth ?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo User Used Bluetooth Service Management. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto enblblth
if '%choice%'=='2' goto dsblblth

:enblblth
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
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d 3 /f
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:dsblblth
color b
cls
sc config Wcmsvc start= disabled
sc config WlanSvc start= disabled
sc config NcbService start= demand
sc config BTAGService start= disabled
sc config bthserv start= disabled
sc config PcaSvc start= auto
sc config UevAgentService start= Auto
sc config ShellHWDetection start= auto
sc config DeviceAssociationService start= disabled
sc config BthAvctpSvc start= disabled
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d 4 /f

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:DisableIntelDynamicApplicationLoaderHostInterfaceService
cls
echo User Used Intel Application Loader Host Service Management. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
echo Enabling INTEL ME Engine via regedit
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MEIx64" /v "Start" /t REG_DWORD /d 3 /f
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
echo Disabling INTEL ME Engine via regedit (This doesn't really disable it at all, but this "Sometimes" helps with latency or small weird spikes. Default value = 3)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MEIx64" /v "Start" /t REG_DWORD /d 4 /f
sc config jhi_service start= disabled
sc stop jhi_service
sc config WMIRegistrationService start= disabled
sc stop WMIRegistrationService
cls
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu
color b

:WlanSvcChoice
cls
echo User Used WLAN Service Management. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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

:QWAVEservicemanagement
color b
cls
echo %z%Enable or Disable QWAVE Service ? (It's needed for a few apps, example, VR Headset Apps (quest link, others)%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableQWAVEService
if '%choice%'=='2' goto DisableQWAVEService


:EnableQWAVEService
cls
color b
cls
sc config QWAVE start= demand
sc start QWAVE
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:DisableQWAVEService
cls
color b
cls
sc config QWAVE start= disabled
sc stop QWAVE
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu


:hidservservicemanagement
color b
cls
echo %z%Enable or Disable hidserv Service ? (Don't really do it if you have buttons related to volume, audio, mute, or more via USBs/keyboards)%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Enablehidservsrvcs
if '%choice%'=='2' goto Disablehidservsrvcs


:Enablehidservsrvcs
color b
cls
sc config hidserv start= demand
sc start hidserv
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:Disablehidservsrvcs
color b
cls
sc config hidserv start= disabled
sc stop hidserv
color b
echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:OptimizeNvidiaGPU
echo User Used Optimize Nvidia GPU tool, Read tool for Documentations. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
::Note : You can revert all changes (yes, all of them) by redownloading your GPU Driver to "Reset" all current keys and Panel Config. Thank you.
::Note : Please do benchmarks before/after if possible.
echo Optimizing Nvidia GPU.
echo Please, if possible, do benchmarks before/after.
cls

echo Enabling MSI Mode
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "3" /f
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

echo Downloaded Nvidia Inspector Profile Tool. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Downloaded OptiClub's Nvidia GPU Profile. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Applied OptiClub's Nvidia GPU Profile through NvInspector.exe. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Done Optimizing Nvidia GPU, returning back to Menu. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

pause

goto Menu

:OptimizeAMDGPU
echo User Used Optimize AMD Gpu Tool. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
echo AMD GPU Panel Tool.
echo %z%Enable / Reverse Tweaks?%q%
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Reverse = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableAMDPRFL
if '%choice%'=='2' goto ReverseAMDPRFL

:EnableAMDPRFL
cls
:: Disabling SnapShots and RSOverlays, nothing wrong.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t REG_SZ /d "false" /f
echo Disabled AMD Panel Overlays and Snapshots. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
:: # Disable DMA Copy
:: # Direct Memory Access (DMA) engines for data transfers between system memory and the GPU, or within the GPU itself
:: # Uses GPU instead of CPU for DMA (similar to HAGS)
:: # Outdated on Modern GPUs and Drivers. However, Windows just "Ignores" the key. No harm is done by adding or removing it, it stays ON by default through IOMMU.
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "DisableDMACopy" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "0" /f
:: Mobile Link is just Useless.
echo Disabling MobileLink (OverCloudAuth)
reg add  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MobileLinkOverCloudAuth_NA" /t REG_DWORD /d "0" /f
echo Disabled AMD Mobile Link. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
echo Disabling Anti-Aliasing
:: Disabling Anti Aliasing can be Good for FPS.
echo Disabling AMD Anti-Aliasing, Texture and Tesselation Settings. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Note : This will trigger results to be unapproved in 3Dmark. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "1" /f
:: Surface Format Replacements is a Driver setting that allows the GPU to switch to another texture format when rendering, this is often made to "Improve performances" and reduce VRAM Usage by a bit.
:: This Setting isn't really useful for GPUs with more than 12GB of VRAM and/or Modern GPUs in general most likely. (Those "new GPUs" just already have the capabilites to handle their render without having to switch to this)
echo Enabled Surface Format Replacements for AMD GPU Driver  >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Enabling Surface Format Replacements
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SurfaceFormatReplacements" /t REG_BINARY /d "31 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "SurfaceFormatReplacements_DEF" /t REG_SZ /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SurfaceFormatReplacements_DEF" /t REG_SZ /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "SurfaceFormatReplacements_NA" /t REG_SZ /d "0" /f
echo Enabled Surface Format Replacements. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Force-Disable Tesselation for FPS and lower Latency
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation" /t REG_BINARY /d "31 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_DEF" /t REG_SZ /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION_DEF" /t REG_SZ /d "2" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_OPTION" /t REG_BINARY /d "32 0" /f
echo Force-Disable Tesselation for FPS and lower Latency. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Enabling Force Shader Caching (Default value 31 0 (31 00 in regedit, if you do it manually)
echo Enabled Force Shader Caching for AMD GPU Drivers (This helps with micro stuttering in games). >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_BINARY /d "32 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "ShaderCache" /t REG_SZ /d "2" /f
echo Enabling MSI-Mode for AMD Gpu
for /f %%g in ('wmic path win32_videocontroller get PNPDeviceID ^| findstr /L "VEN_"') do (
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\MessageSignaledInterruptProperties" /v "MSISupported" /t REG_DWORD /d "1" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Enum\%%g\Device Parameters\Interrupt Management\Affinity Policy" /v "DevicePriority" /t REG_DWORD /d "3" /f
)
timeout /t 1 /nobreak > NUL
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Main3D" /t REG_BINARY /d "33 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "33 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "3" /f
echo Disabled Animated Effects, Transparency and Web Content in Radeon Software.
reg add "HKCU\Software\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f
echo Disabled Animated Effects, Transparency and Web Content in Radeon Software. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Disabled DVR.
echo Disabled AMD DVR. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKCU\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
reg add "HKLM\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f
echo Disabling ULPS (Default Values = 1)
echo Disabled AMD ULPS. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_SZ /d "1" /f 
timeout /t 1 /nobreak > NUL
echo Disabling HighQualityAF (Anisotropic Filtering) Default Value = "31 0", New Value "30 0" (Binary) "31" means enabled while "30" means disabled.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "HighQualityAF" /t REG_BINARY /d "30 0" /f
echo Disabling AMD Crash Defender Service, Read Logfile or Tool for doc.
echo Disabled AMD Crash Defender Service. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo This can be done without problems if you don't use extreme overclock or test settings, if you notice instability, please revert this. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Note : Disabling this Service will make it so that the Driver does not "Recover" when crashing, meaning you will have to restart your PC to Restart the driver as a whole. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Done! 
timeout /t 1 /nobreak > NUL


Goto DisableRADEONPWRGATING
:ReverseAMDPRFL
echo User Reversed AMD GPU Profile >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowSnapshot" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AllowRSOverlay" /t REG_SZ /d "true" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDMACopy" /t REG_DWORD /d 0 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_SclkDeepSleepDisable" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "PP_GPUPowerDownEnabled" /t REG_DWORD /d "1" /f
echo Enabling MobileLink (OverCloudAuth)
reg add  "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "MobileLinkOverCloudAuth_NA" /t REG_DWORD /d "1" /f
timeout /t 1 /nobreak > NUL
echo Enabling Anti-Aliasing
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AAF_NA" /t REG_DWORD /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "AntiAlias_NA" /t REG_SZ /d "0" /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "ASTT_NA" /t REG_SZ /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Tessellation_DEF" /t REG_SZ /d "64" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "Main3D" /t REG_BINARY /d "33 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D" /t REG_BINARY /d "33 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "Main3D_DEF" /t REG_SZ /d "3" /f
reg add "HKCU\Software\AMD\CN" /v "AllowWebContent" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\CN" /v "AnimationEffect" /t REG_SZ /d "false" /f
reg add "HKCU\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "1" /f
reg add "HKLM\Software\AMD\DVR" /v "DvrEnabled" /t REG_DWORD /d "0" /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SurfaceFormatReplacements" /t REG_BINARY /d "30 0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "SurfaceFormatReplacements_DEF" /t REG_SZ /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "SurfaceFormatReplacements_DEF" /t REG_SZ /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "SurfaceFormatReplacements_NA" /t REG_SZ /d "0" /f

echo Enabling ULPS (Default Values = 1)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps" /t REG_DWORD /d 1 /f
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "EnableUlps_NA" /t REG_SZ /d "1" /f 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000\UMD" /v "HighQualityAF" /t REG_BINARY /d "31 0" /f
echo Enabling AMD Crash Defender Service back to it's default state.
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMD Crash Defender Service" /v "Start" /t REG_DWORD /d 2 /f
SC START "AMD Crash Defender Service"
timeout /t 1 /nobreak > NUL
Goto DisableRADEONPWRGATING

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
echo Successfully Enabled GPU Powergating >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 3 /nobreak > NUL
goto ExperimentalRadeonGPUValues
timeout /t 3 /nobreak > NUL

color b

goto Menu

:DisablePWRGating
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Class\{4d36e968-e325-11ce-bfc1-08002be10318}\0000" /v "DisableDynamicPstate" /t REG_DWORD /d "1" /f
echo Successfully Disabled GPU Powergating
echo Successfully Disabled GPU Powergating >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 3 /nobreak > NUL

color b

goto Menu

:DebloatWindows
echo User Used Debloat Windows Tool. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
echo Removed windows apps through powershell >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

reg add "HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Start\Companions\Microsoft.YourPhone_8wekyb3d8bbwe" /v "IsEnabled" /t REG_DWORD /d "00000000" /f 

echo Disabled "Your Phone" App with regedit. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
   
timeout /t 5 /nobreak > NUL

:OneDriveDisablerChoice
color b
cls
echo %z%Do you want to Uninstall OneDrive ?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto DisableOneDriver
if '%choice%'=='2' goto EdgeFullUninstallerchcs

:DisableOneDriver
cls
echo Disabling and Uninstalling One Drive. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
echo Disabled and Uninstalled One Drive. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

cls

cls
goto EdgeFullUninstallerchcs
:EdgeFullUninstallerchcs
color b
cls
echo %z%Do you want to Fully Uninstall Edge and WebView ?%q%
echo Disabling Edge/I.E/WebView can cause problems on games like roblox
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto edgefulluninstaller
if '%choice%'=='2' goto afteredgefulluninstaller

:edgefulluninstaller
echo User choose to totally remove edge and webview (can be reinstalled using the same script). >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/Edge_Removal.bat" -OutFile "%temp%\Edge_Removal.bat"
start "" "%temp%\Edge_Removal.bat
taskkill/im msedge.exe
cd %PROGRAMFILES(X86)%\Microsoft\Edge\Application\1*\Installer
cd C:\Program Files (x86)\Microsoft\Edge\Application\
setup.exe --uninstall --system-level --verbose-logging --force-uninstall
rd /s /q "C:\Program Files (x86)\Microsoft\Edge"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeCore"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeUpdate"
rd /s /q "C:\Program Files (x86)\Microsoft\EdgeWebView"
rd /s /q "C:\Program Files (x86)\Microsoft\Temp"
takeown /f "C:\Program Files (x86)\Microsoft"
reg add "HKLM\Software\Microsoft\EdgeUpdate" /v "DoNotUpdateToEdgeWithChromium" /t REG_DWORD /d "1" /f 
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
timeout /t 1 /nobreak > NUL

:afteredgefulluninstaller


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

cls

echo disabling Co-Pilot
Powershell -Command "Get-AppxPackage -AllUsers -Name "Microsoft.Windows.Copilot" | Remove-AppxPackage -AllUsers    
timeout /t 1 /nobreak > NUL
echo stopping automatic reinstall via updates
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsCopilot" /v "TurnOffWindowsCopilot" /t REG_DWORD /d "1" /f 
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" /v "ExcludeWUDriversInQualityUpdate" /t REG_DWORD /d "1" /f
timeout /t 3 /nobreak > NUL

echo Done
pause

goto Menu

:ImportCPUProfile
color b
cls
echo Note : This Powerplan is made for Intel 12-13-14 Gen CPUs, Not optimized for AMD.
powershell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/MSI_UTIL_V3/refs/heads/main/OptiClub-V6.6.7-B.pow" -OutFile "%temp%\OptiClub-V6.6.7-B.pow"
pause
powercfg -import "%temp%\OptiClub-V6.6.7-B.pow"
start control powercfg.cpl
echo Successfully Imported Custom Powerplan
echo Note! If your PC behaves weirdly (random reboots, crashes under load, please revert to the normal windows powerplan or other one you know works)
echo Note! : Revert the next regedit keys too, default keys are here.
echo If problems still happen, go to premade configs and use the default windows one (second one) this resets everything to default in windows settings and regedit keys that our script changed)
pause
timeout /t 3 /nobreak > NUL

echo optimizing Power usage (CPU)

echo disabling Hibernation (Default value : "1") (useless if on desktop PC, good for laptops tho)
reg add "HKLM\SYSTEM\CurrentControlSet\Control\Power" /v "HibernateEnabled" /t REG_DWORD /d "0" /f
powercfg.exe /hibernate off

echo Done!
pause
goto Menu

:PremadeCFGs
color b
md %UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\
md %UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\
cls
echo %w%════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════%y%
echo.
echo.
echo				%w%[%y% %c%%u%1%q%%t% %w%]%y% %c%Aggressive CFG (Aggressive, contains all tweaks from the tool, can break OS functions)%t%
echo.
echo				%w%[%y% %c%%u%2%q%%t% %w%]%y% %c%Default CFG (To revert Any changes done by the tool)%t%
echo.
echo				%w%[%y% %c%%u%3%q%%t% %w%]%y% %c%Safe-Aggressive (Shouldn't break anything/critical) CFG%t%
echo.
echo				%w%[%y% %c%%u%4%q%%t% %w%]%y% %c%Soft CFG (recommended if you don't know how to use this tool and read it fully)%t%
echo.
echo				%w%[%y% %c%%u%5%q%%t% %w%]%y% %c%RAI TOOL%t% 
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
if '%choice%'=='1' goto ALLWindowsAggressiveCFG
if '%choice%'=='2' goto DefaultCFG
if '%choice%'=='3' goto SafeAggressiveCFG
if '%choice%'=='4' goto SoftPerformancesCFG
if '%choice%'=='5' goto RAI-TOOL
if '%choice%'=='a' goto Menu
if '%choice%'=='A' goto Menu

:SoftPerformancesCFG
cls
echo Note : This CFG doesn't disable lots of things and normally doesn't break anything either, if you lose CPU scores in benchmarks, please use another powerplan in windows.)
powershell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/Configs/refs/heads/main/OptiClub-Soft.bat" -OutFile "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Soft.bat"
start "" /wait "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Soft.bat
echo Done

pause

goto Menu

:ALLWindowsAggressiveCFG
cls
color b

powershell Invoke-WebRequest "https://github.com/ZaneLS/Configs/raw/refs/heads/main/OptiClub-Aggressive.bat" -OutFile "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Aggressive.bat"
start "" /wait "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Aggressive.bat

echo Done

pause

goto Menu

:DefaultCFG
cls
color b

powershell Invoke-WebRequest "https://github.com/ZaneLS/Configs/raw/refs/heads/main/OpticlubDefault.bat" -OutFile "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Default.bat"
start "" /wait "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Default.bat

echo Done

pause

goto Menu

:SafeAggressiveCFG
cls
color b

powershell Invoke-WebRequest "https://github.com/ZaneLS/Configs/raw/refs/heads/main/OptiClub-Safe-Aggressive.bat" -OutFile "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Safe-Aggressive.bat"
start "" /wait "%UserProfile%\Desktop\OptiClub\PremadeCFGs\Cfgs\OptiClub-Safe-Aggressive.bat

echo Done

pause

goto Menu

:RAI-TOOL
cls
echo Right After Install Script (Does not break anything, barely disable things)
md %UserProfile%\Desktop\OptiClub\RAI-Tool\Soft\

powershell Invoke-WebRequest "https://github.com/ZaneLS/Right-After-Install/raw/refs/heads/main/Right-After-Install.bat -OutFile "%UserProfile%\Desktop\OptiClub\RAI-Tool\Soft\Right-After-Install.bat"
start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\RAI-Tool\Soft\"
echo Done

pause

goto Menu

:: Windows Processes Disabler

:: This Part of the Tool is Used to "Remove Background Processes" While playing games or overrall until needed, this can lower ram and CPU usage in the background.
:: but those processes are critical and needed for Windows Update, Windows Store and for Tablet-PCs
:: This is why there's the option to revert permissions for windows to be able to start those critical processes when needed.

:: Small note : It can apparently improve stutterings, somehow.

:WindowsAppsDisabler
echo User Used Windows System Processes Disabler. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
color b
cls
echo %z%Enable/Disable Windows Apps ?%q%
echo Note: Enable them to use Update or Store (This WILL break a few things).
echo Note: Please read the tool before using.
echo.
echo %i%Enable Windows System Processes = 1%q%
echo.
echo %i%Disable Windows System Processes = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableWindowsApps01
if '%choice%'=='2' goto DisableWindowsApps02
color b

:EnableWindowsApps01
echo User Enabled Windows System Processes. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
echo Enabling amdow.exe
icacls "C:\AMD\CNext\CNext\amdow.exe" /remove:d Everyone
icacls "C:\AMD\CNext\CNext\amdow.exe" /setowner "NT Service\TrustedInstaller"
echo Enabling AMDRSServ.exe
icacls "C:\AMD\CNext\CNext\AMDRSServ.exe" /remove:d Everyone
icacls "C:\AMD\CNext\CNext\AMDRSServ.exe" /setowner "NT Service\TrustedInstaller"
timeout /t 1 /nobreak > NUL
echo DataExchangeHost.exe
icacls "C:\Windows\System32\DataExchangeHost.exe" /remove:d Everyone
icacls "C:\Windows\System32\DataExchangeHost.exe" /setowner "NT Service\TrustedInstaller"
echo SystemSettingsBroker.exe
icacls "C:\Windows\System32\SystemSettingsBroker.exe" /remove:d Everyone
icacls "C:\Windows\System32\SystemSettingsBroker.exe" /setowner "NT Service\TrustedInstaller"
echo Enabling Cross Device Resume
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe" /remove:d Everyone
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe" /setowner "NT Service\TrustedInstaller"
echo Enabling UserOOBEBroker.exe
icacls "C:\Windows\System32\oobe\UserOOBEBroker.exe" /remove:d Everyone
icacls "C:\Windows\System32\oobe\UserOOBEBroker.exe" /setowner "NT Service\TrustedInstaller"


echo Done (Ignore it if windows says "couldn't access")
echo Small Tip: This sets the permissions to only "Nt Service\TrustedInstaller" (So, TrustedInstaller) While this should NORMALLY BE ENOUGH, sometimes you will need to manually give yourself (and windows) permissions :D
echo (Sorry if this cause problems, we're still working on things)

pause

echo Done

timeout /t 1 /nobreak > NUL

goto Menu

:DisableWindowsApps02
echo User Disabled Windows System Processes. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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

echo Disabling TabTip.exe
takeown /f "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe"
icacls "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

echo Disabling amdow.exe
takeown /f "C:\AMD\CNext\CNext\amdow.exe"
icacls "C:\AMD\CNext\CNext\amdow.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

echo Disabling AMDRSServ.exe
takeown /f "C:\AMD\CNext\CNext\AMDRSServ.exe"
icacls "C:\AMD\CNext\CNext\AMDRSServ.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

echo Disabling EdgeGameAssist.exe
takeown /f "C:\Program Files\WindowsApps\Microsoft.Edge.GameAssist_1.0.3423.0_x64__8wekyb3d8bbwe\EdgeGameAssist.exe"
icacls "C:\Program Files\WindowsApps\Microsoft.Edge.GameAssist_1.0.3423.0_x64__8wekyb3d8bbwe\EdgeGameAssist.exe"
icacls "C:\Program Files\WindowsApps\Microsoft.Edge.GameAssist_1.0.3423.0_x64__8wekyb3d8bbwe\EdgeGameAssist.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

echo Disabling DataExchangeHost.exe
takeown /f "C:\Windows\System32\DataExchangeHost.exe"
icacls "C:\Windows\System32\DataExchangeHost.exe"
icacls "C:\Windows\System32\DataExchangeHost.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL

echo Disabling SystemSettingsBroker.exe
takeown /f "C:\Windows\System32\SystemSettingsBroker.exe"
icacls "C:\Windows\System32\SystemSettingsBroker.exe" /remove:d Everyone
icacls "C:\Windows\System32\SystemSettingsBroker.exe" /setowner "NT Service\TrustedInstaller"

echo Disabling Cross Device Resume
taskkill /f /im CrossDeviceResume.exe
takeown /f "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe"
icacls "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\CrossDeviceResume.exe" /deny Everyone:(X)

echo Disabling UserOOBEBroker.exe
taskkill /f /im UserOOBEBroker.exe
takeown /f "C:\Windows\System32\oobe\UserOOBEBroker.exe"
icacls "C:\Windows\System32\oobe\UserOOBEBroker.exe" /deny Everyone:(X)


echo All files Directories

echo HelpPane.exe : "C:\Windows\HelpPane.exe"
echo TextInputHost : "C:\Windows\SystemApps\MicrosoftWindows.Client.CBS_cw5n1h2txyewy\TextInputHost.exe"
echo mobsync.exe : "C:\Windows\System32\mobsync.exe"
echo Component Package Server : "C:\Windows\System32\CompPkgSrv.exe"
echo smartscreen.exe : "C:\Windows\System32\smartscreen.exe"
echo TabTip.exe : "C:\Program Files\Common Files\microsoft shared\ink\TabTip.exe"
echo DataExchangeHost : "C:\Windows\System32\DataExchangeHost.exe"
echo AMDSServ.exe : "C:\AMD\CNext\CNext\AMDRSServ.exe"
echo 
pause

echo Done!

goto menu

:UACManagement
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

:ManualToolsV2
echo User used Manual Tools. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
color b
cls
echo %w%════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════%y%
echo.
echo.
echo				%w%[%y% %c%%u%1%q%%t% %w%]%y% %c%Hyper-V Management%t%
echo.
echo				%w%[%y% %c%%u%2%q%%t% %w%]%y% %c%VR Optimizations%t%
echo.                                     
echo				%w%[%y% %c%%u%3%q%%t% %w%]%y% %c%Clean Temporary Files%t%
echo.                                     
echo				%w%[%y% %c%%u%4%q%%t% %w%]%y% %c%Download OptiClub's GitHub ZipPack%t%
echo.
echo				%w%[%y% %c%%u%5%q%%t% %w%]%y% %c%Restore Health (DISM)%t%
echo. 
echo				%w%[%y% %c%%u%6%q%%t% %w%]%y% %c%Tasks Management%t%
echo.
echo				%w%[%y% %c%%u%7%q%%t% %w%]%y% %c%Autologgers Management%t%
echo.
echo				%w%[%y% %c%%u%8%q%%t% %w%]%y% %c%Clear Icons Cache to fix them (example icons not showing, the file might be corrupted)%t%
echo.
echo.
echo.
echo				%w%[%y% %c%%u%A%q%%t% %w%]%y% %c%Menu%t%
echo.
echo				%w%[%y% %c%%u%B%q%%t% %w%]%y% %c%Advanced%t%
echo.

color b

set choice=
set /p choice=
if '%choice%'=='1' goto HyperVMngmntOpt
if '%choice%'=='2' goto VRROptimizationsSftStsr
if '%choice%'=='3' goto CleanTempFiles
if '%choice%'=='4' goto ZipPackDl
if '%choice%'=='5' goto MdlsfpDPf265dF
if '%choice%'=='6' goto WindowsTasksNblDbl
if '%choice%'=='7' goto Autologgersmngmnt
if '%choice%'=='8' goto IconsCacheClearing
if '%choice%'=='a' goto Menu
if '%choice%'=='A' goto Menu
if '%choice%'=='B' goto AdvancedMenuTools
if '%choice%'=='b' goto AdvancedMenuTools
color b

:HyperVMngmntOpt
color b
cls
echo Do you want to Use Enable/Disable Hyper-V (this can sometimes boost performances) ?
echo You can check it's current status with "msinfo32" or "systeminfo.exe" in cmd
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo.
echo %i%Menu = A%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnblHyperV
if '%choice%'=='2' goto DsblHyperV
if '%choice%'=='A' goto Menu
if '%choice%'=='a' goto Menu
color b

:EnblHyperV
color b
cls
echo Enabling a few services (in case you disabled some services, some are needed to use powershell)
sc config wuauserv start= Auto
sc start wuauserv
sc config LanmanWorkstation start= Auto
sc start LanmanWorkstation
sc config UsoSvc start= Auto
sc start UsoSvc
sc config WaaSMedicSvc start= Auto
sc start WaaSMedicSvc
sc config BITS start= Auto
sc start BITS
sc config DPS start= Auto
sc start DPS
sc config StorSvc start= Auto
sc start StorSvc
sc config WerSvc start= Auto
sc start WerSvc
sc config PcaSvc start= Auto
sc start PcaSvc
sc config TrustedInstaller start= Auto
sc start TrustedInstaller
sc config DoSvc start= Auto
sc start DoSvc
sc config InstallService start= Auto
sc start InstallService
sc config WdiSystemHost start= Auto
sc start WdiSystemHost
sc config DsmSvc start= Auto
sc start DsmSvc
sc config DiagTrack start= Auto
sc start DiagTrack
sc config ShellHWDetection start= Auto
sc start ShellHWDetection
sc config DusmSvc start= Auto
sc start DusmSvc
sc config TrkWks start= Auto
sc start TrkWks
sc config TrkWks start= Auto
sc start TrkWks
timeout /t 1 /nobreak > NUL
echo Enabling Hyper-V
bcdedit /set hypervisorlaunchtype auto
bcdedit /set vm yes
powershell -Command "Enable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V -All"
sc config vmicguestinterface start= demand
sc config vmicshutdown start= demand
sc config vmicvss start= demand
sc config vmicrdv start= demand
sc config vmicheartbeat start= demand
sc config vmickvpexchange start= demand
sc config vmictimesync start= demand
sc config HvHost start= demand
sc config vmcompute start= demand
sc config vmms start= demand
echo Done! Enabled Hyper-V And related services.
pause
goto Menu

:DsblHyperV
color b
cls
echo Disabling Hyper-V
bcdedit /set hypervisorlaunchtype off
bcdedit /set vm off
powershell -Command "Disable-WindowsOptionalFeature -Online -FeatureName Microsoft-Hyper-V-Hypervisor"
sc config vmicguestinterface start= disabled
sc config vmicshutdown start= disabled
sc config vmicvss start= disabled
sc config vmicrdv start= disabled
sc config vmicheartbeat start= disabled
sc config vmickvpexchange start= disabled
sc config vmictimesync start= disabled
sc config HvHost start= disabled
sc config vmcompute start= disabled
sc config vmms start= disabled
sc stop vmms
sc stop vmcompute
sc stop HvHost
sc stop vmictimesync
sc stop vmickvpexchange
sc stop vmicheartbeat
sc stop vmicrdv
sc stop vmicvss
sc stop vmicshutdown
sc stop vmicguestinterface
echo Done! Disabled Hyper-V And related services.
pause
goto Menu

:VRROptimizationsSftStsr
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

echo Downloading Meta Quest Link Optimized In-VR Desktop (No MSAA, Sharp Details, No smoothing)

md %UserProfile%\Documents\Dash\Preferences
powershell Invoke-WebRequest "https://github.com/ZaneLS/MSI_UTIL_V3/raw/refs/heads/main/dash.props" -OutFile "%UserProfile%\Documents\Dash\Preferences\dash.props"
timeout /t 1 /nobreak > NUL

echo, Async (Smooth Motion, In-VR Vsync)
echo To enable it, find "\Steam\config\steamvr.vrsettings", open it and write "motionSmoothing" : enable, To disable it, just write "disable" instead of enable.
echo To enable Async for Meta Quest Link, you need Oculus Debug tools and find "PC Asynchronous Spacewarp" you can enable/disable it from there.
echo Oculus Debug tools is in : "Oculus\Support\oculus-diagnostics\OculusDebugTool.exe"

pause

goto OculusDashINVRDisabler

:OculusDashINVRDisabler
color b
cls
echo %z%Do you want to disable Meta Quest Link IN-VR Dashboard ? (Example, to use Only SteamVR)%q%
echo.
echo %i%Disable Meta Link IN-VR Dashboard = 1%q%
echo.
echo %i%Enable Meta Link IN-VR Dashboard (Default) = 2%q%
echo.
echo %i%Skip = 3%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto MetaQuestLinkDisabler
if '%choice%'=='2' goto MetaQuestLinkEnabler
if '%choice%'=='3' goto Menu

:MetaQuestLinkDisabler
echo Disabling Meta Quest Link Dashboard. (Default Value = Deleted/0, new value "1")
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Oculus VR, LLC\Oculus\Config" /v "PreventDashLaunch" /t REG_DWORD /d "1" /f
echo Note! : SteamVR Link Forces the uses of Async, meaning the "Sync FPS" are 45/60/80/100/120/144. if everything here is too much, just don't disable it.
pause
goto Menu

:MetaQuestLinkEnabler
echo Enabling Meta Quest Link Dashboard (Default value)
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\WOW6432Node\Oculus VR, LLC\Oculus\Config" /v "PreventDashLaunch" /t REG_DWORD /d "0" /f
pause
goto Menu

:CleanTempFiles
echo User used Clean Windows Temporary Files Tool. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
color b
cls
for /F "tokens=*" %%G in ('wevtutil.exe el') do (wevtutil.exe cl "%%G")
curl --create-dirs --output-dir %temp%\EventLogCleaner.bat -O https://raw.githubusercontent.com/ZaneLS/MSI_UTIL_V3/refs/heads/main/EventLogCleaner.bat
start "" /wait "%temp%\EventLogCleaner.bat\EventLogCleaner.bat
echo Event Logs have been cleared!
pause
cls
echo Cleaning files
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Temp\*"
echo Cleaned Windows Temporary File. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
del /q  "%LocalAppData%\Temp\*"
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Prefetch\*"
echo Cleaned Windows Prefetch File. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Logs\CBS\*"
echo Cleaned Windows CBS Log File. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\Logs\DISM\*"
echo Cleaned Windows DISM Log File. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
del /q "C:\Windows\InboxApps\*"
timeout /t 1 /nobreak > NUL
echo Removing Logs (.log files)
timeout /t 1 /nobreak > NUL
del /s /f /q %systemdrive%\*.log
echo Removed All .log Files in Windows. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
echo Cleaned Windows Update LogFiles. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
echo Advanced
echo Edge Update Logs
del /q "C:\ProgramData\Microsoft\EdgeUpdate\Log\*"
echo Cleaned Edge Update Log File. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
del /q "C:\Windows\SoftwareDistribution\*"
timeout /t 1 /nobreak > NUL
cls
echo Advanced
echo Windows Health Security Logs 
del /q "C:\ProgramData\Microsoft\Windows Security Health\Logs\*"
cls
echo Removing "Recycle Bin" Files
del /s /f /q %systemdrive%\recycled\*.*
del /s /f /q %systemdrive%\$Recycle.Bin\*.*
rd /s /q C:\$Recycle.Bin
echo Cleaned Recycle Bin. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
echo Deleting Temporary WU (Windows Update) Files
del /s /f /q C:\Windows\SoftwareDistribution\Download\*.*
del /s /f /q C:\Windows\SoftwareDistribution.old\*.*
timeout /t 1 /nobreak > NUL
start explorer.exe
cls
echo DiskCleaner.
::cleanmgr.exe is a built-in Windows Cleaning Tool for your disks.
start %windir%\system32\cleanmgr.exe
::dfrgui.exe is to "Defrag HDDs"
start %windir%\system32\dfrgui.exe
echo Start dfrgui.exe and cleanmgr.exe. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

cls
echo %z%Do you want to Clear the Cache/ShaderCache of your GPU Drivers and Discord's Cache ?%q%
echo.
echo %i%Clear GPU Cache = 1%q%
echo.
echo %i%Clear Discord Cache = 2%q%
echo.
echo %i%Both = 3%q%
echo.
echo %i%Skip = 4%q%

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto ClearGPUDriversCache
if '%choice%'=='2' goto ClearDiscordAppCache
if '%choice%'=='3' goto DiscordGPUCacheClear
if '%choice%'=='4' goto Menu

:ClearGPUDriversCache
echo Cleaned GPU Driver Cache. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
del /s /f /q %LocalAppData%\AMD\VkCache\*.*
del /s /f /q %LocalAppData%\AMD\OglCache\*.*
del /s /f /q %LocalAppData%\AMD\DxcCache\*.*
del /s /f /q %LocalAppData%\AMD\DxCache\*.*
del /s /f /q %LocalAppData%\AMD\DX9Cache\*.*
del /s /f /q %LOCALAPPDATA%\NVIDIA\DXCache\*.*
del /s /f /q %LOCALAPPDATA%\NVIDIA\GLCache\*.*


goto aftercleantempfile

:ClearDiscordAppCache
echo Cleaned Discord App Cache. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
del /s /f /q %AppData%\discordcanary\Cache\Cache_Data\*.*
del /s /f /q %AppData%\discordcanary\Code Cache\js\*.*
del /s /f /q %AppData%\discordcanary\Code Cache\wasm\*.*
del /s /f /q %AppData%\discordcanary\discordcanary\GPUCache\*.*
del /s /f /q %AppData%\discord\Cache\Cache_Data\*.*
del /s /f /q %AppData%\discord\Code Cache\js\*.*
del /s /f /q %AppData%\discord\Code Cache\wasm\*.*
del /s /f /q %AppData%\discord\discordcanary\GPUCache\*.*
del /s /f /q %AppData%\discordptb\Cache\Cache_Data\*.*
del /s /f /q %AppData%\discordptb\Code Cache\js\*.*
del /s /f /q %AppData%\discordptb\Code Cache\wasm\*.*
del /s /f /q %AppData%\discordptb\discordcanary\GPUCache\*.*

goto aftercleantempfile


:DiscordGPUCacheClear
echo Cleaned Discord and GPU Driver Cache. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls

del /s /f /q %AppData%\discordcanary\Cache\Cache_Data\*.*
del /s /f /q %AppData%\discordcanary\Code Cache\js\*.*
del /s /f /q %AppData%\discordcanary\Code Cache\wasm\*.*
del /s /f /q %AppData%\discordcanary\discordcanary\GPUCache\*.*
del /s /f /q %AppData%\discord\Cache\Cache_Data\*.*
del /s /f /q %AppData%\discord\Code Cache\js\*.*
del /s /f /q %AppData%\discord\Code Cache\wasm\*.*
del /s /f /q %AppData%\discord\discordcanary\GPUCache\*.*
del /s /f /q %AppData%\discordptb\Cache\Cache_Data\*.*
del /s /f /q %AppData%\discordptb\Code Cache\js\*.*
del /s /f /q %AppData%\discordptb\Code Cache\wasm\*.*
del /s /f /q %AppData%\discordptb\discordcanary\GPUCache\*.*
del /s /f /q %LocalAppData%\AMD\VkCache\*.*
del /s /f /q %LocalAppData%\AMD\OglCache\*.*
del /s /f /q %LocalAppData%\AMD\DxcCache\*.*
del /s /f /q %LocalAppData%\AMD\DxCache\*.*
del /s /f /q %LocalAppData%\AMD\DX9Cache\*.*
del /s /f /q %LOCALAPPDATA%\NVIDIA\DXCache\*.*
del /s /f /q %LOCALAPPDATA%\NVIDIA\GLCache\*.*

goto aftercleantempfile

:aftercleantempfile
echo Finished Cleaning Temporary Files. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
cls
echo If your pc is a bit laggy after this (happens rarely) just restart it

pause
timeout /t 1 /nobreak > NUL

color b

pause
goto Menu

:ZipPackDl
cls
::Note, the Zip pack Contains paid "Video Codec" because fuck Microsoft I guess, Windows Apps Installer (in the discord), And GoInterrupt Policy to handle and Enable MSI Mode Interrupts for better Latency.
echo User Downloaded Opticlub's GitHub ZipPack. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
md %UserProfile%\Desktop\OptiClub\ZipPack
md %UserProfile%\Desktop\OptiClub\ZipPack\GoInterruptPolicy
md %UserProfile%\Desktop\OptiClub\Apps-Codecs-and-More\Apps
powershell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/ZipPack-/refs/heads/main/GoInterruptPolicy.exe" -OutFile "%UserProfile%\Desktop\OptiClub\ZipPack\GoInterruptPolicy\GoInterruptPolicy.exe"
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
echo Downloaded OptiClub's ZipPack, Small Notes : Codecs and Apps were made for Windows 10 versions. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
md %UserProfile%\Desktop\OptiClub\OOSU10\Cfg

powershell Invoke-WebRequest "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -OutFile "%UserProfile%\Desktop\OptiClub\OOSU10\OOSU10.exe"
timeout /t 3 /nobreak > NUL
powershell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/OOSU-Config/refs/heads/main/Opticlub-V6.7.cfg" -OutFile "%UserProfile%\Desktop\OptiClub\OOSU10\Cfg\Opticlub-V6.7.cfg"
set OOSUPath="%UserProfile%\Desktop\OptiClub\OOSU10\OOSU10.exe"
set ConfigPath="%UserProfile%\Desktop\OptiClub\OOSU10\Cfg\Opticlub-V6.7.cfg"

if exist %OOSUPath% (
    if exist %ConfigPath% (
        %OOSUPath% %ConfigPath%
    )
)
start %windir%\explorer.exe "%UserProfile%\Desktop\OptiClub\OOSU10\"

echo Done.
echo Downloaded OOSU10.exe because user Downloaded ZipPack. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Downloaded OptiClub's OOSU Config File by ZipPack. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

echo done
pause
goto Menu

:MdlsfpDPf265dF
cls
echo User Used Restore Health Option. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Re Enabling all Services required for DISM and Restore Operations.
powershell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/MSI_UTIL_V3/refs/heads/main/KPOFEZf.bat" -OutFile "%temp%\KPOFEZf.bat"
start "" /wait "%temp%\KPOFEZf.bat
Dism /Online /Cleanup-Image /ScanHealth
timeout /t 1 /nobreak > NUL
Dism /Online /Cleanup-Image /CheckHealth
timeout /t 1 /nobreak > NUL
DISM /Online /Cleanup-Image /RestoreHealth
timeout /t 1 /nobreak > NUL
sfc /scannow
timeout /t 1 /nobreak > NUL
chkdsk C: /f /r
timeout /t 1 /nobreak > NUL

echo done
pause
goto Menu

color b 

:WindowsTasksNblDbl
color b
cls
echo %z%Enable or Disable Tasks ?%q%
echo.
echo %i%Enable (Default) = 1%q%
echo.
echo %i%Disable = 2%q%
echo.
echo %i%Menu = 3%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableWindowsAndAppsTasks
if '%choice%'=='2' goto DisableWindowsAndAppsTasks
if '%choice%'=='3' goto Menu

:EnableWindowsAndAppsTasks
color b
cls

echo Enabling Tasks
timeout /t 1 /nobreak > NUL
echo Xbox Tasks
timeout /t 1 /nobreak > NUL
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /enable
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /enable
timeout /t 1 /nobreak > NUL
echo Done!
timeout /t 1 /nobreak > NUL
echo Other Tasks
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /enable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /enable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /enable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /enable
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /enable
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /enable
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /enable
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /enable"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /enable
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /enable
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /enable
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /enable
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /enable
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /enable
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /enable
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /enable
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /enable
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /enable
schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /enable
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /enable
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /enable
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /enable
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /enable
schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /enable
schtasks /change /tn "\Microsoft\Windows\HelloFace\FODCleanupTask" /enable
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /enable
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /enable
schtasks /change /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /enable
schtasks /change /tn "\Microsoft\Windows\Device Information\Device" /enable
schtasks /change /tn "\Microsoft\Windows\Device Information\Device User" /enable
timeout /t 1 /nobreak > NUL
echo Done!
echo Enabled Tasks. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
timeout /t 1 /nobreak > NUL
goto Menu

:DisableWindowsAndAppsTasks
color b
cls

echo Disabling Tasks
timeout /t 1 /nobreak > NUL
echo Xbox Tasks
timeout /t 1 /nobreak > NUL
schtasks /end /tn "\Microsoft\XblGameSave\XblGameSaveTask"
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTask" /disable
schtasks /end /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon"
schtasks /change /tn "\Microsoft\XblGameSave\XblGameSaveTaskLogon" /disable
timeout /t 1 /nobreak > NUL
echo Done!
timeout /t 1 /nobreak > NUL
echo Other Tasks
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Consolidator" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\BthSQM" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\KernelCeipTask" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\UsbCeip" /disable
schtasks /end /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader"
schtasks /change /tn "\Microsoft\Windows\Customer Experience Improvement Program\Uploader" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser"
schtasks /change /tn "\Microsoft\Windows\Application Experience\Microsoft Compatibility Appraiser" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater"
schtasks /change /tn "\Microsoft\Windows\Application Experience\ProgramDataUpdater" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\StartupAppTask"
schtasks /change /tn "\Microsoft\Windows\Application Experience\StartupAppTask" /disable"
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticDataCollector" /disable
schtasks /end /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver"
schtasks /change /tn "\Microsoft\Windows\DiskDiagnostic\Microsoft-Windows-DiskDiagnosticResolver" /disable
schtasks /end /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem"
schtasks /change /tn "\Microsoft\Windows\Power Efficiency Diagnostics\AnalyzeSystem" /disable
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor"
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyMonitor" /disable
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh"
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyRefresh" /disable
schtasks /end /tn "\Microsoft\Windows\Shell\FamilySafetyUpload"
schtasks /change /tn "\Microsoft\Windows\Shell\FamilySafetyUpload" /disable
schtasks /end /tn "\Microsoft\Windows\Autochk\Proxy"
schtasks /change /tn "\Microsoft\Windows\Autochk\Proxy" /disable
schtasks /end /tn "\Microsoft\Windows\Maintenance\WinSAT"
schtasks /change /tn "\Microsoft\Windows\Maintenance\WinSAT" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\AitAgent"
schtasks /change /tn "\Microsoft\Windows\Application Experience\AitAgent" /disable
schtasks /end /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting"
schtasks /change /tn "\Microsoft\Windows\Windows Error Reporting\QueueReporting" /disable
schtasks /end /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask"
schtasks /change /tn "\Microsoft\Windows\CloudExperienceHost\CreateObjectTask" /disable
schtasks /end /tn "\Microsoft\Windows\DiskFootprint\Diagnostics"
schtasks /change /tn "\Microsoft\Windows\DiskFootprint\Diagnostics" /disable
schtasks /end /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)"
schtasks /change /tn "\Microsoft\Windows\FileHistory\File History (maintenance mode)" /disable
schtasks /end /tn "\Microsoft\Windows\PI\Sqm-Tasks"
schtasks /change /tn "\Microsoft\Windows\PI\Sqm-Tasks" /disable
schtasks /end /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo"
schtasks /change /tn "\Microsoft\Windows\NetTrace\GatherNetworkInfo" /disable
schtasks /end /tn "\Microsoft\Windows\AppID\SmartScreenSpecific"
schtasks /change /tn "\Microsoft\Windows\AppID\SmartScreenSpecific" /disable
schtasks /Change /TN "\Microsoft\Windows\WindowsUpdate\Automatic App Update" /Disable
schtasks /Change /TN "\Microsoft\Windows\Time Synchronization\ForceSynchronizeTime" /Disable
schtasks /Change /TN "\Microsoft\Windows\Time Synchronization\SynchronizeTime" /Disable
schtasks /end /tn "\Microsoft\Windows\HelloFace\FODCleanupTask"
schtasks /change /tn "\Microsoft\Windows\HelloFace\FODCleanupTask" /disable
schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClient"
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClient" /disable
schtasks /end /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload"
schtasks /change /tn "\Microsoft\Windows\Feedback\Siuf\DmClientOnScenarioDownload" /disable
schtasks /end /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask"
schtasks /change /tn "\Microsoft\Windows\Application Experience\PcaPatchDbTask" /disable
schtasks /end /tn "\Microsoft\Windows\Device Information\Device"
schtasks /change /tn "\Microsoft\Windows\Device Information\Device" /disable
schtasks /end /tn "\Microsoft\Windows\Device Information\Device User"
schtasks /change /tn "\Microsoft\Windows\Device Information\Device User" /disable
echo Disabled Tasks. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Done!
timeout /t 1 /nobreak > NUL
goto Menu

:Autologgersmngmnt
color b
cls
echo Do you want to Use Enable/Disable Autologgers (this can sometimes boost performances) ?
echo.
echo %i%Enable = 1%q%
echo.
echo %i%Disable = 2%q%
echo.
echo %i%Menu = 3%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnblAutolggers
if '%choice%'=='2' goto DsblAutolggers
if '%choice%'=='3' goto Menu
color b

:EnblAutolggers
cls
echo Enabling Autologgers
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NetCore" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NtfsLog" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RadioMgr" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PlatformLicenseManagerService" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "1" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-RemoteDesktopServices-RemoteFX-SessionLicensing-Debug" /v "Start" /t REG_DWORD /d "1" /f
echo Done! Enabled Autologgers
echo Enabled Autologgers. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
pause
goto Menu
:DsblAutolggers
cls
echo Disabling Autologgers
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\UBPM" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NetCore" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\NtfsLog" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\RadioMgr" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\LwtNetLog" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\WinPhoneCritical" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Diagtrack-Listener" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\PlatformLicenseManagerService" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\Circular Kernel Context Logger" /v "Start" /t REG_DWORD /d "0" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\WMI\Autologger\EventLog-RemoteDesktopServices-RemoteFX-SessionLicensing-Debug" /v "Start" /t REG_DWORD /d "0" /f
echo Done! Disabled Autologgers
echo Disabled Autologgers. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
pause
goto Menu


:IconsCacheClearing
echo User Cleared Icons/Thumbnail Cache File. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo This can be useful if Icons don't show or "take forever to load" or if the file itself is corrupted at a deeper level >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Before using please take all permissions over the file, else you will not be able to delete the cache (this is normal and you can reverse fully)
echo if it Does not work please do it in Safe mode to rebuild the files.
pause
taskkill /f /im explorer.exe
taskkill /f /im RadeonSoftware.exe

cd /d %localappdata%\Microsoft\Windows\Explorer

del iconcache* /f /q
del thumbcache* /f /q
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\thumbcache_*.db
DEL /F /S /Q /A %LocalAppData%\Microsoft\Windows\Explorer\iconcache_*.db

del %localappdata%\Microsoft\Windows\Explorer\iconcache_16.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_32.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_48.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_96.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_128.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_256.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_768.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_1920.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\iconcache_2560.db* /f /q

del %localappdata%\Microsoft\Windows\Explorer\thumbcache_16.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_32.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_48.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_96.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_128.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_256.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_768.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_1920.db* /f /q
del %localappdata%\Microsoft\Windows\Explorer\thumbcache_2560.db* /f /q

start explorer.exe
echo Done
pause
goto Menu


:AdvancedMenuTools
cls
echo User entered Advanced Tweaks Menu. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
color b
chcp 65001 >nul
mode con: cols=155 lines=45
echo.  %b%═══════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════════
echo.  %b%		OptiClub's Advanced Tweaks Menu
echo.  %w%                             
echo.  %w%		%p%[%w%1%p%]%w% Segment Heap Manager         
echo.  %w%                             
echo.  %w%		%p%[%w%2%p%]%w% Drivers Disabler (Really Advanced)      
echo.  %w%                             
echo.  %w%		%p%[%w%3%p%]%w% DirectFlip Enable                        
echo.  %w%                           
echo.  %w%                           
echo.  %b%		%p%[%w%A%p%]%w% Basic Menu

color b

set /p input=:
color b
if /i %input% == 1 goto WindowsSegmentHeapManager
if /i %input% == 2 goto DriversDisablers
if /i %input% == 3 goto DirectFlipControl
if /i %input% == A goto Menu
if /i %input% == a goto Menu
if /i %input% == cmd start cmd.exe
if /i %input% == explorer start explorer.exe






:WindowsSegmentHeapManager
:: Note! : Windows Segment Heap is a more "Modern" Memory-Allocation Manager that started to appear in Windows 10 and is now being the default way for UWP/MSIX apps.
:: Small informations about Segment Heap :
:: It's made to lower memory fragmentations and memory allocations speed, though, some apps does not "Support" it well, if you read the lines under this, you'll understand how to disable it only for those apps while keeping it globally enabled.
:: There's no Real harm at all in doing this, at worse, apps will crash on startup because they're not made to support it, just disable it, restart and you'll be fine.
cls
echo User Used Segment Heap Manager. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo %z%Do you want to use Windows Segment Heap ?%q%
echo.
echo %i%Enable (Could be useful) = 1%q%
echo.
echo %i%Disable (Default) = 2%q%
echo.
echo %i%skip (Default) = 3%q%
echo.
echo %i%Download Apps to Manage Segment Heap = 4%q%
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto EnableWindowsSegmentHeap
if '%choice%'=='2' goto DisableWindowsSegmentHeap
if '%choice%'=='3' goto AdvancedMenuTools
if '%choice%'=='4' goto WindowsSegmentHeapAppControlDownload

:WindowsSegmentHeapAppControlDownload
cls
echo User Downloaded Powershell Apps to manage Windows Segment Heap. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo Small Note : To use those things, start them with Powershell. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
md %UserProfile%\Desktop\OptiClub\SegmentHeapManager\

PowerShell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/MSI_UTIL_V3/refs/heads/main/SegmentHeapManagerv2.6.1.ps1" -OutFile "%UserProfile%\Desktop\OptiClub\SegmentHeapManager\SegmentHeapManagerv2.6.1.ps1"
timeout /t 1 /nobreak > NUL
echo Downloading Windows Segment Heap Manager
PowerShell Invoke-WebRequest "https://raw.githubusercontent.com/ZaneLS/MSI_UTIL_V3/refs/heads/main/SegmentHeapNano.ps1" -OutFile "%UserProfile%\Desktop\OptiClub\SegmentHeapManager\SegmentHeapNano.ps1" 
echo Done!
timeout /t 2 /nobreak > NUL
goto AdvancedMenuTools


:EnableWindowsSegmentHeap
cls
echo User Enabled Windows Segment Heap. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Segment Heap" /v "Enabled" /t "REG_DWORD" /d "1" /f


echo Disabling Segment Heap for apps that doesn't support it
:: Note : "0x04" means disabled for those apps "0x08" would mean "Enabled".
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrmonitor.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrserver.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrwebhelper.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\steamvr.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrcompositor.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrdashboard.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\melonloader.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\boneworks.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f

reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\WhoCrashedEx.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\vrmonitor.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RocketLeague.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f

echo as of late january update, Roblox doesn't supports SegmentHeap anymore (crashreporter too) and will probably not, so we'll let it remain on the legacy system too.
echo kicks reasons are most usually "Unexpected Client Behavior 268", Error Code 267 (Due to anticheat and client behavior errors too) and sometimes error 17/266
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxCrashHandler.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Image File Execution Options\RobloxPlayerBeta.exe" /v "FrontEndHeapDebugOptions" /t REG_DWORD /d "0x04" /f

echo Disabled Windows Segment Heap "Per apps" for those that doesn't Support it. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

echo Done!
timeout /t 2 /nobreak > NUL
goto AdvancedMenuTools

:DisableWindowsSegmentHeap
cls
echo User Disabled Windows Segment Heap. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Segment Heap" /v "Enabled" /t "REG_DWORD" /d "0" /f

echo Done!
timeout /t 2 /nobreak > NUL
goto AdvancedMenuTools

:DriversDisablers
:: This can break other drivers functionnality and System Stability or Audio, keyboard and mouse, xbox controller emulation for AMD too.
:: This here can be Helpful to reduce DPC latency for some Drivers (Example : HDAudBus, AMDXE, AMDSAFD, MEIx64. BUT, they can break other drivers.
:: Let's say you disable HDAudBus and AtiHDAudioService, HdAudAddService too, this will probably reduce a small bit of latency at best, but can break audio and other drivers related to that.
:: Be really careful, you can use the tool to revert.

cls
echo User used Drivers Disabled Choice. Please, Really read the tool here. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
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
cls
echo User Disabled Drivers. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

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
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileCrypt" /v "Start" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL
echo disabling 1394ohci (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\1394ohci" /v "Start" /t REG_DWORD /d 3 /f
timeout /t 1 /nobreak > NUL
echo disabling i8042prt (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt" /v "Start" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
echo disabling AMDRSServ.exe (Default value "2")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDRSServ.exe" /v "Start" /t REG_DWORD /d 4 /f
echo Disabling AMDRSServ.exe
takeown /f "C:\AMD\CNext\CNext\AMDRSServ.exe"
icacls "C:\AMD\CNext\CNext\AMDRSServ.exe" /deny Everyone:(X)
timeout /t 1 /nobreak > NUL
echo disabling HDAudBus (This may cause problem (Default value "3" for both regedit keys.) (this will disable audio through screen/hdmi)
echo (might well help with latency, DPC/ISR and overall.)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HDAudBus" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HdAudAddService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AtiHDAudioService" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AtiHDAudioService" /v "RadeonSoftwareSlimmerOriginalStart" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDSAFD" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDSAFD" /v "RadeonSoftwareSlimmerOriginalStart" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
echo disabling AMDXE (Controller Emulation Driver) (This may cause problem (Default value "3" for both regedit keys.)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDXE" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDXE" /v "RadeonSoftwareSlimmerOriginalStart" /t REG_DWORD /d 4 /f
echo Disabling INTEL ME Engine via regedit (This doesn't really disable it at all, but this "Sometimes" helps with latency or small weird spikes. Default value = 3)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MEIx64" /v "Start" /t REG_DWORD /d 4 /f

reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TroubleshootingSvc" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\terminpt" /v "Start" /t REG_DWORD /d 4 /f
timeout /t 1 /nobreak > NUL
goto bthdrivermanualcontrol
:bthdrivermanualcontrol
cls
echo %z%Do you want to disable bluetooth drivers ?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
echo.
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto DisableBluetoothDrivers
if '%choice%'=='2' goto AdvancedMenuTools

:DisableBluetoothDrivers
cls
echo Disabling BTH drivers
echo (default values : 3)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d 4 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d 4 /f
echo Done! 
timeout /t 3 /nobreak > NUL
Goto AdvancedMenuTools

:RevertDrivers
cls
echo User Re-Enabled Drivers. >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt

echo Enablingg NDU (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\ControlSet001\Services\Ndu" /v "Start" /t REG_DWORD /d 3 /f
timeout /t 1 /nobreak > NUL
echo Enabling flpydisk (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\flpydisk" /v "Start" /t REG_DWORD /d 3 /f
timeout /t 1 /nobreak > NUL
echo Enabling FileCrypt (Default value "1")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FileCrypt" /v "Start" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL
echo Enabling fdc (Default value "1")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\fdc" /v "Start" /t REG_DWORD /d 1 /f
timeout /t 1 /nobreak > NUL
echo Enabling 1394ohci (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\1394ohci" /v "Start" /t REG_DWORD /d 3 /f
timeout /t 1 /nobreak > NUL
echo Enabling i8042prt (Default value "3")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\i8042prt" /v "Start" /t REG_DWORD /d 3 /f
timeout /t 1 /nobreak > NUL
echo Enabling AMDRSServ.exe (Default value "2")
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDRSServ.exe" /v "Start" /t REG_DWORD /d 2 /f
timeout /t 1 /nobreak > NUL
echo Enabling HDAudBus ((Default value "3" for both regedit keys.)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HDAudBus" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HdAudAddService" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AtiHDAudioService" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AtiHDAudioService" /v "RadeonSoftwareSlimmerOriginalStart" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDSAFD" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDSAFD" /v "RadeonSoftwareSlimmerOriginalStart" /t REG_DWORD /d 3 /f
timeout /t 1 /nobreak > NUL
echo Enabling AMDXE (Controller Emulation Driver) (Default value "3" for both regedit keys.)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDXE" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\AMDXE" /v "RadeonSoftwareSlimmerOriginalStart" /t REG_DWORD /d 3 /f
echo Enabling INTEL ME Engine via regedit (Default value = 3)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\MEIx64" /v "Start" /t REG_DWORD /d 3 /f
timeout /t 1 /nobreak > NUL
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TroubleshootingSvc" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\XblGameSave" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\terminpt" /v "Start" /t REG_DWORD /d 3 /f
cls
echo %z%Do you want to Restore Bluetooth Drivers ?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%No = 2%q%
echo.
color b
set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto RestoreBluetoothDriversdvsxcr
if '%choice%'=='2' goto AdvancedMenuTools

:RestoreBluetoothDriversdvsxcr
cls
echo Enabling BTH drivers
echo (default values : 3)
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthA2dp" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthEnum" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthHFEnum" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthLEEnum" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthMini" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHMODEM" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BTHPORT" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidBth" /v "Start" /t REG_DWORD /d 3 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BthAvctpSvc" /v "Start" /t REG_DWORD /d 3 /f
echo Done! 
timeout /t 3 /nobreak > NUL
Goto AdvancedMenuTools

echo Done! 
timeout /t 3 /nobreak > NUL
Goto AdvancedMenuTools


:DirectFlipControl
cls
echo User used Direct Flip Control >> %UserProfile%\Desktop\OptiClub\LogFile\Logs\OptiClub-V7-Logs.txt
echo %z%Would you like to Force Enable/Revert DirectFlip ?%q%
echo.
echo %i%Yes = 1%q%
echo.
echo %i%Revert/No = 2%q%
echo.

color b

set choice=
set /p choice=
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto ForceEnableDRCTFLPCTRL
if '%choice%'=='2' goto RevertDRCTFLPCTRL
color b

:ForceEnableDRCTFLPCTRL
cls
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableDecodeMPO" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMultiPlaneOverlay3DDIs" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableWDDM23Synchronization" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryMPOsupport" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryFlipSupport" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DriverManagesResidencyOverride" /t REG_DWORD /d 1 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableFlipModelEx" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverlays" /t REG_DWORD /d 0 /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /t REG_DWORD /d 1 /f
echo Done!
timeout /t 5 /nobreak > NUL
goto AdvancedMenuTools
:RevertDRCTFLPCTRL
cls
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceDirectFlip" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableDecodeMPO" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableMultiPlaneOverlay3DDIs" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "EnableWDDM23Synchronization" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryMPOsupport" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "ForceSecondaryFlipSupport" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DriverManagesResidencyOverride" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableFlipModelEx" /f
reg delete "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DpiMapIommuContiguous" /f
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\GraphicsDrivers" /v "DisableOverlays" /t REG_DWORD /d 0 /f
echo Done!
timeout /t 5 /nobreak > NUL
goto AdvancedMenuTools

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

:ChristitusDebloatScriptnew
color b

cls

powershell -Command "irm https://christitus.com/win | iex"

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:BasicW10SCRIPTnew
color b

cls

powershell -Command "iwr -useb https://git.io/debloat|iex"

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

:RunOOSUnew
color b
cls
powershell Invoke-WebRequest "https://dl5.oo-software.com/files/ooshutup10/OOSU10.exe" -OutFile "%temp%\OOSU10.exe"
start "" /wait "%temp%\OOSU10.exe

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu

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
goto Menu

:win10activatornew
color b
cls

powershell -Command "irm https://get.activated.win | iex"

color b

echo Done.
timeout /t 5 /nobreak > NUL
goto Menu