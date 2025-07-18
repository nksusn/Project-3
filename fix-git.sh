#!/bin/bash

# Remove the large files from git
git rm --cached terraform/.terraform/providers/registry.terraform.io/hashicorp/aws/5.100.0/windows_amd64/terraform-provider-aws_v5.100.0_x5.exe
git rm --cached terraform/.terraform/providers/registry.terraform.io/hashicorp/kubernetes/2.37.1/windows_amd64/terraform-provider-kubernetes_v2.37.1_x5.exe
git rm --cached terraform/.terraform/providers/registry.terraform.io/hashicorp/helm/2.17.0/windows_amd64/terraform-provider-helm_v2.17.0_x5.exe

# Remove the entire .terraform directory to be safe
git rm -r --cached terraform/.terraform/

# Commit the changes
git commit -m "Remove large Terraform provider files"

# Push to GitHub
echo "Now run: git push"