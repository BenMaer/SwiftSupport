//
//  Bool+AssertedValue.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/15/21.
//

import Foundation

extension Bool {
    @inlinable func assertedValue(message: String, expected: Bool = true) -> Self {
        assert(self == expected, message)
        return self
    }
}
