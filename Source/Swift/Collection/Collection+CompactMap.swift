//
//  Collection+CompactMap.swift
//  10Spot
//
//  Created by Benjamin W Maer on 8/30/21.
//

import Foundation

extension Collection {
    @inlinable public func compactMap<T>() -> [T] where Element == Optional<T> { compactMap { $0 } }
}
