//
//  QueueTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/2/17.
//

import XCTest
@testable import SwiftStandardLibrary

class QueueTests: XCTestCase {

    func testEnqueueAndDequeue() {
        var queue = Queue<Int>()
        
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.front)
    
        for i in 0..<100 {
            queue.enqueue(i)
        }
        
        XCTAssertEqual(queue.count, 100)
        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.front, 0)
        
        for i in 0..<100 {
            XCTAssertEqual(queue.front, i)
            XCTAssertEqual(queue.dequeue(), i)
        }
        
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.front)
    }

}
