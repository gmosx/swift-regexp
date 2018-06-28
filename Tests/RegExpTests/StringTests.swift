import XCTest
@testable import RegExp

class StringTests: XCTestCase {
    func testReplacingPattern() {
        let text = "bad wolf, bad dog, Bad sheep"

        let replaced = text.replacing(pattern: RegExp("\\b([bB]ad)\\b")) { match in
            return "[\(match.value.lowercased())]"
        }

        XCTAssertEqual(replaced, "[bad] wolf, [bad] dog, [bad] sheep")
    }

    static var allTests = [
        ("testReplacingPattern", testReplacingPattern),
    ]
}
