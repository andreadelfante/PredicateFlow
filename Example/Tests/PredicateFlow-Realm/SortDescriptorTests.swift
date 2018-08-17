//
//  SortDescriptorTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow
import RealmSwift

class SortDescriptorTests: PredicateFlowRealmBaseTests {
    
    private var keyPaths: [(String, PredicateField)]!
    
    override func setUp() {
        super.setUp()
        
        keyPaths = [
            ("string", TestObjectSchema.string),
            ("int", TestObjectSchema.int),
            ("date", TestObjectSchema.date)
        ]
    }
    
    override func tearDown() {
        super.tearDown()
        
        keyPaths = nil
    }
    
    func testAscending() {
        keyPaths.forEach {
            let expected = SortDescriptor(keyPath: $0.0, ascending: true)
            let result = $0.1.ascending()
            
            XCTAssertEqual(expected.keyPath, result.keyPath)
            XCTAssertEqual(expected.ascending, result.ascending)
        }
    }
    
    func testDescending() {
        keyPaths.forEach {
            let expected = SortDescriptor(keyPath: $0.0, ascending: false)
            let result = $0.1.descending()
            
            XCTAssertEqual(expected.keyPath, result.keyPath)
            XCTAssertEqual(expected.ascending, result.ascending)
        }
    }
}
