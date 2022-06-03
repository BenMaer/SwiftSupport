//
//  String+PathComponents-Tests.swift
//  10SpotTests
//
//  Created by Benjamin W Maer on 8/26/21.
//

import XCTest

@testable import _10Spot

class String_PathComponents_Tests: XCTestCase {
    func testInitWithPathComponents() {
        XCTAssert(String(pathComponents: ["a", "b", "c"]) == "a/b/c", "Should be equal")
    }
    
    func testInitWithPathAndFileName() {
        let path = "myPath"
        XCTAssert(String(path: path) == path, "Should be equal")
        let fileName = "myFileName"
        XCTAssert(String(path: path, fileName: fileName) == path + "/" + fileName, "Should be equal")
    }
    
    func testInitWithPathComponentsAndFileName() {
        let fileName = "myFileName"
        XCTAssert(String(pathComponents: ["a", "b", "c"], fileName: fileName) == "a/b/c/" + fileName, "Should be equal")
    }
    
    func testInitWithPathComponentsThatNeedTrimmingAndFileName() {
        let fileName = "myFileName"
        let assertValue = String(pathComponents: ["a", "/b", "c/", "/d/"], fileName: fileName)
        let expectedValue = "a/b/c/d/" + fileName
        XCTAssert(assertValue == expectedValue, "Should be equal to `\(expectedValue)`, instead was `\(assertValue)`")
    }
    
    func testPathFromComponents() {
        XCTAssert(["a", "/b", "c/"].pathFromComponents == "a/b/c", "Should be equal")
    }
}
