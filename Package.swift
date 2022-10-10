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
            url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v26.1.0.zip",
            checksum: "a43a2c3120b7958ed2ed3a7570b6b8ef31abd6af78e0100c7e21dc02a7fce077"
        )
    ]
)
