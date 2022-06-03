//
//  Collection+ForEachAndPrevious.swift
//  10Spot
//
//  Created by Benjamin W Maer on 4/29/22.
//

import Foundation

extension Collection {
    typealias EachAndPrevious = (previous: Element, element: Element)
    /// Iterates n-1 times, where n is the number of items in the array.
    /// First iteration will pass through (array[0], array[1]), second (array[!], array[2]), so forth and so on.
    func forEachAndPrevious(_ body: (EachAndPrevious) throws -> Void) rethrows {
        forAllEachAndPrevious { (previous, element) in
            guard let previous = previous else { return }
            do {
                try body((previous, element))
            } catch {
                assertionFailure("failed for each with error: \(error)")
            }
        }
    }
    
    typealias AllEachAndPrevious = (previous: Element?, element: Element)
    /// Iterates n times, where n is the number of items in the array.
    /// First iteration will pass through (nil, array[0]), second (array[0], array[1]), so forth and so on.
    func forAllEachAndPrevious(_ body: (AllEachAndPrevious) throws -> Void) rethrows {
        var previous: Element? = nil
        forEach { element in
            do {
                try body((previous, element))
            } catch {
                assertionFailure("failed for each with error: \(error)")
            }
            previous = element
        }
    }
}
