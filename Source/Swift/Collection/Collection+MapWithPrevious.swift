//
//  Collection+MapWithPrevious.swift
//  10Spot
//
//  Created by Benjamin W Maer on 4/29/22.
//

import Foundation

#warning("Dev: Add unit tests")
extension Collection {
    typealias MapWithPrevious = (element: Element, previous: Element?)
    func mapWithPrevious<T>(_ transform: (MapWithPrevious) throws -> T) rethrows -> [T] {
        var previous: Element? = nil
        return try map { element in
            let result = try transform((element, previous))
            previous = element
            return result
        }
    }
}
