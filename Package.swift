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
            url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v24.5.0.zip",
            checksum: "c171bf4a687774be5a4e8093910d3c29c9d8958f5b8cee7378f9d623e82d9dc4"
        )
    ]
)
