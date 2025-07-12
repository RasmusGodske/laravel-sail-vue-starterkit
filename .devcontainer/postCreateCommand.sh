#!/bin/bash

# Ensure the script fails on any error
set -e

# Ensure correct ownership of key directories
sudo chown -R vscode:vscode /home/vscode/project/vendor
sudo chown -R vscode:vscode /home/vscode/project/node_modules

# If composer.json exists run composer install
if [ -f /home/vscode/project/composer.json ]; then
  echo "Composer file found, running composer install..."
  composer install
else
  echo "No composer.json found, skipping composer install."
fi
