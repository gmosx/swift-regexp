import XCTest
@testable import RegExp

final class RegExpTests: XCTestCase {
    func testMatches() {
        let text = "We are big now #1#**lot of sales#/1#* the money and cards #2#Rober Langdon and Ambra Vidal#/2#**."
        let re = RegExp("(#/{0,1}\\d{1,}#\\*{0,2})")
        let allMatches = re.matches(in: text)
        
        XCTAssertEqual(allMatches.count, 4)
        XCTAssertEqual(allMatches[0].value, "#1#**")
        XCTAssertEqual(allMatches[3].value, "#/2#**")
    }

    func testReplace() {
        let text = "bad wolf, bad dog, Bad sheep"
        let re = RegExp("\\b([bB]ad)\\b")
        let replaced = re.replace(in: text) { match in
            return "[\(match.value.lowercased())]"
        }

        XCTAssertEqual(replaced, "[bad] wolf, [bad] dog, [bad] sheep")
    }

    static var allTests = [
        ("testMatches", testMatches),
        ("testReplace", testReplace),
    ]
}
