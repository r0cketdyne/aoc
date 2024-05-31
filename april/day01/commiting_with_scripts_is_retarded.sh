#!/bin/bash

# Check if there are any changes to commit
if [[ -n $(git status -s) ]]; then
    echo "Changes detected, committing..."
    git add .
    git commit -m "this is retarded"
fi

# Push to GitHub
echo "Pushing to GitHub..."
git push origin HEAD

echo "this is retarded"

