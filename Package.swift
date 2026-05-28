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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v33.1.1.zip",
                checksum: "c3bf8b4bea752871cc7a71c26c45ad15254120f1179ade2c4bda9e923859e74a"
            ),
        

        
    ]
)
