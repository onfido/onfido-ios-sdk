# Frequently Asked Questions (FAQ)

## Why does Onfido iOS SDK has two pods?

The Onfido iOS SDK has been written using Swift. Swift dynamic frameworks are being rejected by the Apple App Store that contain simulator slices. This bug has been reported on [Apple's forum](https://forums.developer.apple.com/thread/21496) and Cocoapods have issues in [supporting a workaround](https://github.com/CocoaPods/CocoaPods/issues/1993) to this bug.

We have been forced to have two frameworks; one containing the simulator slices(`pod 'Onfido'`) and one with the simulator slices removed (`pod 'Onfido-Release'`) for App Store submission purposes.