// swift-tools-version:5.6

import PackageDescription

let package = Package(
    name: "GtkListViewDemo",
    dependencies: [
        .package(url: "https://github.com/rhx/SwiftGtk.git", branch: "monorepo-development"),
    ],
    targets: [
        .executableTarget(name: "GtkListViewDemo", dependencies: [
            .product(name: "Gtk", package: "SwiftGtk"),
        ]),
    ]
)
