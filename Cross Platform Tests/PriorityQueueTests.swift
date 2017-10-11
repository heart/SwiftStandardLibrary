//
//  PriorityQueueTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/2/17.
//

import XCTest
import SwiftStandardLibrary

struct Container {
    let value: Int
    init(value: Int) {
        self.value = value
    }
}

class PriorityQueueTests: XCTestCase {
    
    func testNonComparable() {
        var queue = PriorityQueue<Container>(comparator: { (a, b) in
            return a.value < b.value
        })
        
        for i in 0..<100 {
            queue.enqueue(Container(value: i))
        }
        
        for i in 0..<100 {
            XCTAssertEqual(queue.dequeue()?.value, i)
        }
        
        XCTAssertNil(queue.dequeue())
    }
    
    func testEnqueue() {
        var queue = PriorityQueue<Int>()

        XCTAssertTrue(queue.isEmpty)
        XCTAssertEqual(queue.count, 0)

        queue.enqueue(10)

        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 1)

        for i in 1..<10 {
            queue.enqueue(i)
        }

        XCTAssertFalse(queue.isEmpty)
        XCTAssertEqual(queue.count, 10)
    }
    
    func testMinElementOnEnqueue() {
        var queue = PriorityQueue<Int>()

        XCTAssertNil(queue.min)
        queue.enqueue(100)
        XCTAssertEqual(queue.min, 100)
        queue.enqueue(8)
        XCTAssertEqual(queue.min, 8)
        queue.enqueue(1_000)
        XCTAssertEqual(queue.min, 8)
        queue.enqueue(Int.min)
        XCTAssertEqual(queue.min, Int.min)
        queue.enqueue(Int.max)
        XCTAssertEqual(queue.min, Int.min)
    }

    func testDequeueWhenEmptyIsNil() {
        var queue = PriorityQueue<Int>()

        XCTAssertTrue(queue.isEmpty)
        XCTAssertNil(queue.min)
        XCTAssertNil(queue.dequeue())
    }

    func testDequeueWithOneElement() {
        var queue = PriorityQueue<Int>()
        queue.enqueue(123)

        XCTAssertEqual(queue.dequeue(), 123)
        XCTAssertEqual(queue.count, 0)
        XCTAssertTrue(queue.isEmpty)

        XCTAssertNil(queue.dequeue())
    }

    func testEnqueueAndDequeue() {
        var queue = PriorityQueue<Int>()

        let total = 1_000
        for i in stride(from: total, to: 0, by: -1) {
            queue.enqueue(i)
        }

        for i in 1...total {
            XCTAssertEqual(queue.dequeue(), i)
        }

        XCTAssertNil(queue.dequeue())
    }

    func testEnqueueAndDequeueWithRandomNumbers() {
        var queue = PriorityQueue<Int>()

        let total = 1_000
        for _ in 0..<total {
            queue.enqueue(Int.random)
        }

        var last = Int.min
        while !queue.isEmpty {
            let value = queue.dequeue()!
            XCTAssertLessThanOrEqual(last, value)
            last = value
        }
    }
    
}
