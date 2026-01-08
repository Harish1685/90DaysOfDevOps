# Task 4 – Volume Management & Disk Usage

## Objective
Simulate a storage volume using a loop device, mount it to a directory, and verify disk usage.

Tasks:
- Create a mount directory
- Create and format a loop-backed storage file
- Mount the volume
- Verify using `df` and `mount`

---

## Step 1: Create Mount Directory

```bash
sudo mkdir -p /mnt/devops_data
```
## Step 2: Create a Loop Device (Simulated Disk)
### 2.1 Create a 1GB Storage File
```bash
sudo dd if=/dev/zero of=/storagefile bs=1M count=1024
```
This creates a 1GB file that will act as a virtual disk.
## 2.2 Format the File with ext4
```bash
sudo mkfs.ext4 /storagefile
```
The file is now formatted and ready to be mounted.
### 2.3 Mount the Loop Device
```bash
sudo mount -o loop /storagefile /mnt/devops_data
```
## Step 3: Verify the Mount
### Check disk usage
```bash
df -h | grep devops_data
```
Sample output:
```bash
/dev/loop0  974M  24K  907M  1%  /mnt/devops_data
```
### Check active mounts
```bash
mount | grep devops_data
```
Sample output:
```bash
/storagefile on /mnt/devops_data type ext4 (rw,relatime)
```
## Optional: Persist the Mount After Reboot
```bash
echo '/storagefile /mnt/devops_data ext4 loop 0 0' | sudo tee -a /etc/fstab
```
