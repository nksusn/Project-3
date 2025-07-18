# Fix Git Branch Issue

Run these commands in your Git Bash terminal:

```bash
# Go to your clean project directory
cd ~/Desktop/clean-project

# Check current branch name
git branch

# If no branch exists or you're not on main, create and switch to main branch
git checkout -b main

# Add all files if they're not already added
git add .

# Commit if needed
git commit -m "Initial commit"

# Push to GitHub with force flag
git push -f origin main
```

If you still get an error, try:

```bash
# Rename current branch to main
git branch -M main

# Push again
git push -f origin main
```