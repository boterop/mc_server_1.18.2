REM Forge requires a configured set of both JVM and program arguments.
REM Add custom JVM arguments to the user_jvm_args.txt
REM Add custom program arguments {such as nogui} to this file in the next line before the %* or
REM  pass them to this script directly
REM DATETIME
java @user_jvm_args.txt @libraries/net/minecraftforge/forge/1.18.2-40.2.1/win_args.txt %* nogui

git add .

for /f "delims=" %%a in ('wmic OS Get localdatetime ^| find "."') do set DateTime=%%a
set year=%DateTime:~0,4%
set month=%DateTime:~4,2%
set day=%DateTime:~6,2%
set hour=%DateTime:~8,2%
set min=%DateTime:~10,2%
set time=%year%-%month%-%day%_%hour%:%min%:00

git commit -m (backup)%time%
git push origin main