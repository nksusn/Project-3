# Manual Steps to Create a Clean Repository

Follow these steps to create a clean repository without large files:

1. Create a new directory:
```
mkdir -p ../clean-project
mkdir -p ../clean-project/.circleci
mkdir -p ../clean-project/terraform
mkdir -p ../clean-project/backend
mkdir -p ../clean-project/frontend
mkdir -p ../clean-project/helm
mkdir -p ../clean-project/k8s
```

2. Copy files manually (avoid copying .git directories):

```
# Copy backend files
cp -r backend/*.js backend/package.json ../clean-project/backend/

# Copy frontend files
cp -r frontend/src frontend/public frontend/*.js frontend/*.json frontend/*.conf ../clean-project/frontend/

# Copy Helm charts
cp -r helm/* ../clean-project/helm/

# Copy Kubernetes files
cp -r k8s/* ../clean-project/k8s/

# Copy Terraform files (not .terraform directory)
cp terraform/*.tf ../clean-project/terraform/

# Copy root files
cp .gitignore README.md ../clean-project/

# Copy CircleCI config
cp .circleci/config.yml ../clean-project/.circleci/
```

3. Initialize a new Git repository:
```
cd ../clean-project
git init
git add .
git commit -m "Initial clean commit"
```

4. Add remote and push:
```
git remote add origin https://github.com/nksusn/bootcamp-project-3.git
git push -f origin main
```