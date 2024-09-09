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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v30.6.0.zip",
                checksum: "1e10da73a2dcf05f0bcd1099118b09bdbf79c63b5f33edac7d85e6c8176f7ccf"
            ),
        

        
    ]
)
