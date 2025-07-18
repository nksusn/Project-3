# Simple Steps to Fix GitHub Push Issue

Follow these exact steps in your Git Bash terminal:

1. Create a new directory:
```
mkdir -p ~/Desktop/new-repo
```

2. Copy your project files (excluding .git and terraform/.terraform):
```
cd ~/Desktop/bootcamp-project-3
cp -r backend frontend helm k8s ~/Desktop/new-repo/
mkdir -p ~/Desktop/new-repo/terraform
cp terraform/*.tf ~/Desktop/new-repo/terraform/
cp .gitignore README.md ~/Desktop/new-repo/
mkdir -p ~/Desktop/new-repo/.circleci
cp .circleci/config.yml ~/Desktop/new-repo/.circleci/
```

3. Initialize a new Git repository:
```
cd ~/Desktop/new-repo
git init
```

4. Add and commit the files:
```
git add .
git commit -m "Initial clean commit"
```

5. Add your GitHub remote:
```
git remote add origin https://github.com/nksusn/bootcamp-project-3.git
```

6. Push to GitHub:
```
git push -f origin main
```

If you get an error about the branch name, try:
```
git branch -M main
git push -f origin main
```