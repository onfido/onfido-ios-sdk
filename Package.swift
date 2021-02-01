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
            url: "https://s3-eu-west-1.amazonaws.com/ios/Onfido-v20.1.0.zip",
            checksum: "34b6d04053f41275e432c17f61ad7c32739e6980ebca91e38e967ccbdf6c71c4"
        )
    ]
)
