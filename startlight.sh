#!/usr/bin/env bash
# startlight.sh
# starts OS X spotlight service, 10.5 and 10.6
sudo launchctl load /System/Library/LaunchDaemons/com.apple.metadata.mds.plist
