#!/bin/bash
# Backup workspace files to GitHub
# Run: chmod +x backup-to-github.sh && ./backup-to-github.sh

cd /root/.openclaw/workspace

echo "=== Backing up workspace to GitHub ==="

# Add all changes
git add -A

# Check if there are changes to commit
if git diff --staged --quiet && git diff --quiet; then
    echo "No changes to commit."
    exit 0
fi

# Commit with timestamp
TIMESTAMP=$(date -u "+%Y-%m-%d %H:%M UTC")
git commit -m "Workspace backup: $TIMESTAMP"

# Push to GitHub
echo "Pushing to GitHub..."
git push origin master

echo "=== Backup complete ==="