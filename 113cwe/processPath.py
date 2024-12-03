import json

def extract_code_path(file_path, output_path):
    with open(file_path, 'r') as file:
        data = json.load(file)

    with open(output_path, 'w') as output_file:
        path_count = 1  # Counter for paths
        for rule in data:
            code_flows = rule.get("codeFlows", [])
            for flow in code_flows:
                thread_flows = flow.get("threadFlows", [])
                for thread in thread_flows:
                    locations = thread.get("locations", [])
                    output_file.write(f"Path {path_count}:\n")
                    node_count = 1  # Counter for nodes within the path
                    for loc in locations:
                        physical_location = loc["location"]["physicalLocation"]
                        file_uri = physical_location["artifactLocation"]["uri"]
                        start_line = physical_location["region"]["startLine"]
                        start_column = physical_location["region"]["startColumn"]
                        snippet = physical_location["contextRegion"]["snippet"]["text"]

                        output_file.write(f"  Node {node_count}:\n")
                        output_file.write(f"    File: {file_uri}\n")
                        output_file.write(f"    Start Line: {start_line}, Start Column: {start_column}\n")
                        output_file.write(f"    Snippet:\n")
                        output_file.write(f"      {snippet}\n")
                        node_count += 1
                    output_file.write("-" * 50 + "\n")
                    path_count += 1

# Input and output paths
input_file_path = 'D:\\B.tech project\\integrated Code\\113cwe\\paths113.json'
output_file_path = 'D:\\B.tech project\\integrated Code\\extracted_info.txt'

extract_code_path(input_file_path, output_file_path)
