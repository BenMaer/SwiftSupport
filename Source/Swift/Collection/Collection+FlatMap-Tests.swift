//
//  Collection+FlatMap-Tests.swift
//  10SpotTests
//
//  Created by Benjamin W Maer on 8/30/21.
//

import XCTest

@testable import _10Spot

class Collection_FlatMap_Tests: XCTestCase {
    func testArray() {
        let array: [[Int]] = [[1, 2], [3]]
        XCTAssert(array.flatMap() == [1, 2, 3], "Should be equal")
        XCTAssert(array.flatMap() == array.flatMap({$0}), "Should be the same as the native method.")
    }
}
