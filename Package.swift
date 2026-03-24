// swift-tools-version:5.9
import PackageDescription

let versionInfo = "0.0.0"

let package = Package(
    name: "UPanKit",
    platforms: [
        .iOS(.v14) 
    ],
    products: [
        .library(
            name: "UPanKit",
            targets: ["UPanKit"]
        ),
        .library(
            name: "Admob-Mediation-Pangle",
            targets: ["UPanKitAdapter"]
        )
    ],
    dependencies: [
        .package(url: "https://github.com/bytedance/AdsGlobalPackage.git", exact: "7.9.0-release.6"),
        .package(url: "https://github.com/googleads/googleads-mobile-ios-mediation-pangle.git", exact: "7.9.600"),
    ],
    targets: [
        .binaryTarget(
            name: "UPanKit",
            url: "https://nexus.adforus.com/repository/cubid_iOS/UPan/\(versionInfo)/UPanKit.xcframework.zip",
            checksum: "b18fed912872dbfe38a8e56255e54435998a2c7927b2079b432ad02e6bd84d1c"
        ),
        .target(name: "UPanKitAdapter",
            dependencies: [
                .target(name: "UPanKit"),
                .product(name: "PangleAdapterTarget", package: "googleads-mobile-ios-mediation-pangle")
            ],
            path: "UPanKitTarget/Adapters"
       ),
    ]
)
