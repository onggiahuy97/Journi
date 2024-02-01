#!/bin/bash

# Display current git status
git status

# Add all changes to git
git add .

# Prompt for commit message
echo "Enter commit message: "
read COMMIT_MESSAGE

# Commit changes
git commit -m "$COMMIT_MESSAGE"

# Push changes
git push

echo "Changes pushed to remote."

