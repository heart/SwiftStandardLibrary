//
//  BitSet.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/1/17.
//

import Foundation

struct BitSet {
    
    /// The number of bits in the set
    let count: Int
    
    private var data: [UInt8]
    
    /// Creates a `BitSet` with a fixed number of bits
    ///
    /// - Parameter count: The number of bits in the set
    init(count: Int) {
        self.count = count
        
        let arraySize = Int(ceil(Double(count) / 8.0))
        self.data = [UInt8](repeating: 0, count: arraySize)
    }
    
    private static func indexToArrayBit(_ index: Int) -> (Int, UInt8) {
        let arrayIndex = index / 8
        let bitIndex = UInt8(1 << (index % 8))
        return (arrayIndex, bitIndex)
    }
    
    /// Gets the value of the current bit or set its
    ///
    /// - Parameter index: The index of the bit
    subscript(_ index: Int) -> Bool {
        get {
            guard index >= 0 && index < count else {
                fatalError("Index out of bounds")
            }
            
            let (arrayIndex, bitIndex) = BitSet.indexToArrayBit(index)
            return data[arrayIndex] & bitIndex == bitIndex
        }
        
        set(newValue) {
            guard index >= 0 && index < count else {
                fatalError("Index out of bounds")
            }
            
            let (arrayIndex, bitIndex) = BitSet.indexToArrayBit(index)
            if newValue {
                data[arrayIndex] |= bitIndex
            } else {
                data[arrayIndex] &= ~bitIndex
            }
        }
    }
    
}

extension BitSet : Sequence {
    
    typealias Element = Bool
    
    /// Iterates over all elements in the bit set
    class BitSetIterator: IteratorProtocol {
        typealias Element = Bool
        
        let set: BitSet
        init(set: BitSet) {
            self.set = set
        }
        
        private var index = 0
        func next() -> Bool? {
            guard index < set.count else {
                return nil
            }
            
            let value = set[index]
            index += 1
            return value
        }
    }
    
    /// Creates an iterator for the BitSet
    ///
    /// - Returns: A `BitSetIterator` for every element in the set
    func makeIterator() -> BitSetIterator {
        return BitSetIterator(set: self)
    }
}

extension BitSet : ExpressibleByStringLiteral {
    typealias StringLiteralType = String
    
    /// Initializes the set with a binary string
    ///
    /// - Parameter value: A string repesentation of a binary value
    init(stringLiteral value: String) {
        self.init(count: value.length)
        
        var i = 0
        for char in value.reversed() {
            let setValue: Bool
            if char == "1" {
                setValue = true
            } else if char == "0" {
                setValue = false
            } else {
                fatalError("Not a valid binary string")
            }
            
            self[i] = setValue
            i += 1
        }
    }
}


