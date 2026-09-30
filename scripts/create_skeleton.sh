#!/bin/bash
set -euo pipefail

skeleton_files=("versions.tf" "providers.tf" "backend.tf" "locals.tf" "main.tf" "variables.tf" "terraform.tfvars")

# In Bash, parentheses () must always be completely empty.
# Bash functions handle passed variables identically to how scripts handle
# command-line arguments: by using positional parameters ($1, $2, $3...) and special array symbols ($@).
create_skeleton() {
  echo "***** Checking Root Module Files in Current Directory *****"
  # "$@" captures all arguments passed to this function
  for file in "$@"; do
    if [[ ! -f "${file}" ]]; then
      echo "${file} doesn't exist. Creating..."
      touch "${file}"
    else
      echo "${file} exists. Creation skipped."
    fi
  done
}

# Pass the entire array as separate arguments to the function
create_skeleton "${skeleton_files[@]}"
