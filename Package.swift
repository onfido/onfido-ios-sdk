// swift-tools-version:5.3
import PackageDescription

let package = Package(
    name: "Onfido",
    platforms: [
        .iOS(.v13)
    ],
    products: [
        
        .library(
            name: "Onfido",
            targets: ["Onfido"]),
        
    ],
    targets: [
        
            .binaryTarget(
                name: "Onfido",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v33.1.4.zip",
                checksum: "7e0b38fd313d41d0449bfc0c7e5e026957c20686f36a836dd3e5cb8b25a0cb33"
            ),
        

        
    ]
)
