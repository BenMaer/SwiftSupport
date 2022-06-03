//
//  Collection+FlatMapWithPrevious.swift
//  10Spot
//
//  Created by Benjamin W Maer on 4/29/22.
//

import Foundation

#warning("Dev: Add unit tests")
extension Collection {
    typealias FlatMapWithPrevious = (element: Element, previous: Element?)
    func flatMapWithPrevious<SegmentOfResult>(_ transform: (FlatMapWithPrevious) throws -> SegmentOfResult) rethrows -> [SegmentOfResult.Element] where SegmentOfResult : Sequence {
        var previous: Element? = nil
        return try flatMap { element -> SegmentOfResult in
            let result = try transform((element, previous))
            previous = element
            return result
        }
    }
}
