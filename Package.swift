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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v30.3.1.zip",
                checksum: "82c4bd95495a39d81908b6ce8b57cac8b4c68d7f31dc8d7fdacfe8a34e7b84dc"
            ),
        

        
    ]
)
