@echo off

REM Set the base directory to the parent directory of this script
FOR %%I IN ("%~dp0..") DO SET BASE_DIR=%%~fI

REM Import the CodeQL paths from CodeQLPath.bat using the base directory
CALL "%BASE_DIR%\CodeQLPath.bat"

REM Echo BASE_DIR and DB_PATH for debugging
echo BASE_DIR: %BASE_DIR%
echo DB_PATH: %DB_PATH%

REM CWE 113: Define relative paths for output files using BASE_DIR
set "CSV_REPORT_FILE_1=%BASE_DIR%\113cwe\src.csv"
set "CSV_REPORT_FILE_2=%BASE_DIR%\113cwe\snk.csv"
set "SARIF_REPORT_FILE=%BASE_DIR%\113cwe\path.sarif"

REM Echo the output file paths for debugging
echo CSV_REPORT_FILE_1: %CSV_REPORT_FILE_1%
echo CSV_REPORT_FILE_2: %CSV_REPORT_FILE_2%
echo SARIF_REPORT_FILE: %SARIF_REPORT_FILE%

REM Step 1: Check if the database exists
if exist "%DB_PATH%" (
    echo Using existing CodeQL database at: %DB_PATH%
) else (
    echo Error: CodeQL database not found at %DB_PATH%.
    exit /b 1
)

REM Step 2: Delete old report files if they exist
if exist "%CSV_REPORT_FILE_1%" (
    echo Deleting old CSV report file: %CSV_REPORT_FILE_1%
    del "%CSV_REPORT_FILE_1%"
)
if exist "%CSV_REPORT_FILE_2%" (
    echo Deleting old CSV report file: %CSV_REPORT_FILE_2%
    del "%CSV_REPORT_FILE_2%"
)
if exist "%SARIF_REPORT_FILE%" (
    echo Deleting old SARIF report file: %SARIF_REPORT_FILE%
    del "%SARIF_REPORT_FILE%"
)

REM Step 3: Run analysis for each query and generate CSV reports
echo Running analysis for src113.ql and generating CSV report...
"%CODEQL_PATH%" database analyze --rerun "%DB_PATH%" "%SRC113%" --format=csv --output="%CSV_REPORT_FILE_1%"

echo Running analysis for snk113.ql and generating CSV report...
"%CODEQL_PATH%" database analyze --rerun "%DB_PATH%" "%SNK113%" --format=csv --output="%CSV_REPORT_FILE_2%"

echo Step 3: Analysis complete. CSV reports generated:
echo %CSV_REPORT_FILE_1%
echo %CSV_REPORT_FILE_2%

REM Step 4: Remove duplicates from src and snk CSV
echo Removing duplicates from src and snk CSV files...
"%PYTHON_PATH%" removeDuplicates.py

REM Step 5: LLM validation for source and sink candidates
echo Validating source and sink candidates using LLM...
"%PYTHON_PATH%" step2.py

REM Step 6: Run the path query and generate SARIF report
echo Running path query and generating SARIF report...
"%CODEQL_PATH%" database analyze --rerun "%DB_PATH%" "%PATH113%" --format=sarif-latest --output="%SARIF_REPORT_FILE%" --sarif-add-snippets

echo SARIF report generated:
echo %SARIF_REPORT_FILE%

REM Step 7: Convert SARIF to JSON
echo Converting SARIF to JSON...
"%PYTHON_PATH%" sarifToJson.py

REM Step 8: Extract paths with text
echo Extracting paths with text...
"%PYTHON_PATH%" processPath.py

REM Step 9: Validating Paths
echo Validating Paths
"%PYTHON_PATH%" extractPathWithText.py

REM Step 10: Contextual analysis and report generation
echo Performing contextual analysis and generating report using LLM...
"%PYTHON_PATH%" step4.py

echo CWE-113: All tasks completed successfully!
pause
