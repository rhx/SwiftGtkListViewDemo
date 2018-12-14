// swift-tools-version:4.0

import PackageDescription

let package = Package(
    name: "GtkListViewDemo",
    dependencies: [
        .package(url: "https://github.com/rhx/SwiftGtk.git", .branch("master")),
    ],
    targets: [
        .target(name: "GtkListViewDemo", dependencies: ["Gtk"]),
    ]
)
