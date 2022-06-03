//
//  Collection+CompactMap-Tests.swift
//  10SpotTests
//
//  Created by Benjamin W Maer on 8/30/21.
//

import XCTest

@testable import _10Spot

class Collection_CompactMap_Tests: XCTestCase {
    func testArray() {
        let nonOptionalArray: [Int] = [1, 2]
        var optionalArray: [Int?] = nonOptionalArray
        optionalArray.append(nil)
        XCTAssert(optionalArray.compactMap() == nonOptionalArray, "Should be left with only non-optional values.")
        XCTAssert(optionalArray.compactMap() == optionalArray.compactMap({$0}), "Should be the same as the native method.")
    }
}
