# Task 1: User & Group Management

## Objective
- Create a user `devops_user` and a group `devops_team`.
- Add the user to the group and set a password.
- Provide sudo access.
- Restrict SSH login for specific users.

---

## 1. Create a User and Group

### 1.1 Create the user
```bash
sudo adduser devops_user
```
Creates the user, sets up a home directory, and prompts for a password.

## Alternative:
```bash
sudo useradd -m devops_user
```
### 1.2 Create the group
```bash
sudo groupadd devops_team
```
### 1.3 Add the user to the group
```bash
sudo usermod -aG devops_team devops_user
```
## Alternative:
```bash
sudo gpasswd -a devops_user devops_team
```
### 1.4 Verify the setup
```bash
id devops_user
```
```bash
groups devops_user
```

---

### 2. Password and Sudo Access
### 2.1 Set or update password
```bash
sudo passwd devops_user
```
### 2.2 Grant sudo access
```bash
sudo usermod -aG sudo devops_user
```
## Verify:
```bash
su - devops_user
sudo whoami
```
Expected:
```nginx
root
```
## 2.3 (Optional) Give sudo access to the entire group
```bash
sudo visudo
```
Add:
```sql
%devops_team ALL=(ALL:ALL) ALL
```
---

## 3. Restrict SSH Login
## 3.1 Edit SSH configuration
```bash
sudo nano /etc/ssh/sshd_config
```
## 3.2 Allow or deny users

Allow specific users:
```nginx
AllowUsers devops_user
```
Allow multiple:
```nginx
AllowUsers devops_user user2 user3
```
Deny users:
```nginx
DenyUsers test1 test2
```
## 3.3 Restart SSH service
```bash
sudo systemctl restart sshd
```
## 4. Test SSH
Find IP address
```bash
ip a
```
Test SSH login
```bash
ssh devops_user@<server_ip>
```
---

# Final Results

## User and Group Creation
- User **devops_user** created
- Group **devops_team** created
- **devops_user** added to **devops_team**

## Password and Sudo Access
- Password set for **devops_user**
- **devops_user** granted sudo access

## SSH Restriction
- SSH access restricted to **devops_user** (or selected users)
- SSH service restarted and verified

