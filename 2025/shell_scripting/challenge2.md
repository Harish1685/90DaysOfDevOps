# Week 3 Challenge 2: Simple Backup Script with Rotation
## Overview

In this challenge, you will write a Bash script that creates backups of a given directory.
Each backup is saved in a timestamped folder, and the script keeps only the latest 3 backups, deleting older ones automatically.

## Script Walkthrough
## 1. Bash Interpreter
```bash
#!/bin/bash
```
Specifies that the script runs using Bash.

---

## 2. Argument Check
```bash
if [ $# -ne 1 ]; then
    echo "Usage: $0 <target-directory>"
    exit 1
fi
```
- Ensures a directory path is provided
- Exits if the argument is missing

---

## 3. Variables
```bash
target_dir="$1"
backup_prefix="backup"
timestamp=$(date +%Y-%m-%d_%H-%M-%S)
backup_dir="$target_dir/${backup_prefix}_$timestamp"
```
- Defines the directory to back up
- Creates a unique backup name using a timestamp

---


## 4. Validate Directory
```bash
if [ ! -d "$target_dir" ]; then
    echo "Error: Target directory does not exist"
    exit 1
fi
```
- Stops the script if the directory is invalid

---


## 5. Create Backup Directory
```bash
mkdir "$backup_dir"
```
- Creates a new folder for the backup

---


## 6. Copy Files (Skip Old Backups)
```bash
for item in "$target_dir"/*; do
    case "$item" in
        "$target_dir"/${backup_prefix}_*) ;;
        *) cp -r "$item" "$backup_dir" ;;
    esac
done
```
- Copies all files and folders
- Skips existing backup directories

--- 

## 7. Rotate Backups (Keep Last 3)
```bash
backups=$(ls -d "$target_dir"/${backup_prefix}_* 2>/dev/null | sort)
backup_count=$(echo "$backups" | wc -l)

if [ "$backup_count" -gt 3 ]; then
    remove_count=$((backup_count - 3))
    echo "$backups" | head -n "$remove_count" | while read old_backup
    do
        rm -rf "$old_backup"
    done
fi
```
- Counts existing backups
- Deletes the oldest ones if more than 3 exist

---

## 8. Show Remaining Backups
```bash
ls -d "$target_dir"/${backup_prefix}_*
```

---

## Example Usage
```bash
./backup_with_rotation.sh /home/user/documents
```

---
## Automating with Cron 
## Why Use Cron?

Cron allows the backup script to run automatically at fixed times without manual effort.

## Schedule the Script

## Open the crontab editor:
```bash
crontab -e
```
2 .Add the following line to run the backup daily at midnight:
```bash
0 0 * * * /path/to/backup_with_rotation.sh /home/user/documents
```
## Cron Entry Explanation

- 0 0 * * * → Runs every day at 12:00 AM
- /path/to/backup_with_rotation.sh → Full path to the script
- /home/user/documents → Directory to back up

### (Optional logging)
```bash
0 0 * * * /path/to/backup_with_rotation.sh /home/user/documents >> backup.log 2>&1
```

---

## Conclusion

This challenge combines basic Bash scripting with simple task automation using cron.
It demonstrates how routine system tasks like backups can be automated efficiently while keeping the script easy to understand.
