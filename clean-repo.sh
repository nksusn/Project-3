#!/bin/bash

# Create directory structure
mkdir -p ../clean-project/.circleci
mkdir -p ../clean-project/terraform
mkdir -p ../clean-project/backend
mkdir -p ../clean-project/frontend/src
mkdir -p ../clean-project/frontend/public
mkdir -p ../clean-project/helm
mkdir -p ../clean-project/k8s

# Copy files (excluding .git directories)
cp backend/*.js backend/package.json ../clean-project/backend/ 2>/dev/null

# Copy frontend files
cp -r frontend/src/* ../clean-project/frontend/src/ 2>/dev/null
cp -r frontend/public/* ../clean-project/frontend/public/ 2>/dev/null
cp frontend/*.js frontend/*.json frontend/*.conf ../clean-project/frontend/ 2>/dev/null

# Copy Helm charts (excluding any .git directories)
find helm -type f -not -path "*/\.git/*" -exec cp --parents {} ../clean-project/ \; 2>/dev/null

# Copy Kubernetes files
find k8s -type f -not -path "*/\.git/*" -exec cp --parents {} ../clean-project/ \; 2>/dev/null

# Copy Terraform files (not .terraform directory)
cp terraform/*.tf ../clean-project/terraform/ 2>/dev/null

# Copy root files
cp .gitignore README.md ../clean-project/ 2>/dev/null

# Copy CircleCI config
cp .circleci/config.yml ../clean-project/.circleci/ 2>/dev/null

# Initialize a new Git repository
cd ../clean-project
git init
git add .
git commit -m "Initial clean commit"

# Add remote
git remote add origin https://github.com/nksusn/bootcamp-project-3.git

echo "Repository created. Now run:"
echo "cd ../clean-project"
echo "git push -f origin main"