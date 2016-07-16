import XCTest
@testable import TCPSSL

class TCPSSLTests: XCTestCase {
    func testReceive() {
        do {
        let server = "api.github.com"
        let httpRequest:Data = "GET /zewo/repos HTTP/1.1\r\nHost: api.github.com\r\nUser-Agent: venicex/0.8.0\r\nAccept: */*\r\n\r\n"
        let secureConn = try TCPSSLConnection(host:server, port:443)
        try secureConn.open()
        try secureConn.send(httpRequest, timingOut:.never)
        let httpData = try secureConn.receive(upTo:4, timingOut:.never)
        XCTAssert(httpData.count == 4,  "Expected 4 bytes, received \(httpData.count)")
        } catch {
            print(error)
        }
    }

    func testReality() {
        XCTAssert(2 + 2 == 4, "Something is severely wrong here.")
    }
}

extension TCPSSLTests {
    static var allTests : [(String, (TCPSSLTests) -> () throws -> Void)] {
        return [
            ("testReceive", testReceive),
            ("testReality", testReality),
        ]
    }
}
