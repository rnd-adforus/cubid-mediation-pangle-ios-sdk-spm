// swift-tools-version:5.9
import PackageDescription

let versionInfo = "1.6.2"

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
        .package(url: "https://github.com/bytedance/AdsGlobalPackage.git", "7.9.0-release.6"..<"8.1.1-release.1"),
        .package(url: "https://github.com/googleads/googleads-mobile-ios-mediation-pangle.git", "7.9.800"..<"8.2.00300"),
    
    ],
    targets: [
        .binaryTarget(
            name: "UPanKit",
            url: "https://nexus.adforus.com/repository/cubid_iOS/UPan/\(versionInfo)/UPanKit-SPM.zip",
            checksum: "2188f59fd877938f16546835912cde4ee3b3b712b3215a549bc3068ed176bbdd"
        ),
        .target(
            name: "UPanKitTarget",
            dependencies: [
                .target(name: "UPanKit"),
                .product(name: "AdsGlobalPackage", package: "AdsGlobalPackage"),
            ],
            path: "UPanKitTarget/Core"
        ),
        .target(name: "UPanKitAdapter",
            dependencies: [
                .target(name: "UPanKit"),
                .product(name: "PangleAdapterTarget", package: "googleads-mobile-ios-mediation-pangle")
            ],
            path: "UPanKitTarget/Adapters"
       ),
        .target(
            name: "UPanKitResources",
            path: "Sources/UPanKitResources",
            resources: [
                .copy("UPanResources.bundle")
            ]
        ),
    ]
)
