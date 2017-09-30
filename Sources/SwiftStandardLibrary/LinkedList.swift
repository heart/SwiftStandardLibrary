//
//  LinkedList.swift
//  SwiftStandardLibrary
//
//  Created by Tyler Kirtland on 9/27/17.
//  Copyright © 2017 Tyler Kirtland. All rights reserved.
//

import Foundation

/// A Linked List data structure
struct LinkedList<T>: Sequence, ExpressibleByArrayLiteral {
    
    typealias Element = T
    typealias Iterator = LinkedListIterator<T>
    
    /// A container for each element in the `LinkedList`
    class Node<T> {
        
        /// The next element in the list, `nil` if it is the end of the list
        var next: Node<T>?
        
        /// The previous element in the list, `nil` if is is the beginning of the list
        weak var previous: Node<T>?
        
        /// The value of the current element in the list
        var value: T
        
        /// Initialize a `Node` with a value and previous and next `Node`s if they exist
        ///
        /// - Parameters:
        ///   - value: The value for the element in the list
        ///   - previous: The previous `Node` in the list
        ///   - next: The next `Node` in the list
        init(value: T, previous: Node<T>? = nil, next: Node<T>? = nil) {
            self.value = value
            self.previous = previous
            self.next = next
        }
    }
    
    private var front: Node<T>?
    private var back: Node<T>?
    
    /// The number of elements in the list
    private(set) var count: Int = 0

    /// `true` if there are no elements in the list
    var isEmpty: Bool {
        return count == 0
    }
    
    /// The first item in the list, `nil` if there are no elements
    var first: T? {
        return front?.value
    }
    
    /// The last item in the list, `nil` if there are no elements
    var last: T? {
        return back?.value
    }
    
    /// Initializes the list with elements from an array
    ///
    /// - Parameter elements: An array of elements to insert into the list
    init(arrayLiteral elements: T...) {
        for item in elements {
            append(item)
        }
    }
    
    /// Inserts an element at the end of the list
    ///
    /// - Parameter value: The value to insert
    mutating func append(_ value: T) {
        count += 1
        
        let node = Node(value: value)
        guard back != nil else {
            front = node
            back = node
            return
        }
        
        back?.next = node
        node.previous = back
        back = node
    }
    
    /// Inserts an element at the beginning of the list
    ///
    /// - Parameter value: The value to insert
    mutating func prepend(_ value: T) {
        count += 1
        
        let node = Node(value: value)
        guard front != nil else {
            front = node
            back = node
            return
        }
        
        node.next = front
        front?.previous = node
        front = node
    }
    
    /// Inserts an element at a given index in the array
    ///
    /// - Parameters:
    ///   - index: The index to insert the item
    ///   - value: The value to insert
    mutating func insert(at index: Int, value: T) {
        guard index > 0 else {
            prepend(value)
            return
        }
        
        if index == count {
            append(value)
            return
        }
        
        var node = front
        for _ in 0..<(index - 1) {
            node = node?.next
        }
        
        let newNode = Node(value: value)
        let oldNext = node?.next
        node?.next = newNode
        newNode.previous = node
        newNode.next = oldNext
        oldNext?.previous = newNode
    }
    
    /// Removes all elements from the list
    mutating func removeAll() {
        count = 0
        front = nil
        back = nil
    }
    
    // MARK: Iterator
    
    /// Creates an iterator for all elements in the list
    ///
    /// - Returns: A `LinkedListIterator` over the elements in the list
    func makeIterator() -> LinkedListIterator<T> {
        return LinkedListIterator<T>(front)
    }
    
}

struct LinkedListIterator<T>: IteratorProtocol {
    typealias Element = T
    typealias Node = LinkedList<T>.Node<T>
    
    private var current: Node?
    
    /// Creates an iterator starting at the given node
    ///
    /// - Parameter node: The start `Node` of the iterator
    init(_ node: Node?) {
        self.current = node
    }
    
    /// Fetches the next `Node` in the list
    ///
    /// - Returns: The value of the current `Node` in the list
    mutating func next() -> T? {
        let value = current?.value
        current = current?.next
        return value
    }
}
