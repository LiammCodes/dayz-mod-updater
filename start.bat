@echo off
cls

set watch=DayZ Server

title %watch% Watchdog

cd "C:\Program Files (x86)\Steam\steamapps\common\DayZServer"

:watchdog
echo (%time%) %watch% started.
start "DayZ Server" /wait "DayZServer_x64.exe" -adminlog -netlog -freezecheck -showScriptErrors "-mod=@Better DayZ;@CF;@CheckIdentity;@CheckPulse;@Cl0ud's Military Gear;@Community-Online-Tools;@DayZ-Expansion;@DayZ-Expansion-Licensed;@Ear-Plugs;@KillFeed;@MuchStuffPack;@SchanaModCompass;@Trolley Kart;@Unlimited Stamina;@VanillaPlusPlusMap;@VPPAdminTools;@VPPNotifications;" VerifySignatures=3; -profiles=ServerProfiles -config=serverDZ.cfg -port=2302 -dologs
echo (%time%) %watch% closed or crashed, restarting.
goto watchdog
-profiles=C:\Steam\steamapps\common\DayZServer\log -scrAllowFileWrite -dologs -adminlog