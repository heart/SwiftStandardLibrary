//
//  NumberExtensionsTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/4/17.
//

import XCTest
@testable import SwiftStandardLibrary

class NumberExtensionsTests: XCTestCase {

    func testRandomNumber() {
        var numbers = [Int]()
        for _ in 0..<10 {
            numbers.append(Int.random)
        }
        
        var allEqual = true
        for i in 1..<10 {
            guard numbers[i] == numbers[0] else {
                allEqual = false
                break
            }
        }
        
        XCTAssertFalse(allEqual)
    }
    
    func testRandomNumberInRange() {
        for _ in 0..<100 {
            let numb = Int.random(in: 5..<10)
            XCTAssertTrue((5..<10) ~= numb)
        }
    }
    
    func testRandomNumberInClosedRange() {
        for _ in 0..<100 {
            let numb = Int.random(in: 5...10)
            XCTAssertTrue((5..<10) ~= numb)
        }
    }

}
