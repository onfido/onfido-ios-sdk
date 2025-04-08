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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v32.4.2.zip",
                checksum: "ec7c2c54fb2f3264f6593bbabdbfd9be376e90a84fac5a41e0156cfd6866f6bc"
            ),
        

        
    ]
)
