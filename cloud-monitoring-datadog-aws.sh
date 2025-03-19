#!/bin/bash

# Set working directory
cd /home/ec2-user || { echo "Failed to change directory"; exit 1; }

# Update system packages
echo "Updating system packages..."
sudo yum update -y

# Ensure Git is installed
if ! command -v git &> /dev/null; then
    echo "Installing Git..."
    sudo yum install git -y
else
    echo "Git is already installed."
fi

# Display Git version
git --version

# Initialize Git repository if not already initialized
if [ ! -d ".git" ]; then
    echo "Initializing Git repository..."
    git init
    git remote add origin https://github.com/soumamukherjee27/cloud-monitoring-datadog-aws
else
    echo "Git repository already exists."
fi

# Create README file with project details
echo "Setting up README..."
cat <<EOF > README.md
# Cloud Monitoring with Datadog and AWS EC2

This project integrates Datadog with AWS EC2 for enhanced cloud monitoring and optimization.
EOF

git add README.md

# Ensure scripts directory exists
mkdir -p scripts

# Move automation scripts if available
echo "Organizing automation scripts..."
for script in system_update.sh apache_install.sh datadog_install.sh agent_start.sh; do
    if [ -f "$script" ]; then
        mv "$script" scripts/
        echo "Moved $script to scripts/ directory."
    else
        echo "Skipping: $script not found."
    fi
done

# Stage all changes and commit
echo "Committing changes to Git..."
git add .
git commit -m "Initial setup: Added Cloud Monitoring project and automation scripts"

# Set main branch and push changes
git branch -M main
git push -u origin main

echo "Setup completed successfully!"
