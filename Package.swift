// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
    name: "JSONBenchmarker",
    platforms: [.macOS(.v13)],
    products: [
        .library(
            name: "JSONBenchmarker",
            targets: ["JSONBenchmarker"]),
    ],
    dependencies: [
        .package(url: "https://github.com/GraphQLSwift/GraphQL", from: "2.5.1"),
        .package(url: "https://github.com/ordo-one/package-benchmark", from: "1.7.0"),
        .package(url: "https://github.com/orlandos-nl/IkigaJSON", from: "2.1.8"),
        .package(url: "https://github.com/swift-extras/swift-extras-json", from: "0.6.0"),
    ],
    targets: [
        .target(
            name: "JSONBenchmarker",
            dependencies: [])
    ]
)

// Benchmark of JSONBenchmarks
package.targets += [
    .executableTarget(
        name: "JSONBenchmarks",
        dependencies: [
            .product(name: "Benchmark", package: "package-benchmark"),
            .product(name: "GraphQL", package: "GraphQL"),
            .product(name: "IkigaJSON", package: "IkigaJSON"),
            .product(name: "ExtrasJSON", package: "swift-extras-json"),
        ],
        path: "Benchmarks/JSONBenchmarks",
        plugins: [
            .plugin(name: "BenchmarkPlugin", package: "package-benchmark")
        ]
    ),
]
