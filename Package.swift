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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.8.0.zip",
                checksum: "72040b810eba10024cb8203181f31e793bf29d6408e97db92a52b3f0b11a976c"
            ),
        

        
    ]
)
