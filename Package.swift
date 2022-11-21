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
            url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v27.0.0.zip",
            checksum: "1757c58b46439db59273fd057cc5fb469de32c2356fb4575284113b8dd06b520"
        )
    ]
)
