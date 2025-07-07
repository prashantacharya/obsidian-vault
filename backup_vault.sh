#!/bin/bash

# Define a log file for debugging output
LOG_FILE="/tmp/obsidian_backup_manual_debug.log"

# Redirect all script output (stdout and stderr) to the log file
# This is crucial for seeing what's happening when you run it.
exec > >(tee -a "$LOG_FILE") 2>&1

echo "--- Script started at $(date) ---"
echo "Current working directory before cd: $(pwd)"
echo "PATH environment variable: $PATH"
echo "---"

# Navigate to the vault directory
VAULT_DIR="/home/acharyp/Documents/Obsidian Vault"
echo "Attempting to change directory to: $VAULT_DIR"
cd "$VAULT_DIR" || { echo "ERROR: Failed to change directory to $VAULT_DIR. Exiting."; exit 1; }
echo "Current working directory after cd: $(pwd)"
echo "---"

echo "Running 'git status --porcelain'..."
GIT_STATUS_OUTPUT=$(git status --porcelain)
echo "Output of 'git status --porcelain':"
echo "---START GIT STATUS OUTPUT---"
echo "$GIT_STATUS_OUTPUT"
echo "---END GIT STATUS OUTPUT---"
echo "---"

# Check if there are changes
if [[ -n "$GIT_STATUS_OUTPUT" ]]; then
    echo "Changes detected (git status output was NOT empty)."
    # Stage changes
    echo "Staging changes..."
    git add .
    echo "Git add command finished."

    # Commit with timestamp
    DATE=$(date +"%Y-%m-%d %H:%M:%S") # Added more specific date format
    echo "Committing changes with message: Backed up at $DATE"
    git commit -m "Backed up at $DATE"
    echo "Git commit command finished."

    # Push to remote repository
    echo "Attempting to push to remote repository..."
    if git push origin main; then
        echo "Backup completed successfully and pushed to GitHub."
    else
        echo "ERROR: Git push failed! Please check $LOG_FILE for details."
    fi
else
    echo "No changes detected (git status output was empty)."
    echo "No changes to backup."
fi

echo "--- Script finished at $(date) ---"
