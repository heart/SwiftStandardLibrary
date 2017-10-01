//
//  BitSetTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/1/17.
//

import XCTest
@testable import SwiftStandardLibrary

class BitSetTests: XCTestCase {

    func testInit() {
        let set = BitSet(count: 12)
        
        for i in 0..<set.count {
            XCTAssertFalse(set[i])
        }
    }
    
    func testSetElements() {
        var set = BitSet(count: 12)
        
        for i in 0..<set.count {
            XCTAssertFalse(set[i])
        }
        
        set[0] = true
        set[4] = true
        set[8] = true
        set[10] = true
        
        XCTAssertTrue(set[0])
        XCTAssertTrue(set[4])
        XCTAssertTrue(set[8])
        XCTAssertTrue(set[10])
        
        set[4] = false
        set[8] = false
        
        XCTAssertTrue(set[0])
        XCTAssertFalse(set[4])
        XCTAssertFalse(set[8])
        XCTAssertTrue(set[10])
    }
    
    func testIterator() {
        var count = 0
        let set = BitSet(count: 100)
        
        for item in set {
            XCTAssertFalse(item)
            count += 1
        }
        
        XCTAssertEqual(count, 100)
    }
    
    func testInitWithString() {
        let set: BitSet = "10011"
        XCTAssertEqual(set.count, 5)
        
        XCTAssertTrue(set[0])
        XCTAssertTrue(set[1])
        XCTAssertFalse(set[2])
        XCTAssertFalse(set[3])
        XCTAssertTrue(set[4])
    }

}
