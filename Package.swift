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
            url: "https://onfido-sdks-rc.s3-eu-west-1.amazonaws.com/ios/Onfido-v20.0.0.zip",
            checksum: "0bf3f59f5623b0c4f9557a26bd0780f8836dc17553eb9ef8357a057d04bab19c"
        )
    ]
)
