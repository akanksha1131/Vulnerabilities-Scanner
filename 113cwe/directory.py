import os

# Get the directory of the current script
current_directory = os.path.dirname(__file__)

# JSON file paths
path_json_path = os.path.join(current_directory, "path.json")
snk_v_json_path = os.path.join(current_directory, "snk_v.json")
src_v_json_path = os.path.join(current_directory, "src_v.json")
processed_path_json_path = os.path.join(current_directory, "processedPaths.json")

# CSV file paths
distinct_snk_csv_path = os.path.join(current_directory, "distinct_snk.csv")
distinct_src_csv_path = os.path.join(current_directory, "distinct_src.csv")
pathsForLLM_csv_path = os.path.join(current_directory, "pathsForLLM.csv")
report113_csv_path = os.path.join(current_directory, "report113.csv")
snk_csv_path = os.path.join(current_directory, "snk.csv")
src_csv_path = os.path.join(current_directory, "src.csv")

# SARIF file paths
path_sarif_path = os.path.join(current_directory, "path.sarif")

# Python and other file paths
directory_py_path = os.path.join(current_directory, "directory.py")
extractPathWithText_py_path = os.path.join(current_directory, "extractPathWithText.py")
removeDuplicates_py_path = os.path.join(current_directory, "removeDuplicates.py")
sarifToJson_py_path = os.path.join(current_directory, "sarifToJson.py")
scan113_bat_path = os.path.join(current_directory, "scan113.bat")
step2_py_path = os.path.join(current_directory, "step2.py")
step4_py_path = os.path.join(current_directory, "step4.py")

#Directory of VeraDemo
source_code_dir = "C:\\Users\\AKANKSHA KALE\\Desktop\\verademo"