//
//  Optional+AssertionMap.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/15/21.
//

import Foundation

extension Optional {
    @inlinable public func assertionMap<U>(message: String, _ transform: (Wrapped) throws -> U) rethrows -> U? {
        let mapped = try map(transform)
        assert(mapped != nil, message)
        return mapped
    }
}
