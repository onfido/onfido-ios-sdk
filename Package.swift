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
            url: "https://s3-eu-west-1.amazonaws.com/ios/Onfido-v21.2.0.zip",
            checksum: "837c4d986139fd686dd37dad61cfd657391a2b4fde1bc1334355fb21e848b5c4"
        )
    ]
)
