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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v27.1.0.zip",
                checksum: "cdbf0102d00386aed61eade67a00071ed7b3748d665bb2156d5979ed7c1ce062"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v27.1.0.zip",
                checksum: "ee47c0e96898f087b5ad97b19df155b881213b301d2277ef5a63b5c0892e7764"
            ),
        

        
    ]
)
