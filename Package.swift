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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v27.4.0.zip",
                checksum: "e7ccd999ea77f3e7eb5c089bec35ad0a770aba9f247a5ad404e3b1bf78fe3647"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v27.4.0.zip",
                checksum: "6d7e6c585e16c0775742565dbc0caf8066ed23ac40fbd5f1787a9ead545925b3"
            ),
        

        
    ]
)
