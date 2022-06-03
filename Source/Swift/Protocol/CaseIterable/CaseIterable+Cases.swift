//
//  CaseIterable+Cases.swift
//  10Spot
//
//  Created by Benjamin Maer on 5/30/22.
//

import Foundation

extension CaseIterable where Self: Hashable, Self.AllCases.Index: SignedInteger {
    func getCase(offset: Int, direction: AdvanceIndex.Direction = .next, circular: Bool = true) -> Self? {
        
        let allCases = Array(Self.allCases)
        guard let index = allCases.firstIndex(of: self) else {
            assertionFailure("Couldn't find index of self \(self)")
            return nil
        }
        
        guard let advancedIndex = allCases.advancedIndex(index: index, offset: offset, direction: direction, circular: circular) else { return nil }
        
        let offsetCase = allCases[safe: advancedIndex]
        assert(offsetCase != nil, "`offsetCase` should be non-nil.")
        return offsetCase
    }
    
    var next: Self? { getCase(offset: 1, direction: .next, circular: false) }
    var previous: Self? { getCase(offset: 1, direction: .previous, circular: false) }
    
    var circularNext: Self? { getCase(offset: 1, direction: .next, circular: true) }
    var circularPrevious: Self? { getCase(offset: 1, direction: .previous, circular: true) }
}
