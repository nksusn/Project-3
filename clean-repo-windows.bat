@echo off
REM Create a clean repository without large files

REM Create directory structure
mkdir ..\clean-project
mkdir ..\clean-project\.circleci
mkdir ..\clean-project\terraform
mkdir ..\clean-project\backend
mkdir ..\clean-project\frontend
mkdir ..\clean-project\helm
mkdir ..\clean-project\k8s

REM Copy files (excluding .git directories)
xcopy backend\*.js ..\clean-project\backend\ /Y
xcopy backend\package.json ..\clean-project\backend\ /Y

xcopy frontend\src\*.* ..\clean-project\frontend\src\ /E /Y
xcopy frontend\public\*.* ..\clean-project\frontend\public\ /E /Y
xcopy frontend\*.js ..\clean-project\frontend\ /Y
xcopy frontend\*.json ..\clean-project\frontend\ /Y
xcopy frontend\*.conf ..\clean-project\frontend\ /Y

xcopy helm\*.* ..\clean-project\helm\ /E /Y
xcopy k8s\*.* ..\clean-project\k8s\ /E /Y
xcopy terraform\*.tf ..\clean-project\terraform\ /Y

copy .gitignore ..\clean-project\ /Y
copy README.md ..\clean-project\ /Y
copy .circleci\config.yml ..\clean-project\.circleci\ /Y

REM Initialize Git repository
cd ..\clean-project
git init
git add .
git commit -m "Initial clean commit"

REM Add remote and push
git remote add origin https://github.com/nksusn/bootcamp-project-3.git

echo.
echo Repository created. Now run:
echo git push -f origin main