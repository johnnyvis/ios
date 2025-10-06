#!/bin/bash

# Xcode Cloud CI Script - Post Clone
# This script runs after the repository is cloned and before the build starts

set -e

echo "🔧 Running Xcode Cloud CI Script..."

# Navigate to the repository root first
cd /Volumes/workspace/repository

echo "📦 Installing npm dependencies..."
# Install Node.js dependencies (node_modules should be committed or generated)
npm install

echo "📦 Installing CocoaPods dependencies..."
cd ios
export LANG=en_US.UTF-8
pod install --repo-update

echo "✅ CocoaPods installation complete!"
echo "🎯 Ready for build!"