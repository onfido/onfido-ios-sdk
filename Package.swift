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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v32.8.0.zip",
                checksum: "ac5ab2d6226a3470ac9358a222da8407e11e06d8e14c5eebb620bec71d21b82b"
            ),
        

        
    ]
)
