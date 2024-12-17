#!/bin/bash

# Navigate to the vault directory
cd "/home/acharyp/Documents/Obsidian Vault"

# Check if there are changes
if [[ -n $(git status --porcelain) ]]; then
    # Stage changes
    git add .

    # Commit with timestamp
    DATE=$(date)
    git commit -m "Backed up at $DATE"

    # Push to remote repository
    git push origin main
    echo "Backup completed successfully."
else
    echo "No changes to backup."
fi

