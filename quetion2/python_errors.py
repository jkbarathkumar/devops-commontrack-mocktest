import re
import json

log_file = 'timestamp.log'
output_file = 'c.json'

error_entries = []

with open(log_file, 'r') as file:
    for line in file:
        match = re.match(r"(\d{4}-\d{2}-\d{2} \d{2}:\d{2}:\d{2},\d{3}).*- ERROR - (.*)", line)
        if match:
            timestamp = match.group(1)
            message = match.group(2).strip()
            error_entries.append({'timestamp': timestamp, 'error_message': message})

with open(output_file, 'w') as outfile:
    json.dump(error_entries, outfile, indent=4)