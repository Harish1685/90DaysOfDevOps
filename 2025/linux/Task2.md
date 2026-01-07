# Task 2 – File and Directory Permissions (Linux)

## Objective
Create a directory and file, then configure permissions so:
- Owner has read and write access
- Group has read-only access
- Others have no access

---

## Step 1: Create Directory and File

```bash
cd ~
mkdir devops_workspace
touch devops_workspace/project_notes.txt
```
Add content:

```bash
echo "Linux permissions task" > devops_workspace/project_notes.txt
```
---

## Step 2: Set Group Ownership
```bash
chgrp devops_team devops_workspace/project_notes.txt
```
## Step 3: Set File Permissions
- Owner: read + write (6)
- Group: read (4)
- Others: no access (0)
  
```bash
chmod 640 devops_workspace/project_notes.txt
```
Verify:
```bash
ls -l devops_workspace/project_notes.txt
```
Expected output:
```bash
-rw-r----- 1 devops_user devops_team project_notes.txt
```
---

## Step 4: Set Directory Permissions
```bash
chgrp devops_team devops_workspace
chmod 750 devops_workspace
```
Verify:
```bash
ls -ld devops_workspace
```
Expected output:
```bash
drwxr-x--- 2 devops_user devops_team devops_workspace
```
---

## Result
- Owner can read and write
- Group can read
- Others have no access
- Permissions are applied successfully.



