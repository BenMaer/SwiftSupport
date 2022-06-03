//
//  Array+PopFirst-Tests.swift
//  10SpotTests
//
//  Created by Benjamin W Maer on 8/30/21.
//

import XCTest

@testable import _10Spot

class Array_PopFirst_Tests: XCTestCase {
    func testPopFirst() {
        var objects = [0, 1, 2]
        XCTAssert(objects.popFirst() == 0, "First pop should return 0")
        XCTAssert(objects.popFirst() == 1, "Second pop should return 1")
        XCTAssert(objects.popFirst() == 2, "Third pop should return 2")
        XCTAssert(objects.popFirst() == nil, "Fourth pop should return nil, since it's out of objects.")
    }
    
    func testPoppedFirst() {
        var startingObjects = [0, 1, 2]
        
        enum Test: Equatable {
            struct ExpectingResults: Equatable {
                let poppedObject: Int
                let poppedObjects: [Int]
            }
            case noResults, expectedResults(ExpectingResults)
        }
        let tests: [Test] = [
            .expectedResults(.init(poppedObject: 0, poppedObjects: [1, 2])),
            .expectedResults(.init(poppedObject: 1, poppedObjects: [2])),
            .expectedResults(.init(poppedObject: 2, poppedObjects: [])),
            .noResults,
        ]
        
        for test in tests {
            switch test {
            case .noResults:
                XCTAssert(startingObjects.poppedFirst == nil, "Should have no popped results.")
                
            case let .expectedResults(expectedResults):
                guard let (poppedObject, poppedObjects) = startingObjects.poppedFirst else {
                    XCTAssertFailure("Ran out of objects before test could complete.")
                    continue
                }
                
                XCTAssert(poppedObjects.count + 1 == startingObjects.count, "Current count `\(poppedObjects.count)` should be exactly 1 less than count before pop: `\(startingObjects.count)`")
                XCTAssert(poppedObject == expectedResults.poppedObject, "Popped object should be \(expectedResults.poppedObject)")
                XCTAssert(poppedObjects == expectedResults.poppedObjects, "Popped objects should be \(expectedResults.poppedObjects)")
                startingObjects = poppedObjects
            }
        }
    }
    
    func testPoppedFirstIf() {
        var startingObjects = [0, 1, 2]
        
        enum Test: Equatable {
            struct ExpectingResults: Equatable {
                let popIf: Int
                let expectedSuccess: Bool
                let poppedObjects: [Int]
            }
            case noResults, expectedResults(ExpectingResults)
        }
        let tests: [Test] = [
            .expectedResults(.init(popIf: 99, expectedSuccess: false, poppedObjects: [10000, 20000, 3000])),
            .expectedResults(.init(popIf: 0, expectedSuccess: true, poppedObjects: [1, 2])),
            .expectedResults(.init(popIf: 200, expectedSuccess: false, poppedObjects: [5, 4, 3])),
            .expectedResults(.init(popIf: 1, expectedSuccess: true, poppedObjects: [2])),
            .expectedResults(.init(popIf: 2, expectedSuccess: true, poppedObjects: [])),
            .expectedResults(.init(popIf: 600, expectedSuccess: false, poppedObjects: [])),
            .noResults,
        ]
        
        for test in tests {
            switch test {
            case .noResults:
                XCTAssert(startingObjects.poppedFirst == nil, "Should have no popped results.")
                
            case let .expectedResults(expectedResults):
                let popIf = expectedResults.popIf
                let success: Bool = {
                    guard let (poppedObject, poppedObjects) = startingObjects.poppedFirst(if: popIf) else {
                        return false
                    }
                    
                    XCTAssert(poppedObjects.count + 1 == startingObjects.count, "Current count `\(poppedObjects.count)` should be exactly 1 less than count before pop: `\(startingObjects.count)`")
                    XCTAssert(poppedObject == popIf, "Popped object should be \(popIf)")
                    XCTAssert(poppedObjects == expectedResults.poppedObjects, "Popped objects should be \(expectedResults.poppedObjects)")
                    startingObjects = poppedObjects
                    return true
                }()
                
                XCTAssert(success == expectedResults.expectedSuccess,
                          """
                          ended up with success: \(success)
                          but expected: \(expectedResults.expectedSuccess)
                          """
                )
            }
        }
    }

}
