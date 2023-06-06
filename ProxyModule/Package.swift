// swift-tools-version: 5.8
// The swift-tools-version declares the minimum version of Swift required to build this package.

import PackageDescription

let package = Package(
  name: "ProxyModule",
  products: [
    .library(
      name: "ProxyModule",
      targets: ["ProxyModule"]),
  ],
  dependencies: [
    .package(url: "https://github.com/uber/RIBs.git", from: "0.13.2"),
  ],
  targets: [
    .target(
      name: "ProxyModule",
      dependencies: [
        "RIBs"
      ]),
    .testTarget(
      name: "ProxyModuleTests",
      dependencies: ["ProxyModule"]),
  ]
)
