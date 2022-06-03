//
//  Collection+FlatMap.swift
//  10Spot
//
//  Created by Benjamin W Maer on 8/30/21.
//

import Foundation

extension Collection {
    @inlinable public func flatMap<T>() -> [T] where Element == Array<T> { flatMap { $0 } }
}
