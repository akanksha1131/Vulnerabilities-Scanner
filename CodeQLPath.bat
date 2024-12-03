:: Set base directory to the location of this script
SET BASE_DIR=%~dp0

SET "DB_PATH=C:\Users\AKANKSHA KALE\AppData\Roaming\Code\User\workspaceStorage\4ce96addddc27736cd7edc303aa8a1a2\GitHub.vscode-codeql\akanksha1131-verademo-1\java"
SET "CODEQL_PATH=C:\Users\AKANKSHA KALE\Downloads\codeql-bundle-win64\codeql\codeql.exe"
SET "PYTHON_PATH=C:\Users\AKANKSHA KALE\AppData\Local\Programs\Python\Python312\python.exe"

:: Set relative paths for CWE113
SET PATH113=%BASE_DIR%codeql-custom-queries-java\cwe113\path113.ql
SET SNK113=%BASE_DIR%codeql-custom-queries-java\cwe113\snk113.ql
SET SRC113=%BASE_DIR%codeql-custom-queries-java\cwe113\src113.ql

:: Set relative paths for CWE117
SET PATH117=%BASE_DIR%codeql-custom-queries-java\cwe117\path117.ql
SET SNK117=%BASE_DIR%codeql-custom-queries-java\cwe117\snk117.ql
SET SRC117=%BASE_DIR%codeql-custom-queries-java\cwe117\src117.ql

:: Set relative paths for CWE134/89
SET PATH89=%BASE_DIR%codeql-custom-queries-java\cwe134_89\path89.ql
SET SNK89=%BASE_DIR%codeql-custom-queries-java\cwe134_89\snk89.ql
SET SRC89=%BASE_DIR%codeql-custom-queries-java\cwe134_89\src89.ql

:: Set relative paths for CWE200
SET PATH200=%BASE_DIR%codeql-custom-queries-java\cwe200\path200.ql
SET SNK200=%BASE_DIR%codeql-custom-queries-java\cwe200\snk200.ql
SET SRC200=%BASE_DIR%codeql-custom-queries-java\cwe200\src200.ql

:: Set relative paths for CWE327
SET PATH327=%BASE_DIR%codeql-custom-queries-java\cwe327\path327.ql
SET SNK327=%BASE_DIR%codeql-custom-queries-java\cwe327\snk327.ql
SET SRC327=%BASE_DIR%codeql-custom-queries-java\cwe327\src327.ql

:: Set relative paths for CWE470
SET PATH470=%BASE_DIR%codeql-custom-queries-java\cwe470\path470.ql
SET SNK470=%BASE_DIR%codeql-custom-queries-java\cwe470\snk470.ql
SET SRC470=%BASE_DIR%codeql-custom-queries-java\cwe470\src470.ql

:: Set relative paths for CWE501
SET PATH501=%BASE_DIR%codeql-custom-queries-java\cwe501\path501.ql
SET SNK501=%BASE_DIR%codeql-custom-queries-java\cwe501\snk501.ql
SET SRC501=%BASE_DIR%codeql-custom-queries-java\cwe501\src501.ql

:: Set relative paths for CWE502
SET PATH502=%BASE_DIR%codeql-custom-queries-java\cwe502\path502.ql
SET SNK502=%BASE_DIR%codeql-custom-queries-java\cwe502\snk502.ql
SET SRC502=%BASE_DIR%codeql-custom-queries-java\cwe502\src502.ql

:: Set relative paths for CWE601
SET PATH601=%BASE_DIR%codeql-custom-queries-java\cwe601\path601.ql
SET SNK601=%BASE_DIR%codeql-custom-queries-java\cwe601\snk601.ql
SET SRC601=%BASE_DIR%codeql-custom-queries-java\cwe601\src601.ql

:: Set relative paths for CWE73
SET PATH73=%BASE_DIR%codeql-custom-queries-java\cwe73\path73.ql
SET SNK73=%BASE_DIR%codeql-custom-queries-java\cwe73\snk73.ql
SET SRC73=%BASE_DIR%codeql-custom-queries-java\cwe73\src73.ql

:: Set relative paths for CWE78
SET PATH78=%BASE_DIR%codeql-custom-queries-java\cwe78\path78.ql
SET SNK78=%BASE_DIR%codeql-custom-queries-java\cwe78\snk78.ql
SET SRC78=%BASE_DIR%codeql-custom-queries-java\cwe78\src78.ql

:: Set relative paths for CWE80
SET PATH80=%BASE_DIR%codeql-custom-queries-java\cwe80\path80.ql
SET SNK80=%BASE_DIR%codeql-custom-queries-java\cwe80\snk80.ql
SET SRC80=%BASE_DIR%codeql-custom-queries-java\cwe80\src80.ql
