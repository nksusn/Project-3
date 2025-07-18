#!/bin/bash

# Create clean directory structure
mkdir -p ../clean-project
mkdir -p ../clean-project/.circleci
mkdir -p ../clean-project/terraform

# Copy essential files
cp -r backend frontend helm k8s secrets ../clean-project/
cp README.md .gitignore ../clean-project/
cp .circleci/config.yml ../clean-project/.circleci/

# Copy only Terraform files, not the .terraform directory
cp terraform/*.tf ../clean-project/terraform/
[ -f terraform/*.tfvars.example ] && cp terraform/*.tfvars.example ../clean-project/terraform/

# Initialize new repository
cd ../clean-project
git init
git add .
git commit -m "Initial clean commit"

# Add remote and push
git remote add origin https://github.com/nksusn/bootcamp-project-3.git
git push -f origin main

echo "Clean repository created and pushed to GitHub."