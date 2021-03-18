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
            url: "https://s3-eu-west-1.amazonaws.com/ios/Onfido-v21.1.0.zip",
            checksum: "2992771908be3f4be4eca10e479707a357f19cb758f0e47486a093e33d18fdae"
        )
    ]
)
