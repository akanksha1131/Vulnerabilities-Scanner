import json
import os  # Import os module for file checks
from directory import (
    path_sarif_path,
    path_json_path
)
# Input and output file paths
input_file = path_sarif_path
output_file = path_json_path

# Clear the output file if it exists and is not empty
if os.path.exists(output_file) and os.path.getsize(output_file) > 0:
    with open(output_file, 'w') as file:
        file.write("")  # Write an empty string to clear the file
    print(f"Cleared contents of {output_file}")

# Load the SARIF file
with open(input_file, 'r') as file:
    sarif_data = json.load(file)

# Extract results from the SARIF data
results = []
if "runs" in sarif_data:
    for run in sarif_data["runs"]:
        if "results" in run:
            results.extend(run["results"])

# Save the extracted results to the output JSON file
with open(output_file, 'w') as file:
    json.dump(results, file, indent=4)

print(f"Extracted results saved to {output_file}")
