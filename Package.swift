import PackageDescription

let package = Package(
    name: "TCPSSL",
    dependencies: [
        .Package(url: "https://github.com/VeniceX/TCP.git", majorVersion: 0, minor: 8),
        .Package(url: "https://github.com/iachievedit/OpenSSL", majorVersion: 0, minor:9),
    ]
)
