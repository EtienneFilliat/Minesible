#!/bin/bash
####################################
#
# Backup to NFS mount script.
#
####################################

# Pre backup scipt
systemctl stop minecraft@Minesible.service || true

# Termination ther seaver takes time, sleeping a bit (20s)
sleep 20

# What to backup. 
backup_files="/opt/minecraft/Minesible/"

# Where to backup to.
dest="/Glish/Nas/Minesible-Backup"

# Create archive filename.
day=$(date +"%m-%d-%y")
hostname=$(hostname -s)
archive_file="$hostname-$day.zip"

# Print start status message.
echo "Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using zip.
cd $backup_files
zip -r -q $dest/$archive_file .
cd -

# Print end status message.
echo
echo "Backup finished"
date

find "$dest/$archive_file" -type f -mtime +3 -delete

# Long listing of files in $dest to check file sizes.
ls -lh $dest

systemctl start minecraft@Minesible.service