# Audio Files Setup Instructions

## Overview
The `assets/audio/` directory contains large audio files (1.1GB total) that are excluded from Git due to GitHub's file size limits. Some individual files exceed 100MB.

## Audio Files Included
- **Frequency files**: 432hz, 528hz, 639hz, 741hz, 852hz, 963hz (various sizes, some up to 174MB)
- **Ambience files**: forest, fire, meadow, night, ocean, rain, waterfall, wind (56-60MB each)

## Setup Options

### Option 1: Download from External Storage (Recommended)
1. Download audio files from: [Add your cloud storage link here]
2. Extract to `assets/audio/` directory
3. Ensure file structure matches:
   ```
   assets/audio/
   ├── frequency/
   │   ├── 432hz.m4a
   │   ├── 528hz.m4a
   │   ├── 639hz.m4a
   │   ├── 741hz.m4a
   │   ├── 852hz.m4a
   │   └── 963hz.m4a
   └── ambience/
       ├── forest.m4a
       ├── fire.m4a
       ├── meadow.m4a
       ├── night.m4a
       ├── ocean.m4a
       ├── rain.m4a
       ├── waterfall.m4a
       └── wind.m4a
   ```

### Option 2: Use Git LFS (Alternative)
If you prefer to use Git LFS:
1. Install Git LFS: `git lfs install`
2. Track audio files: `git lfs track "*.m4a"`
3. Add and commit: `git add .gitattributes && git commit -m "Add LFS tracking for audio files"`

### Option 3: Compress Audio Files
Reduce file sizes by:
1. Converting to lower bitrate: `ffmpeg -i input.m4a -b:a 128k output.m4a`
2. Using shorter duration files for testing
3. Implementing streaming for production

## Development Notes
- Audio files are referenced in the app but excluded from Git
- Ensure audio files are present before building for iOS/Android
- Consider implementing audio streaming for production deployment

## Build Requirements
- Audio files must be present in `assets/audio/` for local development
- For Xcode Cloud builds, ensure audio files are available or implement fallback logic
