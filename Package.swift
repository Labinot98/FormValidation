// swift-tools-version: 5.7
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "FormValidation",
    platforms: [
        .iOS(.v15)
    ],
    products: [
        .library(
            name: "FormValidation",
            targets: ["FormValidation"]),
    ],
    
    dependencies: [],
    targets: [
        .target(
            name: "FormValidation",
            dependencies: [])
    ]
)
