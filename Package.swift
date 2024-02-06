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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.7.1.zip",
                checksum: "1916b502601adcde0bc46a65303051ceb4ffcb9f6b0eb97c1eb4990c0a8127a6"
            ),
        

        
    ]
)
