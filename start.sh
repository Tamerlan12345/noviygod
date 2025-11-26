#!/bin/bash
set -e
set -x  # Enable debug mode to print every command

# update and install curl
sudo apt-get update
sudo apt-get install -y curl

# Install nvm and node
export NVM_DIR="$HOME/.nvm"
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  ./nvm_install.sh
fi
# shellcheck source=/dev/null
. "$NVM_DIR/nvm.sh"

# Install and use LTS version
nvm install v22.21.1
nvm use v22.21.1

# Navigate to frontend
cd frontend

echo "------------------------------------------------"
echo "Starting dependency installation..."
echo "Applying fix for Node.js IPv6 networking issues..."
echo "------------------------------------------------"

# FIX: Force npm to use IPv4 to prevent hanging on DNS lookups
echo "node-options=--dns-result-order=ipv4first" >> ~/.npmrc

# Install dependencies with verbose logging to track progress
npm install --verbose

echo "Building project..."
npm run build

echo "Starting preview server..."
# Ensure the server binds to the correct port (Railway often requires $PORT)
PORT="${PORT:-4173}"
npm run preview -- --host 0.0.0.0 --port $PORT
