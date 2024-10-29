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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v32.0.0.zip",
                checksum: "0355c85bcb0f6c8a3fc3ed37cdb93bb9f3cdc42d874972ff7e56ad885c95ca66"
            ),
        

        
    ]
)
