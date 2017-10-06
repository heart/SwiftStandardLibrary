//
//  ArrayExtensions.swift
//  SwiftStandardLibraryPackageDescription
//
//  Created by Tyler Kirtland on 9/30/17.
//

import Foundation

extension Array where Element : Comparable {
    
    /// Searches a sorted array to see if a given element exists
    ///
    /// - Parameters:
    ///   - value: The value to find in the array
    ///   - isSorted: If the array is not sorted, indicate that the array should be sorted
    /// - Returns: `true` if the element exists in the array; `false` otherwise
    func binarySearch(_ value: Element, isSorted: Bool = true) -> Bool {
        guard isSorted else {
            let sortedArray = sorted()
            return sortedArray.binarySearch(value)
        }
        
        var i = 0
        var j = count - 1
        
        while i < j {
            let mid = (j - i) / 2 + i
            if self[mid] == value {
                return true
            } else if (self[i]...self[mid]) ~= value {
                j = mid - 1
            } else if (self[mid + 1]...self[j]) ~= value {
                i = mid + 1
            } else {
                return false
            }
        }
        
        return self[i] == value
    }
    
}
