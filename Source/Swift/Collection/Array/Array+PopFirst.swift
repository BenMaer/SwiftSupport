//
//  Array+PopFirst.swift
//  10Spot
//
//  Created by Benjamin W Maer on 8/30/21.
//

import Foundation

extension Array {
    /// Removes the first item from the array, and returns that item.
    mutating func popFirst() -> Element? {
        if isEmpty == false { return removeFirst() }
        return nil
    }
    
    /// Convenience for avoiding mutatinc func. Returns (popped element, [remaining elements]).
    var poppedFirst: (Element, [Element])? {
        var array = self
        guard let first = array.popFirst() else { return nil }
        return (first, array)
    }
}

extension Array where Element: Equatable {
    mutating func popFirst(if element: Element) -> Element? {
        if first == element { return removeFirst() }
        return nil
    }
    
    func poppedFirst(if element: Element) -> (Element, [Element])? {
        var array = self
        guard let popped = array.popFirst(if: element) else { return nil }
        return (popped, array)
    }
}
