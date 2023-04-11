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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v28.3.0.zip",
                checksum: "a8a68ddf9af3ca9a39df842ba65b1d819d952203337e73cba7c6906268c5d3e1"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v28.3.0.zip",
                checksum: "e85e0df562150aedbf9fa0a1236d8060a7a47abf75fb51af2f82bdf7ddd0c131"
            ),
        

        
    ]
)
