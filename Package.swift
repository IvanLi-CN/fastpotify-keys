// swift-tools-version: 6.0

import PackageDescription

let strictSwift6: [SwiftSetting] = [
    .swiftLanguageMode(.v6)
]

let package = Package(
    name: "FastpotifyKeys",
    platforms: [
        .macOS(.v13)
    ],
    products: [
        .library(
            name: "FastpotifyKeysCore",
            targets: ["FastpotifyKeysCore"]
        ),
        .executable(
            name: "FastpotifyKeys",
            targets: ["FastpotifyKeys"]
        )
    ],
    targets: [
        .target(
            name: "FastpotifyKeysCore",
            path: "Sources/FastpotifyKeysCore",
            swiftSettings: strictSwift6
        ),
        .executableTarget(
            name: "FastpotifyKeys",
            dependencies: ["FastpotifyKeysCore"],
            path: "Sources/FastpotifyKeys",
            swiftSettings: strictSwift6
        ),
        .testTarget(
            name: "FastpotifyKeysCoreTests",
            dependencies: ["FastpotifyKeysCore"],
            path: "Tests/FastpotifyKeysCoreTests",
            swiftSettings: strictSwift6
        )
    ]
)
