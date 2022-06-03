//
//  Collection+Safe.swift
//  10Spot
//
//  Created by Benjamin W Maer on 9/21/21.
//

import Foundation

extension Swift.Collection {
    subscript (safe index: Index) -> Element? {
        return indices.contains(index) ? self[index] : nil
    }
}
