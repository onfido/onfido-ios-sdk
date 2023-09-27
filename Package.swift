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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.5.0.zip",
                checksum: "21b8c0a904711c7e2ad2baed9ce4b84a4d501d3a1e7f2e6566874d7466604d9b"
            ),
        

        
    ]
)
