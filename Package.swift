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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.2.0.zip",
                checksum: "968cb59540cd468201a7e8447f9f888cc6970d63789c274cdc8e2a3934f6d805"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v29.2.0.zip",
                checksum: "d3e8ad17d1799b2a1126e016ce5ab813d3ede4185114245451b3a3e80b27ab8f"
            ),
        

        
    ]
)
