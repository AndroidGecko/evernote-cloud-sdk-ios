// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "EvernoteSDK",
    platforms: [
        .iOS(.v12)
    ],
    products: [
        .library(
            name: "EvernoteSDK",
            targets: ["EvernoteSDK"]
        ),
    ],
    targets: [
        .target(
            name: "EvernoteSDK",
            path: "evernote-sdk-ios/ENSDK",
            resources: [
                .copy("../../ENSDKResources.bundle")
            ],
            linkerSettings: [
                .linkedFramework("CoreServices"),
                .linkedFramework("UIKit"),
                .linkedFramework("WebKit"),
                .linkedLibrary("xml2")
            ]
        )
    ]
)
