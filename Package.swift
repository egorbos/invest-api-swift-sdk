// swift-tools-version: 5.6
import PackageDescription

let package = Package(
    name: "InvestApiSwiftSdk",
    platforms: [
        .macOS(.v10_15)
    ],
    products: [
        .library(
            name: "InvestApiSwiftSdk",
            targets: ["InvestApiSwiftSdk"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.8.0"),
    ],
    targets: [
        .target(
            name: "InvestApiSwiftSdk",
            dependencies: [
                .product(name: "GRPC", package: "grpc-swift"),
            ]
        ),
        .testTarget(
            name: "InvestApiSwiftSdkTests",
            dependencies: ["InvestApiSwiftSdk"]),
    ]
)
