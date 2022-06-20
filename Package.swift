// swift-tools-version:5.3
import PackageDescription


let package = Package(
    name: "Onfido",
    platforms: [
        .iOS(.v11)
    ],
    products: [
        .library(
            name: "Onfido",
            targets: ["Onfido"])
    ],
    dependencies: [
    ],
    targets: [
        .binaryTarget(
            name: "Onfido",
            url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v25.1.0.zip",
            checksum: "89755250d2daf8b957d1c58d363133e15b78fa977ded276b1c079f497832502d"
        )
    ]
)
