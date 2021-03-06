#!/bin/sh
####################################
#
# Backup to NFS mount script.
#
####################################

# Where to backup to.
dest="/Volumes/Public/Backups"

# Create archive filename.
day=$(date +%A)
hostname=$(hostname -s)
archive_file="$hostname-$day.tgz"

# Print start status message.
echo "1)Backing up $backup_files to $dest/$archive_file"
date
echo

# Backup the files using tar.
tar czf $dest/$archive_file ~/Documents /Applications/MAMP/htdocs

# Long listing of files in $dest to check file sizes.
ls -lh $dest

#log to nidus-log service
curl -X POST -d "code=Backup&descr=$archive_file&value=From%20Backup%20Script" http://192.168.1.124:8001

# Print end status message.
echo
echo "Backup finished"
date
