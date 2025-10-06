#!/bin/bash

# Xcode Cloud CI Script - Post Clone
# This script runs after the repository is cloned and before the build starts

set -e

echo "🔧 Running Xcode Cloud CI Script..."

# Navigate to the repository root first, then to iOS directory
cd /Volumes/workspace/repository
cd ios

echo "📦 Installing CocoaPods dependencies..."
export LANG=en_US.UTF-8
pod install --repo-update

echo "✅ CocoaPods installation complete!"
echo "🎯 Ready for build!"