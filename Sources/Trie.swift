//
//  Trie.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/1/17.
//

import Foundation

/// A simple Trie for storing keys and values in a tree structure
public struct Trie<T> : ExpressibleByDictionaryLiteral {
    public typealias Key = String
    public typealias Value = T
    
    private class Node<T> {
        var value: T?
        var children: [Character : Node]
        
        init(value: T? = nil) {
            self.value = value
            self.children = [Character : Node]()
        }
    }
    
    private var root: Node<T> = Node()
    
    public init(dictionaryLiteral elements: (String, T)...) {
        elements.forEach { insert(key: $0.0, value: $0.1) }
    }
    
    /// Get and set for keys and values
    ///
    /// - Parameter key: The key of the value to get or set
    public subscript(_ key: String) -> T? {
        get {
           return value(for: key)
        }
        
        set(newValue) {
            guard let newValue = newValue else {
                remove(for: key)
                return
            }
            
            insert(key: key, value: newValue)
        }
    }
    
    /// Insert a new element into the `Trie`
    ///
    /// - Parameters:
    ///   - key: The key corresponding to the value
    ///   - value: The value to store
    public mutating func insert(key: String, value: T) {
        var node = root
        for c in key {
            if let child = node.children[c] {
                node = child
            } else {
                let newNode = Node<T>()
                node.children[c] = newNode
                node = newNode
            }
        }
        
        node.value = value
    }
    
    /// Removes the element for the given key
    ///
    /// - Parameter key: The key of the element to remove
    /// - Returns: The removed element
    @discardableResult
    public mutating func remove(for key: String) -> T? {
        var node = root
        for c in key {
            if let child = node.children[c] {
                node = child
            } else {
                return nil
            }
        }
        
        let value = node.value
        node.value = nil
        
        return value
    }
    
    /// Gets the value for the given key
    ///
    /// - Parameter key: The key of the value to store
    /// - Returns: The value to store
    public func value(for key: String) -> T? {
        var node = root
        for c in key {
            if let child = node.children[c] {
                node = child
            } else {
                return nil
            }
        }
        
        return node.value
    }
    
}
