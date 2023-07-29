#!/bin/bash

# Providing your gitHub username and personal access token
USERNAME="YOURUSERNAME"
TOKEN="PAT(PERSONAL ACCESS TOKEN)"

# Repository details
REPO_NAME="THE NAME OF THE REPO YOU WISH TO CREATE"
DESCRIPTION="DISCRIPTION ABOUT THE REPO"
PRIVATE="false"  # Set to "true" for a private repository, "false" for a public repository

# Create the repository
curl -X POST -H "Authorization: token $TOKEN" -d "{\"name\":\"$REPO_NAME\",\"description\":\"$DESCRIPTION\",\"private\":$PRIVATE}" "https://api.github.com/user/repos"

# Check the response status code
RESPONSE_CODE=$?
if [ $RESPONSE_CODE -ne 0 ]; then
	echo "Failed to create the repository."
	exit 1
fi

echo "YOUR NEW REPOSITORY '$REPO_NAME' HAS BEEN CREATED SUCCESSFULLY ON GITHUB."
