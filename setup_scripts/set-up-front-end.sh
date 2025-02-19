#!/bin/bash

# Define NVM directory
NVM_DIR="$HOME/.nvm"

# Check if NVM is installed
if [ ! -d "$NVM_DIR" ]; then
  echo "NVM not found. Installing..."

  # Install NVM
  curl -fsSL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.7/install.sh | bash

  # Add NVM to .zshrc if not already added
  if ! grep -q 'export NVM_DIR="$HOME/.nvm"' ~/.zshrc; then
    echo 'export NVM_DIR="$HOME/.nvm"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"' >> ~/.zshrc
    echo '[ -s "$NVM_DIR/bash_completion" ] && \. "$NVM_DIR/bash_completion"' >> ~/.zshrc
  fi

  # Source .zshrc
  source ~/.zshrc
else
  echo "NVM is already installed."
fi

# Ensure NVM is loaded
export NVM_DIR="$HOME/.nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# Install Node.js 18
echo "Installing Node.js 18..."
nvm install 18

# Use Node.js 18
echo "Using Node.js 18..."
nvm use

# Install dependencies
echo "Installing dependencies..."
npm install

# Run the development server
echo "Starting the development server..."
npm run dev
