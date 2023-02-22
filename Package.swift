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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v28.0.0.zip",
                checksum: "867057f74b1badf74fce20df2fdffd9f2f4393d143f758e2b6d01056dbbce4be"
            ),
        
            .binaryTarget(
                name: "OnfidoExtended",
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/OnfidoExtended-v28.0.0.zip",
                checksum: "303e31505dc43fa797a79a5742e4bd455138ba1e7c98cf52f7ae3ac9195ab111"
            ),
        

        
    ]
)
