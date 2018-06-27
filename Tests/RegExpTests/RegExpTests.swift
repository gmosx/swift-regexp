import XCTest
@testable import RegExp

final class RegExpTests: XCTestCase {
    func testMatches() {
        let re = RegExp("(#/{0,1}\\d{1,}#\\*{0,2})")
        let text = "We are big now #1#**lot of sales#/1#* the money and cards #2#Rober Langdon and Ambra Vidal#/2#**."
        print(re.matches(in: text).map { $0.value })
    }

    static var allTests = [
        ("testMatches", testMatches),
    ]
}
