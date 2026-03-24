// swift-tools-version:5.9
import PackageDescription

let versionInfo = "1.5.0"

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
            url: "https://nexus.adforus.com/repository/cubid_iOS/UPan/\(versionInfo)/UPanKit-SPM.zip",
            checksum: "d226f173fd5a30bcc67370e2c01201812dc088fdfa843b49a092be870295f989"
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
