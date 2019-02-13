//
//  ListTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow
import RealmSwift

class ListTests: PredicateFlowRealmBaseTests {
    
    var testingElement: TestObject!
    
    override func setUp() {
        super.setUp()
        
        testingElement = realm.object(ofType: TestObject.self, forPrimaryKey: rangeOfElementsInRealm().indices.last!)
    }
    
    override func tearDown() {
        super.tearDown()
        
        testingElement = nil
    }
    
    func testFilter() {
        let expected = testingElement.children.filter("int < %@", 17)
        let result = testingElement.children.filter(TestObjectSchema.int.isLess(than: 17))
        
        PFRLMEqual(expected, result)
    }
    
    func testSorted() {
        [true, false].forEach {
            let expected = testingElement.children.sorted(SortDescriptor(keyPath: "key", ascending: $0))
            let result = testingElement.children.sorted($0 ? TestObjectSchema.key.ascending() : TestObjectSchema.key.descending())
            
            PFRLMEqual(expected, result)
        }
    }
    
    func testValue() {
        let expectedInt = (testingElement.children.value(forKeyPath: "int") as [AnyObject]) as! [Int]
        let resultInt = testingElement.children.value(TestObjectSchema.int) as! [Int]
        XCTAssertEqual(expectedInt, resultInt)
        
        let expectedString = (testingElement.children.value(forKeyPath: "string") as [AnyObject]) as! [String]
        let resultString = testingElement.children.value(TestObjectSchema.string) as! [String]
        XCTAssertEqual(expectedString, resultString)
    }
    
    func testMin() {
        let expected: Int = testingElement.children.min(ofProperty: "int")!
        let result: Int = testingElement.children.min(TestObjectSchema.int)!
        
        XCTAssertEqual(expected, result)
    }
    
    func testMax() {
        let expected: Int = testingElement.children.max(ofProperty: "int")!
        let result: Int = testingElement.children.max(TestObjectSchema.int)!
        
        XCTAssertEqual(expected, result)
    }
    
    func testAverage() {
        let expected: Double = testingElement.children.average(ofProperty: "int")!
        let result: Double = testingElement.children.average(TestObjectSchema.int)!
        
        XCTAssertEqual(expected, result)
    }
    
    func testSum() {
        let expected: Int = testingElement.children.sum(ofProperty: "int")
        let result: Int = testingElement.children.sum(TestObjectSchema.int)
        
        XCTAssertEqual(expected, result)
    }
}
