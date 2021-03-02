// swift-tools-version:5.3
import PackageDescription


let package = Package(
    name: "Onfido",
    platforms: [
        .iOS(.v10)
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
            url: "https://s3-eu-west-1.amazonaws.com/ios/Onfido-v21.0.0.zip",
            checksum: "e909ade7ff334493235af4fd3718cdc006cc8d37e01aedc4c8b3701598b3faa7"
        )
    ]
)
