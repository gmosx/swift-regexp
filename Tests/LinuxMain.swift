import XCTest

import RegExpTests

var tests = [XCTestCaseEntry]()
tests += RegExpTests.allTests()
XCTMain(tests)