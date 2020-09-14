# dayz-mod-updater

How it works: 
The script first starts DayZ (the game itself) which opens the DayZ Launcher. Opening the DayZ launcher will automatically check for Workshop Mod updates. If there is an update, let it complete (you will be able to see status at the bottom of the launcher).
Once the updates are complete, you can go back to wherever the script is running (I suggest using PowerShell and you'll be prompted to press any key to continue, then the script will copy all the Workshop folders (mods) from your DayZ game directory, to your server directory, replacing the mods with the same name that were there before. The script will then start your server.

Requirements:
- DayZ (the game) installed on your server computer (I recommend having a seporate Steam account with a copy of DayZ to run the Server and Game for this script)
- DayZ Server installed on your server computer
- Python 3
- Working start.bat file
- A text editor to modify the script, to change the directories to your own (I use VS Code but you can use whatever you want)

Instructions:
- Download the script "start_update.py" and place it in your main DayZ server directory (where your start.bat file is located)
- Open start_update.py in the text editor of your choice, and change the variables dayz_game_path, dayz_server_path, and bat_filename to the appropriate paths on your system, and save the script.
- You're done! To run the update, open PowerShell, and navigate to your DayZ Server directory: cd <dayz_server_path> and then run the script: python3 start_update.py
