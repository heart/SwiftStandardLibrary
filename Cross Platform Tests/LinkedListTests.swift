//
//  LinkedListTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 9/27/17.
//  Copyright © 2017 Tyler Kirtland. All rights reserved.
//

import XCTest
import SwiftStandardLibrary

class LinkedListTests: XCTestCase {
    
    func testAppend() {
        var list = LinkedList<Int>()
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
        XCTAssertEqual(list.count, 0)
        XCTAssertTrue(list.isEmpty)
        
        list.append(10)
        XCTAssertEqual(list.first, 10)
        XCTAssertEqual(list.last, 10)
        XCTAssertEqual(list.count, 1)
        XCTAssertFalse(list.isEmpty)
        
        list.append(20)
        XCTAssertEqual(list.first, 10)
        XCTAssertEqual(list.last, 20)
        XCTAssertEqual(list.count, 2)
        XCTAssertFalse(list.isEmpty)
    }
    
    func testPrepend() {
        var list = LinkedList<Int>()
        XCTAssertNil(list.first)
        XCTAssertNil(list.last)
        
        list.prepend(10)
        XCTAssertEqual(list.first, 10)
        XCTAssertEqual(list.last, 10)
        XCTAssertEqual(list.count, 1)
        XCTAssertFalse(list.isEmpty)
        
        list.prepend(20)
        XCTAssertEqual(list.first, 20)
        XCTAssertEqual(list.last, 10)
        XCTAssertEqual(list.count, 2)
        XCTAssertFalse(list.isEmpty)
    }
    
    func testRemoveAll() {
        var list = LinkedList<Int>()
        
        XCTAssertEqual(list.count, 0)
        XCTAssertTrue(list.isEmpty)
        
        let total = 100
        for i in 0..<total {
            list.append(i)
        }
        
        XCTAssertEqual(list.count, total)
        XCTAssertFalse(list.isEmpty)
        
        list.removeAll()
        
        XCTAssertEqual(list.count, 0)
        XCTAssertTrue(list.isEmpty)
    }
    
    func testInitWithArray() {
        let array = [1, 2, 3, 4, 5]
        let list: LinkedList<Int> = [1, 2, 3, 4, 5]
        
        for (a, b) in zip(array, list) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testInsertAtBeginning() {
        let array = [1, 2, 3, 4, 5]
        var list: LinkedList<Int> = [2, 3, 4, 5]
        
        list.insert(at: 0, value: 1)
        
        for (a, b) in zip(array, list) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testInsertAtEnd() {
        let array = [1, 2, 3, 4, 5]
        var list: LinkedList<Int> = [1, 2, 3, 4]
        
        list.insert(at: 4, value: 5)
        
        for (a, b) in zip(array, list) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testInsertAtMiddle() {
        let array = [1, 2, 3, 4, 5]
        var list: LinkedList<Int> = [1, 2, 4, 5]
        
        list.insert(at: 2, value: 3)
        
        for (a, b) in zip(array, list) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testRemoveAtBegining() {
        let array = [1, 2, 3, 4, 5]
        var list: LinkedList<Int> = [12, 1, 2, 3, 4, 5]
        
        let removedValue = list.remove(at: 0)
        
        XCTAssertEqual(removedValue, 12)
        for (a, b) in zip(array, list) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testRemoveAtMiddle() {
        let array = [1, 2, 3, 4, 5]
        var list: LinkedList<Int> = [1, 2, 3, 12, 4, 5]
        
        let removedValue = list.remove(at: 3)
        
        XCTAssertEqual(removedValue, 12)
        for (a, b) in zip(array, list) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testRemoveAtEnd() {
        let array = [1, 2, 3, 4, 5]
        var list: LinkedList<Int> = [1, 2, 3, 4, 5, 12]
        
        let removedValue = list.remove(at: 5)
        
        XCTAssertEqual(removedValue, 12)
        for (a, b) in zip(array, list) {
            XCTAssertEqual(a, b)
        }
    }
    
    func testRemoveFirstWithElements() {
        var list: LinkedList<Int> = [1, 2, 3, 4, 5]
        XCTAssertEqual(list.removeFirst(), 1)
    }
    
    func testRemoveFirstWithEmpty() {
        var list: LinkedList<Int> = []
        XCTAssertNil(list.removeFirst())
    }
    
    func testRemoveLastWithElements() {
        var list: LinkedList<Int> = [1, 2, 3, 4, 5]
        XCTAssertEqual(list.removeLast(), 5)
    }
    
    func testRemoveLastWithEmpty() {
        var list: LinkedList<Int> = []
        XCTAssertNil(list.removeLast())
    }
    
    func testIterator() {
        var list = LinkedList<Int>()
        
        XCTAssertEqual(list.count, 0)
        XCTAssertTrue(list.isEmpty)
        
        let total = 100
        for i in 0..<total {
            list.append(i)
        }
        
        XCTAssertEqual(list.count, total)
        XCTAssertFalse(list.isEmpty)
        
        for (index, value) in list.enumerated() {
            XCTAssertEqual(index, value)
        }
    }
    
}

