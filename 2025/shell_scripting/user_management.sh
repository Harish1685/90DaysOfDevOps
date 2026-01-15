#!/bin/bash

# ---------------- Root Check ----------------
if [ "$(id -u)" -ne 0 ]; then
    echo "Please run this script as root"
    exit 1
fi


# ---------------- Create User ----------------
create_user() {
    read -p "Enter username: " username

    if id "$username" &>/dev/null; then
        echo "User already exists"
        return 1
    fi

    read -s -p "Enter password: " password
    echo

    useradd -m "$username"
    echo "$username:$password" | chpasswd

    echo "User '$username' created successfully"
}


# ---------------- Delete User ----------------
delete_user() {
    read -p "Enter username to delete: " username

    if ! id "$username" &>/dev/null; then
        echo "User does not exist"
        return 1
    fi

    read -p "Delete home directory? [Y/n]: " choice

    if [[ -z "$choice" || "$choice" =~ ^[Yy]$ ]]; then
        userdel -r "$username"
        echo "User and home directory deleted"
    else
        userdel "$username"
        echo "User deleted (home directory kept)"
    fi
}


# ---------------- Reset Password ----------------
reset_password() {
    read -p "Enter username: " username

    if ! id "$username" &>/dev/null; then
        echo "User does not exist"
        return 1
    fi

    read -s -p "Enter new password: " password
    echo

    echo "$username:$password" | chpasswd
    echo "Password updated"
}


# ---------------- List Users ----------------
list_users() {
    echo -e "UID\tUsername"
    echo "----------------"
    awk -F: '$3 >= 1000 { print $3 "\t" $1 }' /etc/passwd
}


# ---------------- User Info ----------------
user_info() {
    read -p "Enter username: " username

    if ! id "$username" &>/dev/null; then
        echo "User does not exist"
        return 1
    fi

    awk -F: -v user="$username" '$1 == user {
        print "Username:", $1
        print "UID:", $3
        print "Home:", $6
        print "Shell:", $7
    }' /etc/passwd

    echo "Groups: $(groups "$username")"
}


# ---------------- Help ----------------
show_help() {
    echo
    echo "User Management Script"
    echo "Usage: $0 [OPTION]"
    echo
    echo "Options:"
    echo "  -c, --create     Create a user"
    echo "  -d, --delete     Delete a user"
    echo "  -r, --reset      Reset user password"
    echo "  -l, --list       List users"
    echo "  -i, --info       Show user details"
    echo "  -h, --help       Show help"
    echo
}


# ---------------- Main ----------------
case "$1" in
    -c|--create) create_user ;;
    -d|--delete) delete_user ;;
    -r|--reset) reset_password ;;
    -l|--list) list_users ;;
    -i|--info) user_info ;;
    -h|--help) show_help ;;
    *) echo "Invalid option. Use -h for help" ;;
esac

exit 0
