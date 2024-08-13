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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v30.4.1.zip",
                checksum: "a1c4117b319b9f6870f340bbe99a8330102ceb528b512e824155b19cc3bfd4f9"
            ),
        

        
    ]
)
