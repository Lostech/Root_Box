 @echo off
 color 1F
 cls
 AndroidInfo.exe --adb="..\adb\adb_minimal.exe" --output="..\info" --show --root
 