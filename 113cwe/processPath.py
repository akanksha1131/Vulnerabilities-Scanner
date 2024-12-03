import os
import json

# Paths to input and output files
from directory import (
    path_json_path,
    processed_path_json_path,
    source_code_dir
)

# Variables for input and output paths
path_input_file = path_json_path
path_output_file = processed_path_json_path

def process_paths(path_input_file):
    """
    Function to process the JSON file and extract paths along with metadata.
    Args:
        path_input_file (str): Path to the input JSON file.

    Returns:
        list: A list of dictionaries containing processed paths and metadata.
    """
    if not os.path.exists(path_input_file):
        raise FileNotFoundError(f"Input file not found: {path_input_file}")

    # Load JSON data
    with open(path_input_file, "r") as f:
        data = json.load(f)

    # Prepare output
    processed_data = []

    for entry in data:
        code_flows = entry.get("codeFlows", [])

        for flow in code_flows:
            for thread in flow.get("threadFlows", []):
                for loc in thread.get("locations", []):
                    location = loc.get("location", {}).get("physicalLocation", {})
                    artifact = location.get("artifactLocation", {}).get("uri", "N/A")
                    region = location.get("region", {})
                    context_region = location.get("contextRegion", {})
                    snippet_text = context_region.get("snippet", {}).get("text", "Snippet not available.")
                    snippet_cleaned = " ".join(snippet_text.split())  # Clean snippet by removing tabs and newlines
                    start_line = region.get("startLine", "N/A")
                    start_column = region.get("startColumn", "N/A")
                    end_column = region.get("endColumn", "N/A")
                    message = loc.get("location", {}).get("message", {}).get("text", "N/A")

                    # Combine start_line, start_column, and end_column
                    st_line_col_st_col_end = f"{start_line}_{start_column}_{end_column}"

                    # Construct full file path
                    full_path = os.path.join(source_code_dir, artifact.replace("/", os.sep))

                    # Append processed data
                    processed_data.append({
                        "artifact": artifact,
                        "full_path": full_path,
                        "stLine_colSt_colEnd": st_line_col_st_col_end,
                        "message": message,
                        "snippet": snippet_cleaned,
                    })

    return processed_data


def clear_file_if_exists(file_path):
    """
    Clears the content of the file if it exists and is not empty.
    Args:
        file_path (str): Path to the file to clear.
    """
    if os.path.exists(file_path) and os.path.getsize(file_path) > 0:
        with open(file_path, "w") as f:
            f.truncate()  # Clear file content


# Main logic
try:
    # Process paths from the input file
    processed_paths = process_paths(path_input_file)

    # Clear the output file if it exists and is not empty
    clear_file_if_exists(path_output_file)

    # Save the processed paths in JSON format
    with open(path_output_file, "w") as f:
        json.dump(processed_paths, f, indent=4)

    print(f"Processed paths saved to {path_output_file}")

except Exception as e:
    print(f"An error occurred: {e}")
