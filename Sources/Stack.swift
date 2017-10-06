//
//  Stack.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/2/17.
//

import Foundation

/// A simple LIFO stack
struct Stack<Element> {
    private var data = [Element]()
    
    /// The number of items in the stack
    var count: Int {
        return data.count
    }
    
    /// `true` if there are no elements in the stack
    var isEmpty: Bool {
        return count == 0
    }
    
    /// The top value of the stack, `nil` if empty
    var top: Element? {
        return data.last
    }
    
    /// Adds a new element to the top of the stack
    ///
    /// - Parameter value: The element to add to the top of the stack
    mutating func push(_ value: Element) {
        data.append(value)
    }
    
    /// Removes the top element in the stack if it exists
    ///
    /// - Returns: The removed element from the stack, `nil` if empty
    mutating func pop() -> Element? {
        guard data.count > 0 else {
            return nil
        }
        
        let value = data.last
        data.removeLast()
        return value
    }
    
}
