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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v29.4.0.zip",
                checksum: "bf3bda8fa2eadcab8d8ad2de293d101a400ae1d0f542d40eac25d76a7eab1406"
            ),
        

        
    ]
)
