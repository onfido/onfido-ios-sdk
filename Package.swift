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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v30.6.3.zip",
                checksum: "b3d036aae8638a2bfbdb98e9137cae9a4d9d5f1b39b42f678dfdde6144855446"
            ),
        

        
    ]
)
