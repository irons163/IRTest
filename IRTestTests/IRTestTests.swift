//
//  IRTestTests.swift
//  IRTestTests
//
//  Created by Phil Chang on 2023/7/14.
//  Copyright © 2023 . All rights reserved.
//

import XCTest
@testable import IRTest

final class IRTestTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}

class MatchTest:XCTestCase {
    func testMatchPositive() {
//        expect("11:14").to(_ match("\\d{2}:\\d{2}"))
        expect("11:14").to.evaluate(RegularExpression("\\d{2}:\\d{2}"))
    }

    func testMatchNegative() {
//        expect("hello").toNot(match("\\d{2}:\\d{2}"))
        expect("hello").toNot.evaluate(RegularExpression("\\d{2}:\\d{2}"))
    }

    func testMatchPositiveMessage() {
        let message = "expected to match <\\d{2}:\\d{2}>, got <hello>"
//        failsWithErrorMessage(message) {
//            expect("hello").to(match("\\d{2}:\\d{2}"))
//        }
//        failsWithErrorMessage(message) {
            expect("hello").to.evaluate(RegularExpression("\\d{2}:\\d{2}")) { failureMessage in
                print("failed, but somewhat want to testing")
            }
//        }
    }

    func testMatchNegativeMessage() {
        let message = "expected to not match <\\d{2}:\\d{2}>, got <11:14>"
//        failsWithErrorMessage(message) {
//            expect("11:14").toNot(match("\\d{2}:\\d{2}"))
//        }
        expect("11:14")
            .toNot.evaluate(RegularExpression("\\d{2}:\\d{2}")) { failureMessage in
                print("failed, but somewhat want to testing")
            }
    }

    func testMatchNils() {
//        failsWithErrorMessageForNil("expected to match <\\d{2}:\\d{2}>, got <nil>") {
//            expect(nil as String?).to(match("\\d{2}:\\d{2}"))
//        }
//
//        failsWithErrorMessageForNil("expected to not match <\\d{2}:\\d{2}>, got <nil>") {
//            expect(nil as String?).toNot(match("\\d{2}:\\d{2}"))
//        }
        expect(nil as String?).to.evaluate(RegularExpression("\\d{2}:\\d{2}")) { failureMessage in
            print("failed, but somewhat want to testing")
        }
        expect(nil as String?).toNot.evaluate(RegularExpression("\\d{2}:\\d{2}"))
    }
}

