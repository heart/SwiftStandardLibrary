//
//  StringExtension.swift
//  SwiftStandardLibrary
//
//  Created by Tyler Kirtland on 9/27/17.
//  Copyright © 2017 Tyler Kirtland. All rights reserved.
//

import Foundation

public extension Character {
    
    /// The ASCII code for the given character
    public var asciiCode: Int {
        return Int(unicodeScalars.first!.value)
    }
    
    /// The integer representation of the character,
    /// if it is between zero and nine inclusively
    public var intValue: Int? {
        guard ("0"..."9") ~= self else {
            return nil
        }
        
        return self.asciiCode - Character("0").asciiCode
    }
    
}

public extension String {
    
    /// The count of all of the characters in the `String`
    public var length: Int {
        return characters.count
    }
    
    /// The `Character` at a given index
    /// Gets or sets the `Character` at the given index
    ///
    /// - Parameter index: The index of the `Character` to be retrieved/written
    public subscript(_ index: Int) -> Character {
        get {
            return characters[characters.index(characters.startIndex, offsetBy: index)]
        }
        
        set(newValue) {
            let charIndex = characters.index(characters.startIndex, offsetBy: index)
            characters.remove(at: charIndex)
            characters.insert(newValue, at: charIndex)
        }
    }
    
    /// Returns a substring of the current `String`
    ///
    /// - Parameters:
    ///   - from: The index in the string to start
    ///   - length: The length of the substring
    /// - Returns: A `String` substring
    public func substring(from: Int, length: Int) -> String {
        let i = index(startIndex, offsetBy: from)
        let j = index(i, offsetBy: length)
        return String(self[i..<j])
    }
    
    /// Returns a substring of the current `String` from the beginning of the `String` to the given index
    ///
    /// - Parameter to: The index where the substring should end
    /// - Returns: A `String` ending at the given index
    public func substring(to: Int) -> String {
        let i = index(startIndex, offsetBy: to)
        return String(self[startIndex..<i])
    }
    
    
    /// Returns a substring of the current `String` from the given index to the end of the `String`
    ///
    /// - Parameter from: The index where the substring should begin
    /// - Returns: A `String` starting at the given index
    public func substring(from: Int) -> String {
        let i = index(startIndex, offsetBy: from)
        return String(self[i...])
    }
    
    /// Finds all of the matches for a given regex pattern in the string
    ///
    /// - Parameter pattern: The regular expression pattern
    /// - Returns: The substrings that match the pattern in the string
    public func matches(regex pattern: String) -> [String] {
        let regex = try? NSRegularExpression(pattern: pattern, options: [])
        let matches = regex?.matches(in: self, options: [], range: NSMakeRange(0, utf16.count))
        return matches?.map { result in
            let range = result.range(at: 1)
            return substring(from: range.location, length: range.length)
        } ?? []
    }
    
}

