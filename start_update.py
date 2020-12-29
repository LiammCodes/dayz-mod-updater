# DayZ Server Mod Updater
# Created by Lee
# September 13, 2020

import os
import sys
import glob
import subprocess
import distutils.log
import distutils.dir_util
import distutils.core
import shutil

# CHANGE TO YOUR OWN 
# (make sure there are two backslashes at the end of path as shown below)
dayz_game_path = "G:\SteamLibrary\steamapps\common\DayZ\\"
dayz_server_path = "C:\Program Files (x86)\Steam\steamapps\common\DayZServer\\"
bat_filename = "run.bat"

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
#for mod in glob.glob(os.path.join(dayz_server_path, "@*")):
#    distutils.dir_util.remove_tree(mod)

# copy files from !Workshop to server location
print("Copying mods to server...")
mods = sys.argv[1].split(";")

workshop = os.path.join(dayz_game_path, "!Workshop")
src_folders = os.listdir(workshop)

for folder_name in src_folders:
    if folder_name in mods:
        full_src_folder_name = os.path.join(workshop, folder_name)
        full_dst_folder_name = os.path.join(dayz_server_path, folder_name)
        #if os.stat(full_src_folder_name).st_mtime - os.stat(full_dst_folder_name).st_mtime > 1:
        distutils.log.set_verbosity(distutils.log.DEBUG)
        distutils.dir_util.copy_tree(full_src_folder_name, full_dst_folder_name,update=1,verbose=1)
        print("Updated: "+folder_name)
        
# distutils.dir_util.copy_tree(os.path.join(dayz_game_path, "!Workshop"), dayz_server_path)

print("Complete")

# start server
print("Starting server...")
quit()


