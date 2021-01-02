// swift-tools-version:5.3

import PackageDescription

let package = Package(
    name: "GtkListViewDemo",
    dependencies: [
        .package(name: "Gtk", url: "https://github.com/rhx/SwiftGtk.git", .branch("gtk4")),
    ],
    targets: [
        .target(name: "GtkListViewDemo", dependencies: ["Gtk"]),
    ]
)
