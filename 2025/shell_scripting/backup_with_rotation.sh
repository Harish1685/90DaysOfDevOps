#!/bin/bash

# =========================================================== #
# Description:
#   Simple Backup Script with Rotation
#   Creates backups and keeps only last 3 versions
# =========================================================== #


# Check argument count
if [ $# -ne 1 ]; then
    echo "Usage: $0 <target-directory>"
    exit 1
fi


# Variables (UNCHANGED)
target_dir="$1"
backup_prefix="backup"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_dir="$target_dir/${backup_prefix}_$timestamp"


# Check if target directory exists
if [ ! -d "$target_dir" ]; then
    echo "Error: Target directory does not exist"
    exit 1
fi


# Create backup directory
mkdir "$backup_dir"
if [ $? -ne 0 ]; then
    echo "Error: Failed to create backup directory"
    exit 1
fi


# Copy files except old backups
for item in "$target_dir"/*; do
    case "$item" in
        "$target_dir"/${backup_prefix}_*) ;;
        *) cp -r "$item" "$backup_dir" ;;
    esac
done

echo "Backup created: $backup_dir"


# ---------------- Backup Rotation ----------------

# Get list of backups
backups=$(ls -d "$target_dir"/${backup_prefix}_* 2>/dev/null | sort)
backup_count=$(echo "$backups" | wc -l)

# Remove old backups if more than 3 exist
if [ "$backup_count" -gt 3 ]; then
    remove_count=$((backup_count - 3))
    echo "Removing $remove_count old backup(s)"

    echo "$backups" | head -n "$remove_count" | while read old_backup
    do
        rm -rf "$old_backup"
        echo "Deleted: $old_backup"
    done
fi


echo
echo "Current backups:"
ls -d "$target_dir"/${backup_prefix}_* 2>/dev/null
