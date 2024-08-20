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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v30.5.0.zip",
                checksum: "0f3daadd08a5f93ea0db59bfdd953b4a3419e7fd32c0109ef0b38da107fa3e8b"
            ),
        

        
    ]
)
