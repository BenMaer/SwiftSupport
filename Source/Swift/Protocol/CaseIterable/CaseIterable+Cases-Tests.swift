//
//  CaseIterable+Cases-Tests.swift
//  10SpotTests
//
//  Created by Benjamin Maer on 5/31/22.
//

import XCTest

@testable import _10Spot

class CaseIterable_Cases_Tests: XCTestCase {
    func testGetCase() {
        enum TestEnum: CaseIterable {
            case zero, one, two, three, four
        }
        struct Test {
            let start: TestEnum
            let offset: Int
            let circular: Bool
            let direction: AdvanceIndex.Direction
            let expectedResult: TestEnum?
        }
        
        let tests: [Test] = [
            /// Without circular
            .init(start: .zero, offset: 0, circular: false, direction: .next, expectedResult: .zero),
            .init(start: .zero, offset: 1, circular: false, direction: .next, expectedResult: .one),
            .init(start: .zero, offset: 2, circular: false, direction: .next, expectedResult: .two),
            .init(start: .zero, offset: 3, circular: false, direction: .next, expectedResult: .three),
            .init(start: .zero, offset: 4, circular: false, direction: .next, expectedResult: .four),
            .init(start: .zero, offset: 5, circular: false, direction: .next, expectedResult: nil),
            .init(start: .zero, offset: 1, circular: false, direction: .previous, expectedResult: nil),
            
            /// Next with circular
            .init(start: .zero, offset: 5, circular: true, direction: .next, expectedResult: .zero),
            .init(start: .zero, offset: 6, circular: true, direction: .next, expectedResult: .one),
            .init(start: .zero, offset: 7, circular: true, direction: .next, expectedResult: .two),
            .init(start: .zero, offset: 8, circular: true, direction: .next, expectedResult: .three),
            .init(start: .zero, offset: 9, circular: true, direction: .next, expectedResult: .four),
            .init(start: .zero, offset: 10, circular: true, direction: .next, expectedResult: .zero),
            
            /// Previous with circular
            .init(start: .zero, offset: 1, circular: true, direction: .previous, expectedResult: .four),
            .init(start: .zero, offset: 2, circular: true, direction: .previous, expectedResult: .three),
            .init(start: .zero, offset: 3, circular: true, direction: .previous, expectedResult: .two),
            .init(start: .zero, offset: 4, circular: true, direction: .previous, expectedResult: .one),
            .init(start: .zero, offset: 5, circular: true, direction: .previous, expectedResult: .zero),
            .init(start: .zero, offset: 6, circular: true, direction: .previous, expectedResult: .four),
        ]
        
        for test in tests {
            let result = test.start.getCase(offset: test.offset, direction: test.direction, circular: test.circular)
            XCTAssert(result == test.expectedResult,"""
                start: `\(test.start)`
                offset: `\(test.offset)`
                direction: `\(test.direction)`
                circular: `\(test.circular)`
                should be `\(String(describing: test.expectedResult))`,
                instead got `\(String(describing: result))
                """
            )
        }
    }
}
