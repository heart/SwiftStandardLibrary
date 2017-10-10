//
//  NumberExtensions.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/4/17.
//

import Foundation

public extension Int {
    
    /// Generates a random `Int`
    static var random: Int {
        return Int(arc4random())
    }
    
    /// Generates a random `Int` between the lower bound of the range and up to
    /// but not including the upper bound of the range
    ///
    /// - Parameter range: The range for the number to be contained in
    /// - Returns: A random `Int`
    static func random(in range: Range<Int>) -> Int {
        let width = UInt32(range.upperBound - range.lowerBound)
        return Int(arc4random_uniform(width)) + range.lowerBound
    }
    
    /// Generates a random `Int` between the lower bound of the range and up to
    /// and including the upper bound of the range
    ///
    /// - Parameter range: The range for the number to be contained in
    /// - Returns: A random `Int`
    static func random(in range: ClosedRange<Int>) -> Int {
        let width = UInt32(range.upperBound - range.lowerBound)
        return Int(arc4random_uniform(width)) + range.lowerBound
    }
    
}

public extension Double {
    
    /// Generates a random `Double`
    public static var random: Double {
        return Double(arc4random()) / Double(UInt32.max)
    }
    
    /// Generates a random `Double` between the lower bound of the range and up to
    /// but not including the upper bound of the range
    ///
    /// - Parameter range: The range for the number to be contained in
    /// - Returns: A random `Double`
    public static func random(in range: Range<Double>) -> Double {
        let width = range.upperBound - range.lowerBound
        return width * random + range.lowerBound
    }
    
    /// Generates a random `Double` between the lower bound of the range and up to
    /// and including the upper bound of the range
    ///
    /// - Parameter range: The range for the number to be contained in
    /// - Returns: A random `Double`
    public static func random(in range: ClosedRange<Double>) -> Double {
        let width = range.upperBound - range.lowerBound
        return width * random + range.lowerBound
    }
}
