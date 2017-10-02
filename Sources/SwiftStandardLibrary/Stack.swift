//
//  Stack.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/2/17.
//

import Foundation

/// A simple LIFO stack
struct Stack<T> : Sequence {
    typealias Element = T
    
    private var data = [T]()
    
    /// The number of items in the stack
    var count: Int {
        return data.count
    }
    
    /// `true` if there are no elements in the stack
    var isEmpty: Bool {
        return count == 0
    }
    
    /// The top value of the stack, `nil` if empty
    var top: T? {
        return data.last
    }
    
    /// Adds a new element to the top of the stack
    ///
    /// - Parameter value: The element to add to the top of the stack
    mutating func push(_ value: T) {
        data.append(value)
    }
    
    /// Removes the top element in the stack if it exists
    ///
    /// - Returns: The removed element from the stack, `nil` if empty
    mutating func pop() -> T? {
        guard data.count > 0 else {
            return nil
        }
        
        let value = data.last
        data.removeLast()
        return value
    }
    
    /// Iterates through the elements of a `Stack` without
    /// removing the items of the original stack
    class StackIterator<T> : IteratorProtocol {
        typealias Element = T

        var stack: Stack<T>
        init(stack: Stack<T>) {
            self.stack = stack
        }
        
        func next() -> T? {
            return stack.pop()
        }
    }
    
    /// Creates an iterator over the elements of the stack
    ///
    /// - Returns: A `StackIterator`
    func makeIterator() -> StackIterator<T> {
        return StackIterator(stack: self)
    }
    
}
