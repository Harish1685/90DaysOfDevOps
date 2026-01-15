# Week 3 – Challenge 1: Linux User Management Script
## Overview

In this challenge, we will build a Bash script that helps manage user accounts on a Linux system. The goal is to automate common administrative tasks such as creating users, deleting users, resetting passwords, and viewing user information using simple command-line options.
This script is intended to be beginner-friendly while still covering real-world system administration tasks.

## Core Features
### 1. Create a User Account

The script should allow an administrator to create a new user by:

- Asking for a username
- Checking whether the username already exists
- Prompting for a password
- Creating the user along with a home directory
- Displaying a success message after creation

Command:
```bash
./user_management.sh -c
```

---

## 2. Delete a User Account

The script should support removing an existing user:

- Prompt for the username to delete
- Verify that the user exists
- Ask whether the home directory should also be removed
- Confirm successful deletion

Command:
```bash
./user_management.sh -d
```

---

## 3. Reset User Password

The script should allow password resets:

- Ask for the username
- Ensure the user exists
- Prompt for a new password
- Confirm the password update

Command:
```bash
./user_management.sh -r
```

---

## 4. List User Accounts

The script should display a list of normal user accounts:

- Show usernames along with their UIDs
- Output should be clean and readable

Command:
```bash
./user_management.sh -l
```

---


## Additional Features (Bonus)
## 5. View User Details

Display detailed information for a specific user, such as:

- Username
- UID and GID
- Home directory
- Default shell

Command:
```bash
./user_management.sh -i
```

--- 


## 6. Change Username

Rename an existing user and optionally update their home directory.

### Command:
```bash
./user_management.sh -n
```

---


## 7. Change User UID

Update the UID of an existing user, ensuring no conflicts.

### Command:
```bash
./user_management.sh -u
```

--- 


## 8. Change Default Shell

Modify a user’s login shell, restricted to valid shells listed in /etc/shells.

### Command:
```bash
./user_management.sh -s
```

--- 


## Help Option

The script must include a help menu explaining all available options.

### Command:
```bash
./user_management.sh -h
```

---


## Sample Help Output
```text
User Management Script

Options:
  -c, --create      Create a new user
  -d, --delete      Delete a user
  -r, --reset       Reset user password
  -l, --list        List users
  -i, --info        Show user details
  -n, --rename      Change username
  -u, --uid         Change user UID
  -s, --shell       Change user shell
  -h, --help        Display help
```

---


## Error Handling Requirements

The script should handle common error cases, including:

- Ensuring the script is run as root
- Preventing duplicate user creation
- Handling non-existent users gracefully
- Allowing only valid shells for shell changes

---


## Summary

This challenge focuses on writing a practical Bash script for managing Linux users. It covers both essential and optional features while emphasizing clarity, input validation, and safe system operations. Completing this task helps build a solid foundation in Linux administration and scripting.
