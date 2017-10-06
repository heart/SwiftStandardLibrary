//
//  LinkedList.swift
//  SwiftStandardLibrary
//
//  Created by Tyler Kirtland on 9/27/17.
//  Copyright © 2017 Tyler Kirtland. All rights reserved.
//

import Foundation

/// A Linked List data structure
struct LinkedList<Element>: Sequence, ExpressibleByArrayLiteral {
    
    typealias Iterator = LinkedListIterator<Element>
    
    /// A container for each element in the `LinkedList`
    class Node<Element> {
        
        /// The next element in the list, `nil` if it is the end of the list
        var next: Node<Element>?
        
        /// The previous element in the list, `nil` if is is the beginning of the list
        weak var previous: Node<Element>?
        
        /// The value of the current element in the list
        var value: Element
        
        /// Initialize a `Node` with a value and previous and next `Node`s if they exist
        ///
        /// - Parameters:
        ///   - value: The value for the element in the list
        ///   - previous: The previous `Node` in the list
        ///   - next: The next `Node` in the list
        init(value: Element, previous: Node<Element>? = nil, next: Node<Element>? = nil) {
            self.value = value
            self.previous = previous
            self.next = next
        }
    }
    
    private var front: Node<Element>?
    private var back: Node<Element>?
    
    /// The number of elements in the list
    private(set) var count: Int = 0

    /// `true` if there are no elements in the list
    var isEmpty: Bool {
        return count == 0
    }
    
    /// The first item in the list, `nil` if there are no elements
    var first: Element? {
        return front?.value
    }
    
    /// The last item in the list, `nil` if there are no elements
    var last: Element? {
        return back?.value
    }
    
    /// Initializes the list with elements from an array
    ///
    /// - Parameter elements: An array of elements to insert into the list
    init(arrayLiteral elements: Element...) {
        for item in elements {
            append(item)
        }
    }
    
    /// Inserts an element at the end of the list
    ///
    /// - Parameter value: The value to insert
    mutating func append(_ value: Element) {
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
    mutating func prepend(_ value: Element) {
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
    mutating func insert(at index: Int, value: Element) {
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
    
    /// Removes the first element in the list
    ///
    /// - Returns: The value of the first element in the list, `nil` if empty
    mutating func removeFirst() -> Element? {
        count = Swift.max(count - 1, 0)
        
        let value = front?.value
        front = front?.next
        return value
    }
    
    /// Removes the last element in the list
    ///
    /// - Returns: The value of the last element in the list, `nil` if empty
    mutating func removeLast() -> Element? {
        count = Swift.max(count - 1, 0)
        
        let value = back?.value
        back = back?.previous
        return value
    }
    
    /// Removes the element at a given index
    ///
    /// - Parameter index: The index of the element to remove
    /// - Returns: The value of the removed element, `nil` if the index does not exist
    mutating func remove(at index: Int) -> Element? {
        if index == 0 {
            return removeFirst()
        } else if index == count - 1 {
            return removeLast()
        }
        
        var node = front!
        for _ in 0..<(index - 1) {
            node = node.next!
        }
        
        let removingNode = node.next!
        node.next = removingNode.next
        removingNode.next?.previous = node
        
        count = Swift.max(count - 1, 0)
        
        return removingNode.value
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
    func makeIterator() -> LinkedListIterator<Element> {
        return LinkedListIterator<Element>(front)
    }
    
}

struct LinkedListIterator<Element>: IteratorProtocol {
    typealias Node = LinkedList<Element>.Node<Element>
    
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
    mutating func next() -> Element? {
        let value = current?.value
        current = current?.next
        return value
    }
}
