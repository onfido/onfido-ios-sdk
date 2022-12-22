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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v27.2.0.zip",
                checksum: "1c0383f4d61209ef248620f5647156f498832927feb0859debcb6aa274e05c22"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v27.2.0.zip",
                checksum: "8cc1c2a366817896985aa702fe190337576bfde8b55a3b4fd1f941b84d5e4c58"
            ),
        

        
    ]
)
