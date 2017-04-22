// swift-tools-version:3.1

import PackageDescription

let package = Package(
    name: "GtkListViewDemo",
    dependencies: [
        .Package(url: "https://github.com/rhx/SwiftGtk.git", majorVersion: 3)
    ]
)
