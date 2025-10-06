#!/bin/bash

# Xcode Cloud CI Script - Post Clone
# This script runs after the repository is cloned and before the build starts

set -e

echo "🔧 Running Xcode Cloud CI Script..."

# Navigate to the repository root first
cd /Volumes/workspace/repository

echo "📦 Installing Node.js..."
# Try multiple Node.js installation methods for Xcode Cloud compatibility

# Method 1: Try to install Node.js directly
if ! command -v node &> /dev/null; then
    echo "Node.js not found, installing..."
    
    # Try using Homebrew if available
    if command -v brew &> /dev/null; then
        echo "Installing Node.js via Homebrew..."
        brew install node
    else
        # Try using nvm as fallback
        echo "Installing Node.js via nvm..."
        curl -o- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.0/install.sh | bash
        export NVM_DIR="$HOME/.nvm"
        [ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"
        nvm install 18
        nvm use 18
    fi
else
    echo "Node.js already available: $(node --version)"
fi

echo "📦 Installing npm dependencies..."
npm install

echo "📦 Installing CocoaPods dependencies..."
cd ios
export LANG=en_US.UTF-8
pod install --repo-update

echo "✅ CocoaPods installation complete!"
echo "🎯 Ready for build!"