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

    func testIsMatching() {
        let text = "We are big now #1#**lot of sales#/1#* the money and cards #2#Rober Langdon and Ambra Vidal#/2#**."
        let re = RegExp("(#/{0,1}\\d{1,}#\\*{0,2})")
        
        XCTAssertTrue(text =~ re)
        
        let nonMatchingText = "I do not match"
        
        XCTAssertTrue(nonMatchingText !~ re)
        XCTAssertFalse(nonMatchingText =~ re)
    }

    static var allTests = [
        ("testReplacingPattern", testReplacingPattern),
    ]
}
