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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v27.3.0.zip",
                checksum: "01dddc4cf77b8fe89f6591f427230454e1defb99d1546cfa60650c3d5a5f5b90"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v27.3.0.zip",
                checksum: "12ff7df4c88e4fe8ad8c47752d32ffd2f19c370a7970d09830c444b6f975186e"
            ),
        

        
    ]
)
