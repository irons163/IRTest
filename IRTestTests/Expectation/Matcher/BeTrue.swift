//
//  BeTrue.swift
//  IRTestTests
//
//  Created by Phil Chang on 2023/7/20.
//  Copyright © 2023 . All rights reserved.
//        

import Foundation

class BeTrue: Matcher {
    override func failureMessage(_ actual: Any) -> String {
        return "expected \(actual) to be true"
    }

    override func negativeFailureMessage(_ actual: Any) -> String {
        return "expected \(actual) to be false"
    }

    override func match<T: Equatable>(_ actual: T) -> Bool {
        guard let expected = expected as? T else {
            return false
        }
        return actual == expected
    }
}

extension Expectation {
    func beTrue() {
        evaluate(BeTrue(true))
    }
}

extension AsynchronousExpectation {
    func beTrue() {
        evaluate(BeTrue(true))
    }
}
