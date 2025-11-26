#!/bin/bash
set -e

# Install nvm and node
export NVM_DIR="$HOME/.nvm"
if [ ! -s "$NVM_DIR/nvm.sh" ]; then
  ./nvm_install.sh
fi
# shellcheck source=/dev/null
. "$NVM_DIR/nvm.sh"
nvm install --lts
nvm use --lts

# Start the application
cd frontend
npm install
npm run build
npm run preview -- --host 0.0.0.0
