#!/bin/bash

# Create a temporary directory for the clean files
mkdir -p ../temp-project

# Copy all files except .git and terraform/.terraform
find . -type f -not -path "./.git/*" -not -path "./terraform/.terraform/*" -exec cp --parents {} ../temp-project \;

# Create a new git repository
cd ../temp-project
git init
git add .
git commit -m "Initial commit with clean files"

# Add the remote
git remote add origin https://github.com/nksusn/bootcamp-project-3.git

# Force push to the remote
git push -f origin main

echo "Done! The repository has been recreated without the large files."
echo "You can now delete the old directory and rename this one."