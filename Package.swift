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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v28.1.1.zip",
                checksum: "95b90c73aa9d9fd9218ba54ef8a4224b37e43db658f80267a3739c70c56d8e42"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v28.1.1.zip",
                checksum: "c36f477dba8683047add3f2233dc81fb05de887182710e52b9795195ac9baed4"
            ),
        

        
    ]
)
