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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.2.1.zip",
                checksum: "fc01bf81769b69e69b405e349c50f73d18a257ad7490d32b70740c4010779d4e"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v29.2.1.zip",
                checksum: "7f62c59da6c99eebbf19c4c3388ddb5e65152973d3a1b490d4e8883ac6bdd3c7"
            ),
        

        
    ]
)
