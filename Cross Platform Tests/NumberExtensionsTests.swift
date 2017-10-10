//
//  NumberExtensionsTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/4/17.
//

import XCTest
import SwiftStandardLibrary

class NumberExtensionsTests: XCTestCase {

    func testRandomInt() {
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
    
    func testRandomNumberInInt() {
        for _ in 0..<100 {
            let numb = Int.random(in: 5..<10)
            XCTAssertTrue((5..<10) ~= numb)
        }
    }
    
    func testRandomNumberInClosedInt() {
        for _ in 0..<100 {
            let numb = Int.random(in: 5...10)
            XCTAssertTrue((5...10) ~= numb)
        }
    }
    
    func testRandomDouble() {
        var numbers = [Double]()
        for _ in 0..<10 {
            numbers.append(Double.random)
        }
        print(numbers)
        var allEqual = true
        for i in 1..<10 {
            guard numbers[i] == numbers[0] else {
                allEqual = false
                break
            }
        }
        
        XCTAssertFalse(allEqual)
    }
    
    func testRandomNumberInDouble() {
        for _ in 0..<100 {
            let numb = Double.random(in: 5.4..<11.2)
            XCTAssertTrue((5.4..<11.2) ~= numb)
        }
    }
    
    func testRandomNumberInClosedDouble() {
        for _ in 0..<100 {
            let numb = Double.random(in: 5.4...11.2)
            XCTAssertTrue((5.4...11.2) ~= numb)
        }
    }

}
