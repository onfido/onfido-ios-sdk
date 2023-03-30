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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v28.2.0.zip",
                checksum: "7b2803122088aacf430180de6a17edda6e1e10e3d2d121323c6f2e579c91fee6"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v28.2.0.zip",
                checksum: "c8c4b2fd4ab579ce7a6bccc44c02cbf96c1fc5ba9ea4c844afc3595ac56747d7"
            ),
        

        
    ]
)
