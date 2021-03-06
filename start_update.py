# DayZ Server Mod Updater
# Created by Lee
# September 13, 2020

import os
import glob
import subprocess
import distutils.core

# CHANGE TO YOUR OWN 
# (make sure there are two backslashes at the end of path as shown below)
dayz_game_path = "C:\Program Files (x86)\Steam\steamapps\common\DayZ\\"
dayz_server_path = "C:\Program Files (x86)\Steam\Steamapps\common\DayZServer\\"
bat_filename = "start_mod_server.bat"

# opens program
def open_program(path):
    return subprocess.Popen(path)

# closes program
def close_program(p):
    p.terminate()

# start DayZ to Update Mods
print("Updating mods...")
dayz = open_program(os.path.join(dayz_game_path, "DayZLauncher.exe"))
input("Hit any key once mods complete...")

# close DayZ
close_program(dayz)

# remove old mods from server
for mod in glob.glob(os.path.join(dayz_server_path, "@*")):
    distutils.dir_util.remove_tree(mod)

# copy files from !Workshop to server location
print("Copying mods to server...")
distutils.dir_util.copy_tree(os.path.join(dayz_game_path, "!Workshop"), dayz_server_path)

# cleanup
os.rmdir(dayz_server_path + "!DO_NOT_CHANGE_FILES_IN_THESE_FOLDERS")
print("Complete")

# start server
print("Starting server...")
subprocess.call([bat_filename])
quit()


