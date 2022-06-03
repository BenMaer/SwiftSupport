//
//  Array+AdvanceIndex-Tests.swift
//  10SpotTests
//
//  Created by Benjamin Maer on 5/30/22.
//

import XCTest

@testable import _10Spot

class Test_Array_AdvanceIndex: XCTestCase {
    func testIndexes() {
        let array = [0, 1, 2]
        XCTAssert(array.advancedIndex(index: 0, direction: .next) == 1, "index next of `0` should be `1`")
        XCTAssert(array.advancedIndex(index: 1, direction: .next) == 2, "index next of `1` should be `2`")
        XCTAssert(array.advancedIndex(index: 2, direction: .next) == nil, "index next of `2` should be `nil`")
        
        XCTAssert(array.advancedIndex(index: 0, direction: .previous) == nil, "index previous of `0` should be `nil`")
        XCTAssert(array.advancedIndex(index: 1, direction: .previous) == 0, "index previous of `1` should be `0`")
        XCTAssert(array.advancedIndex(index: 2, direction: .previous) == 1, "index previous of `2` should be `1`")
    }
    
    func testIndexesWithOffset() {
        typealias Element = Int
        let array: Array<Element> = Array(0...10)
        struct Test {
            let index: Array.Index
            let offset: Array.Index
            let direction: AdvanceIndex.Direction
            let expectedResult: Element?
        }
        
        let tests: [Test] = [
            /// Offset next
            .init(index: 0, offset: 2, direction: .next, expectedResult: 2),
            .init(index: 0, offset: 8, direction: .next, expectedResult: 8),
            .init(index: 0, offset: 10, direction: .next, expectedResult: 10),
            .init(index: 3, offset: 4, direction: .next, expectedResult: 7),
            .init(index: 5, offset: 5, direction: .next, expectedResult: 10),
            .init(index: 0, offset: 0, direction: .next, expectedResult: 0),
            
            /// Offset previous
            .init(index: 10, offset: 2, direction: .previous, expectedResult: 8),
            .init(index: 10, offset: 8, direction: .previous, expectedResult: 2),
            .init(index: 10, offset: 10, direction: .previous, expectedResult: 0),
            .init(index: 7, offset: 4, direction: .previous, expectedResult: 3),
            .init(index: 5, offset: 5, direction: .previous, expectedResult: 0),
            .init(index: 10, offset: 0, direction: .previous, expectedResult: 10),
            
            /// Overflow
            .init(index: 10, offset: 1, direction: .next, expectedResult: nil),
            .init(index: 10, offset: 999999, direction: .next, expectedResult: nil),
            .init(index: 0, offset: 1, direction: .previous, expectedResult: nil),
            .init(index: 10, offset: 999999, direction: .previous, expectedResult: nil),
        ]
        
        for test in tests {
            let result = array.advancedIndex(index: test.index, offset: test.offset, direction: test.direction)
            XCTAssert(result == test.expectedResult,"""
                index: `\(test.index)`
                offset: `\(test.offset)`
                direction: `\(test.direction)`
                should be `\(String(describing: test.expectedResult))`,
                instead got `\(String(describing: result))
                """
            )
        }
    }
    
    func testIndexesWithCircular() {
        typealias Element = Int
        let array: Array<Element> = Array(0...10)
        struct Test {
            let index: Array.Index
            let offset: Array.Index
            let direction: AdvanceIndex.Direction
            let expectedResult: Element?
        }
        
        let tests: [Test] = [
            /// Offset next
            .init(index: 10, offset: 1, direction: .next, expectedResult: 0),
            .init(index: 10, offset: 5, direction: .next, expectedResult: 4),
            .init(index: 10, offset: 11, direction: .next, expectedResult: 10),
            .init(index: 10, offset: 13, direction: .next, expectedResult: 1),
            .init(index: 8, offset: 5, direction: .next, expectedResult: 2),
            
            /// Offset previous
            .init(index: 0, offset: 1, direction: .previous, expectedResult: 10),
            .init(index: 0, offset: 5, direction: .previous, expectedResult: 6),
            .init(index: 0, offset: 11, direction: .previous, expectedResult: 0),
            .init(index: 0, offset: 13, direction: .previous, expectedResult: 9),
            .init(index: 2, offset: 5, direction: .previous, expectedResult: 8),
        ]
        
        for test in tests {
            let result = array.advancedIndex(index: test.index, offset: test.offset, direction: test.direction, circular: true)
            XCTAssert(result == test.expectedResult,"""
                index next of `\(test.index)`
                with offset `\(test.offset)`
                and direction `\(test.direction)`
                should be `\(String(describing: test.expectedResult))`,
                instead got `\(String(describing: result))
                """
            )
        }
    }
    
    func testResults() {
        XCTAssert([].advancedIndexResult(index: nil, direction: .next) == .nilIndex, "Passing in a nil index should produce Result `nilIndex`")
        XCTAssert([].advancedIndexResult(index: 0, direction: .next) == .indexOutOfBounds, "Passing in an index out of bounds should produce Result `indexOutOfBounds`")
        XCTAssert([0].advancedIndexResult(index: 0, direction: .next) == .advancedIndexOutOfBounds, "Passing in an index who advances to an index out of bounds should produce Result `advancedIndexOutOfBounds`")
        XCTAssert([0, 1].advancedIndexResult(index: 0, direction: .next) == .advancedIndex(1), "Passing in an index who advances to an index should produce Result `advancedIndex` with the new advanced index")
        XCTAssert([0, 1].advancedIndexResult(index: 1, direction: .previous) == .advancedIndex(0), "Passing in an index who advances to an index should produce Result `advancedIndex` with the new advanced index")
    }
}
