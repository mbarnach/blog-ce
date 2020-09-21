// swift-tools-version:5.3
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "blog",
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        .package(url: "https://github.com/Kitura/Kitura", from: "2.9.1"),
        .package(name: "KituraMarkdown", url: "https://github.com/IBM-Swift/Kitura-Markdown", from: "1.1.2"),
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "blog",
            dependencies: [
                "Kitura",
                "KituraMarkdown",
            ]),
        .testTarget(
            name: "blogTests",
            dependencies: ["blog"]),
    ]
)
