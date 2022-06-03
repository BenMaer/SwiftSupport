//
//  Array+PopLast.swift
//  10Spot
//
//  Created by Benjamin W Maer on 2/15/22.
//

import Foundation

extension Array {
    /// Convenience for avoiding mutatinc func. Returns (popped element, [remaining elements]).
    var poppedLast: (last: Element, remaining: [Element])? {
        var array = self
        guard let last = array.popLast() else { return nil }
        return (last, array)
    }
}
