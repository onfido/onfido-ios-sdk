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
            url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v25.1.1.zip",
            checksum: "91e4c22c3df1d8d62cb57734f6f22cf384cabc9cf933ae02e8bc48285b0edbd5"
        )
    ]
)
