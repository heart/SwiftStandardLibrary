//
//  Queue.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/2/17.
//

import Foundation

/// A simple FIFO queue data structure
struct Queue<T> : Sequence {
    typealias Element = T
    
    private var data = LinkedList<T>()
    
    /// The number of elements in the queue
    var count: Int {
        return data.count
    }
    
    /// `true` if there are no elements in the queue, `false` otherwise
    var isEmpty: Bool {
        return data.isEmpty
    }
    
    /// The first element in the queue
    var front: T? {
        return data.first
    }
    
    /// Inserts an element at the back of the queue
    ///
    /// - Parameter value: The value to insert into the queue
    mutating func enqueue(_ value: T) {
        data.append(value)
    }
    
    /// Removes the first element in the queue
    ///
    /// - Returns: The value of the first element in the queue
    mutating func dequeue() -> T? {
        return data.removeFirst()
    }
    
    /// An iterator that goes over the elements in the queue
    /// without removing them
    class QueueIterator<T> : IteratorProtocol {
        typealias Element = T
        
        var queue: Queue<T>
        init(queue: Queue<T>) {
            self.queue = queue
        }
        
        func next() -> T? {
            return queue.dequeue()
        }
    }
    
    /// Creates an iterator that goes over the elements in the queue
    /// without removing them
    ///
    /// - Returns: A `QueueIterator`
    func makeIterator() -> QueueIterator<T> {
        return QueueIterator(queue: self)
    }
}
