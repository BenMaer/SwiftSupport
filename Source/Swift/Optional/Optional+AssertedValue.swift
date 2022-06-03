//
//  Optional+AssertedValue.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/15/21.
//

import Foundation

extension Optional {
    @inlinable func assertedValue(message: String) -> Self {
        assert(self != nil, message)
        return self
    }
}
