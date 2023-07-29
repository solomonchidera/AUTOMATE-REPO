#!/bin/bash

# Check if gpg is installed
if ! command -v gpg &> /dev/null; then
    echo "Error: gpg not found. Please install GnuPG (gpg) to use this password manager."
    exit 1
fi

PASSWORD_FILE="$HOME/.passwords"

function encrypt_password {
    echo "$2" | gpg --symmetric --cipher-algo AES256 -o "$PASSWORD_FILE" --passphrase "$1" 2>/dev/null
    echo "Password saved!"
}

function decrypt_password {
    gpg --decrypt --passphrase "$1" "$PASSWORD_FILE" 2>/dev/null
}

function show_help {
    echo "Usage: $0 [options]"
    echo "Options:"
    echo "  -s|--store   <name>  Store a password for the given <name>"
    echo "  -r|--retrieve <name>  Retrieve the password for the given <name>"
    echo "  -h|--help            Show this help message"
}

if [ $# -eq 0 ]; then
    show_help
    exit 0
fi

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -s|--store)
            if [ -z "$2" ]; then
                echo "Error: Missing password name. Usage: $0 --store <name>"
                exit 1
            fi
            read -s -p "Enter password for '$2': " password
            echo
            encrypt_password "$2" "$password"
            shift
            ;;
        -r|--retrieve)
            if [ -z "$2" ]; then
                echo "Error: Missing password name. Usage: $0 --retrieve <name>"
                exit 1
            fi
            decrypted=$(decrypt_password "$2")
            if [ -z "$decrypted" ]; then
                echo "Password not found for '$2'."
            else
                echo "Password for '$2': $decrypted"
            fi
            shift
            ;;
        -h|--help)
            show_help
            exit 0
            ;;
        *)
            echo "Error: Unknown option '$1'. Use --help for usage information."
            exit 1
            ;;
    esac
    shift
done

