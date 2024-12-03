import os

# Get the directory of the current script
current_directory = os.path.dirname(os.path.abspath(__file__))

# Get the parent directory
parent_directory = os.path.dirname(current_directory)

# Walk through the parent directory and its subdirectories
print(f"Contents of the parent directory and its subfolders ({parent_directory}):")
for root, dirs, files in os.walk(parent_directory):
    for file in files:
        # Get the full path of each file
        file_path = os.path.join(root, file)
        print(file_path)
