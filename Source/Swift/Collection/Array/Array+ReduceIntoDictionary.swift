//
//  Array+ReduceIntoDictionary.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/15/21.
//

import Foundation

extension Array {
    @inlinable public func reduce<Key: Hashable, Value>(_ updateAccumulatingResult: (inout Dictionary<Key,Value>, Element) throws -> ()) rethrows -> Dictionary<Key,Value> {
        return try reduce(into: [:], updateAccumulatingResult)
    }
}

extension Array where Element: Hashable {
    @inlinable public func reduce<Value>(_ result: (Element) throws -> (Value)) rethrows -> Dictionary<Element,Value> {
        return try reduce({ $0[$1] = try result($1) })
    }
}
