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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v31.0.0.zip",
                checksum: "fa7d5b22c642fc6c19977f86669ac4026fa430bb3ded383dc670275bdd4fc55d"
            ),
        

        
    ]
)
