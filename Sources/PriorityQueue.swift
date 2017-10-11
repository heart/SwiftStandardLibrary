//
//  PriorityQueue.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/2/17.
//

import Foundation

/// A priority queue data structure using a Fibonacci Heap for storage
public struct PriorityQueue<Element> {
    
    private class Node<Element> {
        private(set) var degree: Int = 0
        var value: Element
        
        var parent: Node<Element>?
        var child: Node<Element>?
        var previous: Node<Element>!
        var next: Node<Element>!
        
        /// Create a new Node with a given value,
        /// with `next` and `previous` being itself
        ///
        /// - Parameter value: The value to store in the `Node`
        init(_ value: Element) {
            self.value = value
            self.previous = self
            self.next = self
        }
        
        /// Adds a new `Node` as the previous `Node` of itself
        ///
        /// - Parameter node: The new `Node`
        func insert(node: Node<Element>) {
            let listBack: Node<Element> = self.previous
            let nodeBack: Node<Element> = node.previous
            
            listBack.next = node
            node.previous = listBack
            
            nodeBack.next = self
            self.previous = nodeBack
        }
        
        /// Removes the current `Node` from its `next` and `previous` members
        /// and connects `next` and `previous` to each other
        func remove() {
            let oldPrevious: Node<Element> = previous
            let oldNext: Node<Element> = next
            
            oldPrevious.next = oldNext
            oldNext.previous = oldPrevious
            
            self.next = self
            self.previous = self
        }
        
        /// Adds a `Node` as a child of `self`
        ///
        /// - Parameter node: The node to be the child
        func addChild(_ node: Node<Element>) {
            if child == nil {
                child = node
            } else {
                child?.insert(node: node)
            }
            
            node.parent = self
            degree += 1
        }
        
        /// An iterator over the nodes in the heap
        ///
        /// - Parameter action: The action to perform on each node
        func forEach(_ action: (Node<Element>) -> ()) {
            var p: Node<Element> = self
            repeat {
                action(p)
                p = p.next
            } while p !== self
        }
    }
    
    /// The smallest element in the heap, and the head of the root level of the heap
    private var heap: Node<Element>?
    
    private let comparator: ((Element, Element) -> Bool)
    
    /// The smallest element in the queue
    public var min: Element? {
        return heap?.value
    }
    
    /// The number of elements in the queue
    public private(set) var count: Int = 0
    
    /// `true` if there are no elements in the queue, `false` otherwise
    public var isEmpty: Bool {
        return count == 0
    }
    
    /// Initializes an empty `PriorityQueue`
    public init(comparator: @escaping ((Element, Element) -> Bool)) {
        self.comparator = comparator
    }

    /// Inserts an element into the queue
    ///
    /// - Parameter value: The element to be inserted
    public mutating func enqueue(_ value: Element) {
        let node = Node(value)
        
        if isEmpty {
            // If the queue is empty, set the root to be the new element
            heap = node
        } else {
            // Insert the new node into the heap
            node.insert(node: heap!)
            
            // If the new node is smallest than the previous smallest element,
            // let the new root be the new element
            if comparator(node.value, heap!.value) {
                heap = node
            }
        }
        
        count += 1
    }
    
    /// Removes the smallest element in the queue
    ///
    /// - Returns: The smallest element in the queue
    public mutating func dequeue() -> Element? {
        // If the heap is empty, just return `nil`
        guard let heap = heap else { return nil }
        
        // Store the smallest element to be returned later
        let minElement = heap.value
        
        // If the root of the heap has children, bring those children to the
        // root heap
        if let children = heap.child {
            children.forEach { $0.parent = nil }
            heap.insert(node: children)
        }
        
        if heap === heap.next {
            // If the heap has no siblings, remove the last node
            self.heap = nil
        } else {
            // Store the next item in the root of the heap
            let next = heap.next
            
            // Remove the smallest node
            heap.remove()
            
            // Set the new root of the heap
            self.heap = next
            
            // Consolidate the nodes
            consolidate()
        }
        
        // Decrement the number of elements by one
        count -= 1
        
        return minElement
    }
    
    /// Rearrange the nodes in the heap to remain a Fibonacci Heap
    private mutating func consolidate() {
        // Container for the node with a given degree
        var A = [Int : Node<Element>]()
        
        // Start at the first node in the heap
        var w = heap!
        
        // Iterate through each node in the root of the heap,
        // until we get back to the beginning
        repeat {
            // The current node we are on
            var x = w
            
            // The degree of the current node
            var d = x.degree
            
            // While there is another node with the same degree, move the nodes
            while var y = A[d] {
                // If the found node is itself then we have checked all the nodes
                guard x !== y else { break }
                
                // If the current node is larger than the stored node, switch them
                if !comparator(x.value, y.value) {
                    swap(&x, &y)
                }
                
                // The root of the heap is going to become a child, make the new
                // parent the root of the heap
                if y === heap {
                    heap = x
                }
                
                // Remove the new child from the root level of the heap
                y.remove()
                
                // Add the node as a child of the node of same degree
                x.addChild(y)
                
                // Remove the node from storage
                A[d] = nil
                
                // Increment the current degree by one
                d += 1
            }
            
            // Store the new sub-heap for the current degree
            A[d] = x
            
            // Move on to the next node in the root level of the heap
            w = x.next
        } while w !== heap
        
        // Find the smallest node in the root level of the heap, which will be
        // the smallest element in the queue
        heap = A.values.min(by: { comparator($0.value, $1.value) })
    }
    
}

extension PriorityQueue where Element : Comparable {
    public init() {
        self.comparator = { $0 < $1 }
    }
}
