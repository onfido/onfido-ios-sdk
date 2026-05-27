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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v33.1.0.zip",
                checksum: "ca6219986f4c5013d15963a183aa2f8985983bcdd431c42ee1ba38eb4a52f5e0"
            ),
        

        
    ]
)
