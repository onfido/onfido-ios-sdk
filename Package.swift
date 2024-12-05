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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v30.6.2.zip",
                checksum: "4eecaaa89ddce03653afcafc2ebf90be0b46fafbeaa9ffe5f25331592d408d0a"
            ),
        

        
    ]
)
