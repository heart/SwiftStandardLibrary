//
//  TrieTests.swift
//  SwiftStandardLibraryTests
//
//  Created by Tyler Kirtland on 10/1/17.
//

import XCTest
import SwiftStandardLibrary

class TrieTests: XCTestCase {

    func testTrieInsert() {
        var trie = Trie<Int>()
        
        trie.insert(key: "testing", value: 1)
        trie.insert(key: "hello", value: 2)
        
        trie["world"] = 3
        trie["test"] = 4
        
        XCTAssertEqual(trie.value(for: "testing"), 1)
        XCTAssertEqual(trie.value(for: "hello"), 2)
        
        XCTAssertEqual(trie["world"], 3)
        XCTAssertEqual(trie["test"], 4)
    }
    
    func testRemoveFromTrie() {
        var trie = Trie<Int>()
        
        trie["test"] = 1
        trie["testing"] = 2
        trie["hello"] = 3
        
        XCTAssertEqual(trie["test"], 1)
        XCTAssertEqual(trie["testing"], 2)
        XCTAssertEqual(trie["hello"], 3)
        
        trie.remove(for: "test")
        
        XCTAssertNil(trie["test"])
        XCTAssertEqual(trie["testing"], 2)
        XCTAssertEqual(trie["hello"], 3)
        
        trie["hello"] = nil
        
        XCTAssertNil(trie["test"])
        XCTAssertEqual(trie["testing"], 2)
        XCTAssertNil(trie["hello"])
        
        XCTAssertNil(trie["xyz"])
        XCTAssertNil(trie.remove(for: "xyz"))
    }
    
    func testInitWithDictionary() {
        let trie: Trie<Int> = ["testing" : 1, "hello" : 2, "goodbye" : 3]
        XCTAssertEqual(trie["testing"], 1)
        XCTAssertEqual(trie["hello"], 2)
        XCTAssertEqual(trie["goodbye"], 3)
        XCTAssertNil(trie["test"])
    }

}
