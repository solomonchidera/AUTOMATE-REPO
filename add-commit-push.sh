#!/bin/bash

# Function to automate git add, commit, and push
git_add_commit_push() {
    if [ -z "$1" ]; then
        echo "Please provide a commit message."
        exit 1
    fi

    # Check if there are any uncommitted changes
    if [[ -n $(git status --porcelain) ]]; then
        # Prompt the user to choose the files to add
        read -p "Do you want to add all changes? (y/n): " answer
        case $answer in
            [Yy]* ) git add . ;;
            [Nn]* ) read -p "Enter space-separated filenames to add: " files
                    git add $files ;;
            * ) echo "Invalid choice. Aborting."
                exit 1 ;;
        esac

        # Commit with the provided message
        git commit -m "$1"

        # Push to the remote repository (assuming you're pushing to 'origin' branch 'master')
        git push origin master
    else
        echo "Come on !! input a commit message."
    fi
}

# Check if the current directory is a Git repository
if ! git rev-parse --is-inside-work-tree &>/dev/null; then
    echo "Error: Not a Git repository. Please run this script in a directory with a Git repository."
    exit 1
fi

# Get the commit message from the command-line argument
commit_message="$1"

# Call the function to perform git add, commit, and push
git_add_commit_push "$commit_message"
