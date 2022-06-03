//
//  Array+Safe.swift
//  10Spot
//
//  Created by Benjamin W Maer on 10/15/21.
//

import Foundation

extension Array {
    typealias MyIndex = Array<Element>.Index
    subscript(safe index: MyIndex) -> Element? {
        guard isValid(index: index) else { return nil }
        return self[index]
    }
    
    func isValid(index: MyIndex) -> Bool {
        return 0 <= index && index < count
    }
}
