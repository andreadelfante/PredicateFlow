//
//  LinkingObjectTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 30/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import RealmSwift

class LinkingObjectTests: PredicateFlowRealmBaseTests {
    
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
        let expected = testingElement.parent.filter("int < %@", 17)
        let result = testingElement.parent.filter(TestObjectSchema.int.isLess(than: 17))
        
        PFRLMEqual(expected, result)
    }
    
    func testSorted() {
        [true, false].forEach {
            let expected = testingElement.parent.sorted(byKeyPath: "key", ascending: $0)
            let result = testingElement.parent.sorted($0 ? TestObjectSchema.key.ascending() : TestObjectSchema.key.descending())
            
            PFRLMEqual(expected, result)
        }
    }
    
    func testValue() {
        let expectedInt = testingElement.parent.value(forKeyPath: "int") as! [Int]
        let resultInt = testingElement.parent.value(TestObjectSchema.int) as! [Int]
        XCTAssertEqual(expectedInt, resultInt)
        
        let expectedString = testingElement.parent.value(forKeyPath: "string") as! [String]
        let resultString = testingElement.parent.value(TestObjectSchema.string) as! [String]
        XCTAssertEqual(expectedString, resultString)
    }
    
    func testMin() {
        let expected: Int? = testingElement.parent.min(ofProperty: "int")
        let result: Int? = testingElement.parent.min(TestObjectSchema.int)
        
        XCTAssertEqual(expected, result)
    }
    
    func testMax() {
        let expected: Int? = testingElement.parent.max(ofProperty: "int")
        let result: Int? = testingElement.parent.max(TestObjectSchema.int)
        
        XCTAssertEqual(expected, result)
    }
    
    func testAverage() {
        let expected: Double? = testingElement.parent.average(ofProperty: "int")
        let result: Double? = testingElement.parent.average(TestObjectSchema.int)
        
        XCTAssertEqual(expected, result)
    }
    
    func testSum() {
        let expected: Int = testingElement.parent.sum(ofProperty: "int")
        let result: Int = testingElement.parent.sum(TestObjectSchema.int)
        
        XCTAssertEqual(expected, result)
    }
}
