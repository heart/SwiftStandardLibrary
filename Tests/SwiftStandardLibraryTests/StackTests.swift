//
//  StackTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/2/17.
//

import XCTest
@testable import SwiftStandardLibrary

class StackTests: XCTestCase {

    func testPush() {
        var stack = Stack<Int>()
        
        XCTAssertEqual(stack.count, 0)
        XCTAssertNil(stack.top)
        
        let total = 1000
        for i in 0..<total {
            stack.push(i)
        }
        
        XCTAssertEqual(stack.count, total)
        XCTAssertEqual(stack.top, total - 1)
    }
    
    func testPop() {
        var stack = Stack<Int>()
        
        let total = 1000
        for i in 0..<total {
            stack.push(i)
        }
        
        for i in stride(from: total - 1, through: 0, by: -1) {
            XCTAssertEqual(stack.pop(), i)
        }
        
        XCTAssertNil(stack.top)
        XCTAssertTrue(stack.isEmpty)
    }

}
