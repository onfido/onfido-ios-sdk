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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v32.6.3.zip",
                checksum: "8e6f5c2c9fecc431beca81333013faff5e4ea7a647f434dcfda092192e8ce5aa"
            ),
        

        
    ]
)
