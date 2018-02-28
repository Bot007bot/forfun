@echo off
del "%USERPROFILE%\AppData\Local\PhotoMaker\setup.bat"
del "%USERPROFILE%\AppData\Local\PhotoMaker\setup2.bat"
py -3 "%USERPROFILE%\AppData\Local\PhotoMaker\script.py"