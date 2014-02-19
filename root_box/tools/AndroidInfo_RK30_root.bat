 @echo off
 color 1F
 cls
 AndroidInfo.exe --adb="..\adb\adb_rk30.exe" --output="..\info" --show --root
 