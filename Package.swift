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
        
    ],
    targets: [
        
            .binaryTarget(
                name: "Onfido",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v30.0.0.zip",
                checksum: "6a4f9f6ea755bb8c66aecd2835fc61458fcf2c363bfcad4d313ad61f05b807de"
            ),
        

        
    ]
)
