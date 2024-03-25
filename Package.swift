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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.8.1.zip",
                checksum: "dd26878d86744a7440d66a588bfe7f2fa7233a7c0c4cc23469ee1a7322b880b1"
            ),
        

        
    ]
)
