// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "Day-12-Local Server",
    products: [
        // Products define the executables and libraries a package produces, and make them visible to other packages.
        .library(
            name: "Day-12-Local Server",
            targets: ["Day-12-Local Server"]),
    ],
    dependencies: [
        // Dependencies declare other packages that this package depends on.
        // .package(url: /* package url */, from: "1.0.0"),
        
        .package(url: "https://github.com/IBM-Swift/Kitura.git", from: "2.9.1")
    ],
    targets: [
        // Targets are the basic building blocks of a package. A target can define a module or a test suite.
        // Targets can depend on other targets in this package, and on products in packages this package depends on.
        .target(
            name: "Day-12-Local Server",
            dependencies: []),
        .testTarget(
            name: "Day-12-Local ServerTests",
            dependencies: ["Day-12-Local Server"]),
    ]
)
