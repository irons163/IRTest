//
//  Contain.swift
//  IRTestTests
//
//  Created by Phil Chang on 2023/7/19.
//  Copyright © 2023 . All rights reserved.
//

import Foundation

class Contain: Matcher {
    override func failureMessage(_ actual: Any) -> String {
        return "expected \(actual) to contain \(expected)"
    }

    override func negativeFailureMessage(_ actual: Any) -> String {
        return "expected \(actual) to contain \(expected)"
    }

    override func match<T: Equatable>(_ actual: T) -> Bool {
        if let array = actual as? NSArray {
            return array.contains(expected)
        } else if let set = actual as? NSSet {
            return set.contains(expected)
        } else {
            return false
        }
    }
}

extension Expectation {
    func contain(_ expected: any Equatable) {
        evaluate(Contain(expected))
    }
}
