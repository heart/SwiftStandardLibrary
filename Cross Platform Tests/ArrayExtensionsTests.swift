//
//  ArrayExtensionsTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 9/30/17.
//

import XCTest
import SwiftStandardLibrary

class ArrayExtensionsTests: XCTestCase {

    func testBinarySearchWithSortedArray() {
        let array = [1, 12, 43, 64, 246, 1235]
        
        for i in 0...1300 {
            if array.contains(i) {
                XCTAssertTrue(array.binarySearch(i))
            } else {
                XCTAssertFalse(array.binarySearch(i))
            }
        }
    }
    
    func testBinarySearchWithUnsortedArray() {
        let array = [1234, 43, 64, 12, 1, 246]
        
        for i in 0...1300 {
            if array.contains(i) {
                XCTAssertTrue(array.binarySearch(i, isSorted: false))
            } else {
                XCTAssertFalse(array.binarySearch(i, isSorted: false))
            }
        }
    }
    
}
