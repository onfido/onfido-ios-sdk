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
                url: "https://s3-eu-west-1.amazonaws.com/onfido-sdks/ios/Onfido-v33.1.2.zip",
                checksum: "e15e8d810bd2652e7522dbadd052a421dc0b840f965e9bc2930f49cd495b1bbd"
            ),
        

        
    ]
)
