#!/bin/bash

# Docs by jazzy
# https://github.com/realm/jazzy
# ------------------------------

git submodule update --remote

cd swift-pose-gallery/PoseGallery
carthage build --platform iOS

jazzy -o ../../ \
    --readme ../README.md \
    --module PoseGallery \
    --author 'Trollwerks Inc' \
    --author_url 'http://www.trollwerks.com' \
    --github_url 'https://github.com/alexcurylo/swift-pose-gallery' \
    --theme fullwidth \
    --swift-version 2.2 \
    --min-acl private
