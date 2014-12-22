
default: test

build:
	xcodebuild -sdk iphonesimulator -target PoseGallery build

test:
	#xcodebuild -sdk iphonesimulator -scheme PoseGalleryTests test
	xctool -sdk iphonesimulator -arch i386 -scheme PoseGalleryTests test

clean:
	xcodebuild -sdk iphonesimulator clean

.PHONY: build test clean default