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
        
        .library(
            name: "OnfidoExtended",
            targets: ["OnfidoExtended"]),
        
    ],
    targets: [
        
            .binaryTarget(
                name: "Onfido",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v28.1.0.zip",
                checksum: "1523feaa3c0be33f84c876891759b6d9e8e7c63e13a16491818675a5a0a2ef16"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v28.1.0.zip",
                checksum: "5449a3da28aeb4b8e713d596169e0304e3bd9ae61a6cfbbb6e4ee6bd2893e7a9"
            ),
        

        
    ]
)
