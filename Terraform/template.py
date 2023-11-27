# Folder Structure for any Terraform Project
import os
from pathlib import Path
import logging

logging.basicConfig(level=logging.INFO, format='[%(asctime)s]: %(message)s:')

# Change project name for each project
project_name = "AWS/EC2"

list_of_files = [
    f"{project_name}/ReadME.md",
    f"{project_name}/provider.tf",
    f"{project_name}/variables.tf",
    f"{project_name}/output.tf",
    f"{project_name}/local.tf",
    f"{project_name}/terraform.tfvars"
]

for filepath in list_of_files:
    filepath = Path(filepath)
    filedir, filename = os.path.split(filepath)

    if filedir != "":
        os.makedirs(filedir, exist_ok=True)
        logging.info(f"Creating directory; (filedir) for the file: {filename}")

    if (not os.path.exists(filepath)) or (os.path.getsizze(filepath) == 0):
        with open(filepath, "w") as f:
            pass
            logging.info(f"Creating empty file: {filepath}")

    else:
        logging.info(f"{filepath} is already exists")