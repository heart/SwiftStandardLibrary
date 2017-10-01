//
//  StringTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 9/27/17.
//  Copyright © 2017 Tyler Kirtland. All rights reserved.
//

import XCTest
@testable import SwiftStandardLibrary

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
    
}

