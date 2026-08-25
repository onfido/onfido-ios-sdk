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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v33.2.0.zip",
                checksum: "c6e353ff672006c41794a9d155cfb6d46fe8b57b72df6a3562ec93adddf6ef4a"
            ),
        

        
    ]
)
