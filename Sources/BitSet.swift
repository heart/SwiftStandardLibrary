//
//  BitSet.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/1/17.
//

import Foundation

public struct BitSet {
    
    /// The number of bits in the set
    public let count: Int
    
    private var data: [UInt8]
    
    /// Returns `true` if all of the bits are `true`
    public var all: Bool {
        for (index, value) in data.enumerated() {
            if index < data.count - 1 {
                guard value == UInt8.max else { return false }
            } else {
                var expected: UInt8 = 0
                let remaining = count - (data.count - 1) * 8
                
                for i in 0..<remaining {
                    expected |= (1 << i)
                }
                
                guard value == expected else { return false }
            }
        }
        
        return true
    }
    
    /// Returns `true` if any of the bits in the set is `true`
    public var any: Bool {
        for value in data {
            if value > 0 {
                return true
            }
        }
        
        return false
    }
    
    /// Returns `true` if all of the bits in the set are `false`
    public var none: Bool {
        return !any
    }
    
    /// Creates a `BitSet` with a fixed number of bits
    ///
    /// - Parameter count: The number of bits in the set
    public init(count: Int) {
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
    public subscript(_ index: Int) -> Bool {
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

extension BitSet : CustomStringConvertible {
    
    /// The set represented as a binary string
    public var description: String {
        var str = ""
        
        for (index, item) in data.enumerated() {
            var bitString = String(String(item, radix: 2).reversed())
            if index < data.count - 1 {
                while bitString.length < 8 {
                    bitString += "0"
                }
            }
            
            str += bitString
        }
        
        return str
    }
}

extension BitSet : Sequence {
    
    public typealias Element = Bool
    
    /// Iterates over all elements in the bit set
    public class BitSetIterator: IteratorProtocol {
        public typealias Element = Bool
        private let set: BitSet
        internal init(set: BitSet) {
            self.set = set
        }
        
        private var index = 0
        public func next() -> Bool? {
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
    public func makeIterator() -> BitSetIterator {
        return BitSetIterator(set: self)
    }
}

extension BitSet : ExpressibleByStringLiteral {
    public typealias StringLiteralType = String
    
    /// Initializes the set with a binary string
    ///
    /// - Parameter value: A string repesentation of a binary value
    public init(stringLiteral value: String) {
        self.init(binaryString: value)
    }
    
    public init(binaryString string: String) {
        self.init(count: string.length)
        
        var i = 0
        for char in string {
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

extension BitSet : ExpressibleByArrayLiteral {
    public typealias ArrayLiteralElement = Bool
    
    /// Initializes the set with with an array of boolean values
    ///
    /// - Parameter elements: An array of boolean values that will set the bits in the set
    public init(arrayLiteral elements: Bool...) {
        self.init(count: elements.count)
        for (index, value) in elements.enumerated() {
            self[index] = value
        }
    }
}


