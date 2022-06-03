//
//  Array+Safe-Tests.swift
//  10SpotTests
//
//  Created by Benjamin W Maer on 10/15/21.
//

import XCTest

@testable import _10Spot

class Array_Safe_Tests: XCTestCase {
    // MARK: - Constants
    private enum Constants {
        static let logTest = false
        static let logIndexTests = false
        static let logBadIndexTests = false
    }
    
    func testSafe() {
        if Constants.logTest {
            print("++ Testing Array+Safe.")
        }
        
        let objects = [0, 1, 2]
        for index in 0..<objects.count {
            if Constants.logIndexTests {
                print("++ Asserting object exists at index \(index).")
            }
            XCTAssert(objects[safe: index] != nil, "No object at index \(index)")
        }
        
        let badIndexes = [-1, objects.count]
        for badIndex in 0..<badIndexes.count {
            if Constants.logBadIndexTests {
                print("++ Asserting object doesn't exist at badIndex \(badIndex).")
            }
            XCTAssert(objects[safe: badIndex] != nil, "Should be no object at badIndex \(badIndex)")
        }
        
        if Constants.logTest {
            print("-- Finished testing Array+Safe.")
        }
    }
}
