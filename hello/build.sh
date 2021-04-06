#!/bin/bash

# sdk version see
# xcodebuild -showsdks 


# build *.app
xcodebuild clean -sdk iphonesimulator14.4 -workspace hello/hello.xcodeproj/project.xcworkspace -scheme hello -derivedDataPath output
xcodebuild -sdk iphonesimulator14.4 -workspace hello/hello.xcodeproj/project.xcworkspace -scheme hello -derivedDataPath output

# pack *.ipa
