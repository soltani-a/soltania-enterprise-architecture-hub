#!/bin/bash

set -euo pipefail

# Determine the project root (assuming script is in /scripts)
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
PROJECT_ROOT="$(dirname "$SCRIPT_DIR")"

echo "Creating project structure in: $PROJECT_ROOT"

# Define the folders to create
FOLDERS=("docs" "templates" "src" "blueprints")

for folder in "${FOLDERS[@]}"; do
    TARGET="${PROJECT_ROOT}/${folder}"
    if [ ! -d "$TARGET" ]; then
        mkdir -p "$TARGET"
        # Optional: Add a .gitkeep to ensure empty folders are tracked
        touch "$TARGET/.gitkeep"
        echo "  [+] Created: /${folder}"
    else
        echo "  [!] Exists:  /${folder}"
    fi
done

echo "Structure setup complete."
