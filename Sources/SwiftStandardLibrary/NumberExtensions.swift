//
//  NumberExtensions.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 10/4/17.
//

import Foundation

extension Int {
    static var random: Int {
        return Int(arc4random())
    }
    
    static func random(in range: Range<Int>) -> Int {
        let width = UInt32(range.upperBound - range.lowerBound)
        return Int(arc4random_uniform(width)) + range.lowerBound
    }
    
    static func random(in range: ClosedRange<Int>) -> Int {
        let width = UInt32(range.upperBound - range.lowerBound)
        return Int(arc4random_uniform(width)) + range.lowerBound
    }
    
}
