# Task 6 – Automate Backups with Shell Scripting

## Objective
Create a shell script to:
- Back up `/devops_workspace` as a timestamped `.tar.gz` file
- Store backups in `/backups`
- Display success messages in green
- Schedule the backup using `cron`

---

## Backup Script

```bash
#!/bin/bash

# Source and destination paths
SRC_DIR="$1"
DEST_DIR="$2"

# Create destination directory if missing
mkdir -p "$DEST_DIR"

# Backup file name with timestamp
DATE=$(date +"%F-%H-%M")
BACKUP_FILE="backup_${DATE}.tar.gz"

# Start backup
echo -e "\e[32mStarting backup...\e[0m"
tar -czf "${DEST_DIR}/${BACKUP_FILE}" "$SRC_DIR" 2>/dev/null

# Verify backup status
if [ $? -eq 0 ]; then
  echo -e "\e[32mBackup completed successfully!\e[0m"
  echo -e "\e[32mSaved at: ${DEST_DIR}/${BACKUP_FILE}\e[0m"
else
  echo -e "\e[31mBackup failed. Check paths and permissions.\e[0m"
  exit 1
fi
```
## Step 1: Create the Script
```bash
mkdir -p ~/scripts
vim ~/scripts/backup_devops.sh
```
Paste the script and save.

Make it executable:
```bash
chmod 700 ~/scripts/backup_devops.sh
```
## Step 2: Test the Script
```bash
./backup_devops.sh /home/soumo/devops_workspace /home/soumo/backups
```

Expected output (green text):
```text
Starting backup...
Backup completed successfully!
Saved at: /home/soumo/backups/backup_YYYY-MM-DD-HH-MM.tar.gz
```
## Step 3: Schedule with Cron
Edit crontab:
```bash
crontab -e
```

Run daily at midnight:
```bash
0 0 * * * /home/soumo/scripts/backup_devops.sh /home/soumo/devops_workspace /home/soumo/backups
```

(For testing every minute)
```bash
* * * * * /home/soumo/scripts/backup_devops.sh /home/soumo/devops_workspace /home/soumo/backups
```
### Verification
Check backups:
```bash
ls -lh /home/soumo/backups
```
Check cron logs:
```bash
grep backup_devops /var/log/syslog
```
### Notes
- tar -czf creates a compressed archive
- \e[32m → green text, \e[31m → red text
- $? checks the success of the last command

## Result
- Automated backup script created
- Backups stored with timestamps
- Cron job successfully scheduled
