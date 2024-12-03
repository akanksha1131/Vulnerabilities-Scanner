from directory import (
    processed_path_json_path,
    distinct_snk_csv_path,
    distinct_src_csv_path,
    pathsForLLM_csv_path
)

path_input_file = processed_path_json_path
validated_sources_by_llm = distinct_src_csv_path
validated_sinks_by_llm = distinct_snk_csv_path
path_output_file = pathsForLLM_csv_path

import os
import json

#validate the paths : path's source is in distinct_src.csv and path's sink is in distinct_snk.csv