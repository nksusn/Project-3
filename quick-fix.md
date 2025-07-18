# Quick Fix for Large Files

Since the large Terraform provider files are causing issues with GitHub's file size limits, follow these steps:

1. Delete the entire terraform/.terraform directory:
   ```
   rm -rf terraform/.terraform
   ```

2. Commit this change:
   ```
   git add -A
   git commit -m "Remove large Terraform provider files"
   ```

3. Force push to GitHub:
   ```
   git push -f origin main
   ```

This will remove the large files from your current commit and push the changes to GitHub.

Note: This approach will still keep the large files in your Git history, but they won't be in your current commit. For a complete cleanup of Git history, use one of the script solutions.