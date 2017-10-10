//
//  BitSetTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/1/17.
//

import XCTest
import SwiftStandardLibrary

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
    
    func testInitWithBinaryString() {
        let set: BitSet = "10011"
        XCTAssertEqual(set.count, 5)
        
        XCTAssertTrue(set[0])
        XCTAssertFalse(set[1])
        XCTAssertFalse(set[2])
        XCTAssertTrue(set[3])
        XCTAssertTrue(set[4])
    }
    
    func testDescription() {
        let a: BitSet = "11101"
        XCTAssertEqual(a.description, "11101")
        
        let b: BitSet = "10000000001"
        XCTAssertEqual(b.description, "10000000001")
        
        let c: BitSet = "0000000000000000000000000"
        XCTAssertEqual(c.description, "0000000000000000000000000")
        
        let d: BitSet = "100000000"
        XCTAssertEqual(d.description, "100000000")
    }

    func testInitWithArrayOfBool() {
        let set: BitSet = [true, false, false, true, true]
        XCTAssertTrue(set[0])
        XCTAssertFalse(set[1])
        XCTAssertFalse(set[2])
        XCTAssertTrue(set[3])
        XCTAssertTrue(set[4])
    }
    
    func testAny() {
        let a: BitSet = "0000000"
        let b: BitSet = "0"
        let c: BitSet = "100000000"
        let d: BitSet = "10101010111"
        let e: BitSet = "111111111"
        let f: BitSet = "1"
        let g: BitSet = "00000000000001"
        
        XCTAssertFalse(a.any)
        XCTAssertFalse(b.any)
        XCTAssertTrue(c.any)
        XCTAssertTrue(d.any)
        XCTAssertTrue(e.any)
        XCTAssertTrue(f.any)
        XCTAssertTrue(g.any)
    }
    
    func testNone() {
        let a: BitSet = "0000000"
        let b: BitSet = "0"
        let c: BitSet = "100000000"
        let d: BitSet = "10101010111"
        let e: BitSet = "111111111"
        let f: BitSet = "1"
        let g: BitSet = "00000000000001"
        
        XCTAssertTrue(a.none)
        XCTAssertTrue(b.none)
        XCTAssertFalse(c.none)
        XCTAssertFalse(d.none)
        XCTAssertFalse(e.none)
        XCTAssertFalse(f.none)
        XCTAssertFalse(g.none)
    }
    
    func testAll() {
        let a: BitSet = "1"
        let b: BitSet = "11111111"
        let c: BitSet = "11111111111111111111111111111111111"
        let d: BitSet = "111111111101"
        let e: BitSet = "0000001111"
        let f: BitSet = "1010101010101"
        
        XCTAssertTrue(a.all)
        XCTAssertTrue(b.all)
        XCTAssertTrue(c.all)
        XCTAssertFalse(d.all)
        XCTAssertFalse(e.all)
        XCTAssertFalse(f.all)
    }
    
}
