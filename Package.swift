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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v33.0.1.zip",
                checksum: "094002c460aff33098acaf9074c1c17d14a9fbed8616d0d177f87ac90b3a4bd3"
            ),
        

        
    ]
)
