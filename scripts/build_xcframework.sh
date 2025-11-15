#!/bin/bash

# Build XCFramework for modern iOS distribution
FMK_NAME=ENSDK
PROJECT_DIR="$(pwd)/../"
BUILD_DIR="${PROJECT_DIR}/build"
XCFRAMEWORK_DIR="${PROJECT_DIR}/Products"

echo "Building ${FMK_NAME} XCFramework..."

# Clean previous builds
rm -rf "${BUILD_DIR}"
rm -rf "${XCFRAMEWORK_DIR}/${FMK_NAME}.xcframework"
mkdir -p "${XCFRAMEWORK_DIR}"

# Build for iOS devices
echo "Building for iOS devices..."
xcodebuild archive \
  -project "${PROJECT_DIR}/evernote-sdk-ios.xcodeproj" \
  -scheme "${FMK_NAME}" \
  -destination "generic/platform=iOS" \
  -archivePath "${BUILD_DIR}/ios.xcarchive" \
  CODE_SIGNING_ALLOWED=NO \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Build for iOS Simulator
echo "Building for iOS Simulator..."
xcodebuild archive \
  -project "${PROJECT_DIR}/evernote-sdk-ios.xcodeproj" \
  -scheme "${FMK_NAME}" \
  -destination "generic/platform=iOS Simulator" \
  -archivePath "${BUILD_DIR}/ios-simulator.xcarchive" \
  CODE_SIGNING_ALLOWED=NO \
  SKIP_INSTALL=NO \
  BUILD_LIBRARY_FOR_DISTRIBUTION=YES

# Create XCFramework
echo "Creating XCFramework..."
xcodebuild -create-xcframework \
  -framework "${BUILD_DIR}/ios.xcarchive/Products/Library/Frameworks/${FMK_NAME}.framework" \
  -framework "${BUILD_DIR}/ios-simulator.xcarchive/Products/Library/Frameworks/${FMK_NAME}.framework" \
  -output "${XCFRAMEWORK_DIR}/${FMK_NAME}.xcframework"

# Copy resources
echo "Copying resources..."
cp -R "${PROJECT_DIR}/ENSDKResources.bundle" "${XCFRAMEWORK_DIR}/"

# Clean up
rm -rf "${BUILD_DIR}"

echo "✅ XCFramework built successfully!"
echo "📦 Output: ${XCFRAMEWORK_DIR}/${FMK_NAME}.xcframework"
echo "📦 Resources: ${XCFRAMEWORK_DIR}/ENSDKResources.bundle"
