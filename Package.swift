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
        
        .library(
            name: "OnfidoExtended",
            targets: ["OnfidoExtended"]),
        
    ],
    targets: [
        
            .binaryTarget(
                name: "Onfido",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v28.0.1.zip",
                checksum: "ea64eb021894147f3c5ecf1a7c6d2910bcc92d8c77dd1e3fd7c8f7db1e23022e"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v28.0.1.zip",
                checksum: "0c475c099515a109910e9744e5f3a90baf060a368ba7479c2e4a2ab6647d65a9"
            ),
        

        
    ]
)
