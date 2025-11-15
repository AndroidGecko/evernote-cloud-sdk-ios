#import <Foundation/Foundation.h>

NSBundle* EvernoteSDK_SWIFTPM_MODULE_BUNDLE() {
    NSURL *bundleURL = [[[NSBundle mainBundle] bundleURL] URLByAppendingPathComponent:@"EvernoteSDK_EvernoteSDK.bundle"];

    NSBundle *preferredBundle = [NSBundle bundleWithURL:bundleURL];
    if (preferredBundle == nil) {
      return [NSBundle bundleWithPath:@"/Users/marcinczech/coding/evernote-cloud-sdk-ios/.build/arm64-apple-macosx/debug/EvernoteSDK_EvernoteSDK.bundle"];
    }

    return preferredBundle;
}