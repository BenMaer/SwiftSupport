//
//  Integer+Mod-Tests.swift
//  10SpotTests
//
//  Created by Benjamin Maer on 5/31/22.
//

import XCTest

@testable import _10Spot

class Integer_Mod_Tests: XCTestCase {
    
    func testMod() {
        struct Test {
            let start: Int
            let modulus: Int
            let expectedResult: Int
        }
        
        let tests: [Test] = [
            /// Positive values
            .init(start: 0, modulus: 4, expectedResult: 0),
            .init(start: 1, modulus: 4, expectedResult: 1),
            .init(start: 2, modulus: 4, expectedResult: 2),
            .init(start: 3, modulus: 4, expectedResult: 3),
            .init(start: 4, modulus: 4, expectedResult: 0),
            .init(start: 5, modulus: 4, expectedResult: 1),
            .init(start: 10, modulus: 4, expectedResult: 2),
            
            /// Positive values
            .init(start: -1, modulus: 4, expectedResult: 3),
            .init(start: -2, modulus: 4, expectedResult: 2),
            .init(start: -3, modulus: 4, expectedResult: 1),
            .init(start: -4, modulus: 4, expectedResult: 0),
            .init(start: -5, modulus: 4, expectedResult: 3),
            .init(start: -6, modulus: 4, expectedResult: 2),
            .init(start: -7, modulus: 4, expectedResult: 1),
        ]
        
        for test in tests {
            let result = test.start.mod(test.modulus)
            XCTAssert(result == test.expectedResult,"""
                start: `\(test.start)`
                modulus: `\(test.modulus)`
                should be `\(test.expectedResult)`,
                instead got `\(result)
                """
            )
        }
    }
}
