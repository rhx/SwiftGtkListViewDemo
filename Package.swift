// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "GtkListViewDemo",
    dependencies: [
        .package(url: "https://github.com/rhx/SwiftGtk.git", branch: "gtk4-monorepo"),
    ],
    targets: [
        .target(name: "GtkListViewDemo", dependencies: [
            .product(name: "Gtk", package: "SwiftGtk"),
        ]),
    ]
)
