//
//  Collection<Equatable>+AllAre-Tests.swift
//  10SpotTests
//
//  Created by Benjamin W Maer on 8/30/21.
//

import XCTest

@testable import _10Spot

class Collection_Equatable__AllAre_Tests: XCTestCase {
    func testArrays() {
        struct Test<V: Equatable> {
            let values: [V]
            let allAre: V
            let expectedResult: Bool
        }
        
        func run<V>(_ tests: [Test<V>]) {
            for test in tests {
                let allAre = test.values.allAre(test.allAre)
                XCTAssert(allAre == test.expectedResult,
                          """
                            test: \(test)
                            produced allAre: \(allAre)
                            but expected: \(test.expectedResult)
                          """)
            }
        }
        run([
            .init(values: [1, 1, 1, 1], allAre: 1, expectedResult: true),
            .init(values: [1, 1, 1, 1], allAre: 2, expectedResult: false),
            
            .init(values: [2, 2, 2, 2], allAre: 2, expectedResult: true),
            .init(values: [2, 2, 2, 2], allAre: 1, expectedResult: false),

            .init(values: [1, 1, 1, 2], allAre: 1, expectedResult: false),
            .init(values: [1, 1, 1, 2], allAre: 2, expectedResult: false),
        ])
        run([
            .init(values: [true, true, true, true], allAre: true, expectedResult: true),
            .init(values: [false, false, false, false], allAre: false, expectedResult: true),
            .init(values: [false, false, true, true], allAre: false, expectedResult: false),
            .init(values: [false, false, true, true], allAre: true, expectedResult: false),
        ])
    }
}
