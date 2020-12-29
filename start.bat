@echo off
:start
::Name for CMD window
set serverName=CZ Welcome to Chernarus
::Server files location
set serverLocation="C:\Program Files (x86)\Steam\steamapps\common\DayZServer"
::Server Port
set serverPort=2302
::Server config
set serverConfig=serverDZ.cfg
::Server profile folder
set serverProfile=profile
::Logical CPU cores to use (Equal or less than available)
set serverCPU=8
::----
set mods="@Server_Information_Panel;@Community-Online-Tools;@CF;@Airdrop-Upgraded;@ArmA 2 ACR Weapon Pack;@Arma 2 Clothing Pack;@8x8 Wasteland Camper (Working-Testing WIP);@Banking;@Bed-Respawning;@Cabin_Mod_RaGed;@CannabisPlus;@CarCover;@CarHorn;@CJ187-Cars;@Code Lock;@ZomBerry Admin Tools;@Zeroy-FishingZ;@WornRepair;@WindstridesClothingPack;@WeaponReduxPack;@VanillaPlusPlusMap;@Trader;@TraderFixesAndFeatures;@Trader Wallet;@LayoutTrader;@SkinCraft;@SIX-DayZ-Auto-Run;@SchanaModGlobalChat;@RevGuns;@No-Vehicle-Damage;@MuchStuffPack;@MuchCarKey;@ChickenDropFeathers;@GoreZ;@GarbageSearch;@Garage;@FarmingPlus+;@Ear-Plugs;@DayZOresAndGems;@ShakeForFruit;@Jeep Wnagler;@ToxicZone;@VeeDub Lt"
::Sets title for terminal (DONT edit)
title %serverName% batch
::--Update Mods
python3 "C:\Program Files (x86)\Steam\steamapps\common\DayZServer\start_update.py" %mods%
pause
::DayZServer location (DONT edit)
cd "%serverLocation%"
echo (%time%) %serverName% started.
::Launch parameters (edit end: -config=|-port=|-profiles=|-doLogs|-adminLog|-netLog|-freezeCheck|-filePatching|-BEpath=|-cpuCount=)
start "DayZ Server" /min "DayZServer_x64.exe" -config=%serverConfig% "-mod="%mods% -port=%serverPort% -profiles=%serverProfile% -cpuCount=%serverCPU% -dologs -adminlog -netlog -freezecheck
::Time in seconds before kill server process (14400 = 4 hours)
timeout 14390
taskkill /im DayZServer_x64.exe /F
::Time in seconds to wait before..
timeout 10
::Go back to the top and repeat the whole cycle again
goto start
