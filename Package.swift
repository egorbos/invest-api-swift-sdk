// swift-tools-version: 5.5
import PackageDescription

let package = Package(
    name: "invest-api-swift-sdk",
    platforms: [
        .macOS(.v10_15),
        .iOS(.v13),
        .tvOS(.v13),
        .watchOS(.v6)
    ],
    products: [
        .library(
            name: "InvestApiSwiftSdk",
            targets: ["InvestApiSwiftSdk"]
        ),
    ],
    dependencies: [
        .package(url: "https://github.com/grpc/grpc-swift.git", from: "1.19.0"),
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
