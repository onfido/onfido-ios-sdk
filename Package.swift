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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v27.3.1.zip",
                checksum: "a4feb44c906eaeff05e0c5e7dc93c58d88744e3c92a52bb0c54628204642431f"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v27.3.1.zip",
                checksum: "23f970eb9cb9790a8e1b09b29659a4d0c649d531b3906d0157cd2f1fc5b2e3b3"
            ),
        

        
    ]
)
