@echo off
CALL "C:\Users\AKANKSHA KALE\Desktop\Vulnerabilities-Scanner\CodeQLPath.bat"
REM Step 4: Remove duplicates from src and snk CSV
echo Removing duplicates from src and snk CSV files...
"%PYTHON_PATH%" step2.py