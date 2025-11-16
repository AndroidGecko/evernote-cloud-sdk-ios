// swift-tools-version:5.5
import PackageDescription

let package = Package(
    name: "EvernoteSDK",
    defaultLocalization: "en",
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
            exclude: [
                "SendToEvernoteActivity"
            ],
            resources: [
                .copy("../../ENSDKResources.bundle")
            ],
            cSettings: [
                .headerSearchPath("."),
                .headerSearchPath("Private"),
                .headerSearchPath("Private/3rdParty/KSHTMLWriter"),
                .headerSearchPath("Private/3rdParty/SSKeychain"),
                .headerSearchPath("Private/3rdParty/Thrift"),
                .headerSearchPath("Private/3rdParty/AFNetworking"),
                .headerSearchPath("Private/3rdParty/cocoa-oauth"),
                .headerSearchPath("Advanced"),
                .headerSearchPath("Advanced/EDAM"),
                .headerSearchPath("Advanced/Utilities"),
                .headerSearchPath("Advanced/Utilities/ENMLWriter")
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
