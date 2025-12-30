#!/bin/bash

# Production build script for Flutter web app
# This script builds the Flutter web app for production deployment

set -e

echo "🚀 Starting production build..."

# Clean previous builds
echo "🧹 Cleaning previous builds..."
flutter clean

# Get dependencies
echo "📦 Getting dependencies..."
flutter pub get

# Generate code (freezed, json_serializable, etc.)
echo "⚙️  Generating code..."
flutter pub run build_runner build --delete-conflicting-outputs

# Build for web in release mode
echo "🏗️  Building web app (release mode)..."
flutter build web --release --base-href /

# Check if build was successful
if [ -d "build/web" ]; then
    echo "✅ Build successful! Output is in build/web/"
    echo "📊 Build size:"
    du -sh build/web
    echo ""
    echo "📝 Next steps:"
    echo "1. Upload the contents of build/web/ to your VPS"
    echo "2. Configure nginx to serve the files"
    echo "3. Set up SSL certificate for your domain"
else
    echo "❌ Build failed!"
    exit 1
fi

