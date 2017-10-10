//
//  Stack.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/2/17.
//

import Foundation

/// A simple LIFO stack
public struct Stack<Element> {
    private var data = [Element]()
    
    /// The number of items in the stack
    public var count: Int {
        return data.count
    }
    
    /// `true` if there are no elements in the stack
    public var isEmpty: Bool {
        return count == 0
    }
    
    /// The top value of the stack, `nil` if empty
    public var top: Element? {
        return data.last
    }
    
    /// Initializes an empty `Stack`
    public init() { }
    
    /// Adds a new element to the top of the stack
    ///
    /// - Parameter value: The element to add to the top of the stack
    public mutating func push(_ value: Element) {
        data.append(value)
    }
    
    /// Removes the top element in the stack if it exists
    ///
    /// - Returns: The removed element from the stack, `nil` if empty
    public mutating func pop() -> Element? {
        guard data.count > 0 else {
            return nil
        }
        
        let value = data.last
        data.removeLast()
        return value
    }
    
}
