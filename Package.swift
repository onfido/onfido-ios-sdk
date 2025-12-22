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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v32.7.0.zip",
                checksum: "86d9e2cd60a02959377c950256077db6f95fdc2de3eee2ef4be930b9a63c6e95"
            ),
        

        
    ]
)
