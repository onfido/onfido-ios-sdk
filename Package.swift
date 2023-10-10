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
            targets: ["Onfido"]),
        
    ],
    targets: [
        
            .binaryTarget(
                name: "Onfido",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.5.1.zip",
                checksum: "da8afa2ef2659b5ac08714ae8600166a08c723711a118789eb7d2d28c72f9cb4"
            ),
        

        
    ]
)
