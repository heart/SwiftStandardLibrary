//
//  Queue.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/2/17.
//

import Foundation

/// A simple FIFO queue data structure
public struct Queue<Element> {
    private var data = LinkedList<Element>()
    
    /// The number of elements in the queue
    public var count: Int {
        return data.count
    }
    
    /// `true` if there are no elements in the queue, `false` otherwise
    public var isEmpty: Bool {
        return data.isEmpty
    }
    
    /// The first element in the queue
    public var front: Element? {
        return data.first
    }
    
    /// Initializes an empty `Queue`
    public init() { }
    
    /// Inserts an element at the back of the queue
    ///
    /// - Parameter value: The value to insert into the queue
    public mutating func enqueue(_ value: Element) {
        data.append(value)
    }
    
    /// Removes the first element in the queue
    ///
    /// - Returns: The value of the first element in the queue
    public mutating func dequeue() -> Element? {
        return data.removeFirst()
    }
}
