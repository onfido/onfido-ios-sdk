// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Onfido",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        
        .library(
            name: "Onfido",
            targets: ["Onfido"]),
        
    ],
    targets: [
        
            .binaryTarget(
                name: "Onfido",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v35.0.0.zip",
                checksum: "070b11645bc04d2eaba78afd2a7717fde0343eb1dc7d47e6c3c5aac37d2c03de"
            ),
        

        
    ]
)
