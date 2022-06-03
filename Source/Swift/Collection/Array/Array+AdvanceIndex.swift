//
//  Array+AdvanceIndex.swift
//  10Spot
//
//  Created by Benjamin Maer on 5/30/22.
//

import Foundation

enum AdvanceIndex {
    enum Direction {
        case previous, next
    }
}

extension Array {
    func advancedIndex(index: Index?, offset: Index = 1, direction: AdvanceIndex.Direction, circular: Bool = false) -> Index? {
        guard case let .advancedIndex(advancedIndex) = advancedIndexResult(index: index, offset: offset, direction: direction, circular: circular) else { return nil }
        return advancedIndex
    }
    
    enum Result: Equatable {
        case nilIndex, indexOutOfBounds, advancedIndexOutOfBounds, advancedIndex(Index)
    }
    func advancedIndexResult(index: Index?, offset: Index = 1, direction: AdvanceIndex.Direction, circular: Bool = false) -> Result {
        guard let index = index else { return Result.nilIndex }
        guard isValid(index: index) else { return Result.indexOutOfBounds }
        
        let advancedIndex: Index = {
            let offsetIndex: Index = {
                switch direction {
                case .previous: return index - offset
                case .next:     return index + offset
                }
            }()
            if circular { return offsetIndex.mod(count) }
            return offsetIndex
        }()
        
        guard isValid(index: advancedIndex) else { return Result.advancedIndexOutOfBounds }
        return Result.advancedIndex(advancedIndex)
    }
}
