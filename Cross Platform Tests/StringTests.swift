//
//  StringTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 9/27/17.
//  Copyright © 2017 Tyler Kirtland. All rights reserved.
//

import XCTest
import SwiftStandardLibrary

class StringTests: XCTestCase {
    
    func testStringLength() {
        XCTAssertEqual("".length, 0)
        XCTAssertEqual("1234".length, 4)
        XCTAssertEqual("fjiaofjeiwao".length, 12)
        XCTAssertEqual("🤡🍆".length, 2)
        XCTAssertEqual(" aw 421 🍆🍆🍆 \t\n\\".length, 15)
    }
    
    
    func testSubstringWithLength() {
        XCTAssertEqual("this is a test".substring(from: 0, length: 4), "this")
        XCTAssertEqual("testing 1 2 3".substring(from: 8, length: 3), "1 2")
        XCTAssertEqual("🤡🤡🤡🍆🍆🤓".substring(from: 5, length: 1), "🤓")
    }
    
    func testSubstringTo() {
        XCTAssertEqual("this is a test".substring(to: 4), "this")
        XCTAssertEqual("testing 1 2 3".substring(to: 12), "testing 1 2 ")
        XCTAssertEqual("🤡🤡🤡🍆🍆🤓".substring(to: 0), "")
    }
    
    func testSubstringFrom() {
        XCTAssertEqual("this is a test".substring(from: 4), " is a test")
        XCTAssertEqual("testing 1 2 3".substring(from: 12), "3")
        XCTAssertEqual("🤡🤡🤡🍆🍆🤓".substring(from: 0), "🤡🤡🤡🍆🍆🤓")
    }
    
    func testGetCharacterAtIndex() {
        let str = "this is an 🍆 (eggplant)\n"
        XCTAssertEqual(str[0], "t")
        XCTAssertEqual(str[11], "🍆")
        XCTAssertEqual(str[13], "(")
        XCTAssertEqual(str[23], "\n")
    }
    
    func testSetCharacterAtIndex() {
        var str = "thas is a test?"
        
        str[2] = "i"
        XCTAssertEqual(str, "this is a test?")
        
        str[14] = "!"
        XCTAssertEqual(str, "this is a test!")
        
        str[0] = "T"
        XCTAssertEqual(str, "This is a test!")
    }
    
    func testAsciiCodeForCharacter() {
        let a = Character("a")
        let z = Character("z")
        let emoji = Character("🍆")
        XCTAssertEqual(a.asciiCode, 97)
        XCTAssertEqual(z.asciiCode, 122)
        XCTAssertGreaterThan(emoji.asciiCode, z.asciiCode)
        
    }
    
    func testIntValueForCharacter() {
        let zero: Character = "0"
        let five: Character = "5"
        let nine: Character = "9"
        let a: Character = "a"
        
        XCTAssertEqual(zero.intValue, 0)
        XCTAssertEqual(five.intValue, 5)
        XCTAssertEqual(nine.intValue, 9)
        XCTAssertNil(a.intValue)
    }
    
    // Adapted from http://nshipster.com/nsregularexpression
    func testRegularExpressions() {
        let source = "Questions? Corrections? <a href=\"https://twitter.com/NSHipster\">@NSHipster</a> or <a href=\"https://github.com/NSHipster/articles\">on GitHub</a>."
        
        let pattern = "<a\\s+[^>]*href=\"([^\"]*)\"[^>]*>"
        let matches = source.matches(regex: pattern)
        
        XCTAssertEqual(matches.count, 2)
        XCTAssertEqual(matches[0], "https://twitter.com/NSHipster")
        XCTAssertEqual(matches[1], "https://github.com/NSHipster/articles")
    }
    
    func testRegularExpressionWithBadPattern() {
        let source = "testing 1 2 3"
        let pattern = "💩./12?31ˆ31"
        
        let matches = source.matches(regex: pattern)
        XCTAssertTrue(matches.isEmpty)
    }
    
    func testWordCount() {
        let source = "Old MACDONALD had a farm E-I-E-I-O And on his farm he had a cow E-I-E-I-O"
       
        let num = source.countWord("farm")
        XCTAssertEqual(2, num )
        
    }
    
    
}

