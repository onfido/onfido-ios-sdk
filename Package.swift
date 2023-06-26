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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.1.0.zip",
                checksum: "cf1b1b6a542db624d88bdcaa3f1763082f8c273e4d4b5bdcc1fac64cba48181d"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v29.1.0.zip",
                checksum: "39ba0127c4f40df6dd91fa238b690d57f7867a7d6e5bf411d719eb2d0b139555"
            ),
        

        
    ]
)
