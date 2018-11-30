//
//  ResultsTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow
import RealmSwift

class ResultsTests: PredicateFlowRealmBaseTests {
    
    func testFilter() {
        for i in rangeOfElementsInRealm() {
            let expected = realm.object(ofType: TestObject.self, forPrimaryKey: i)
            let result = realm.objects(TestObject.self).filter(TestObjectSchema.key.is(i)).first
            XCTAssertTrue(expected == result)
        }
        
        let expectedInt = realm.objects(TestObject.self).filter("int BETWEEN %@", [1, 50])
        let resultInt = realm.objects(TestObject.self).filter(TestObjectSchema.int.between(1, 50))
        PFRLMEqual(expectedInt, resultInt)
        
        let expectedString = realm.objects(TestObject.self).filter("string CONTAINS %@", "17")
        let resultString = realm.objects(TestObject.self).filter(TestObjectSchema.string.contains("17"))
        PFRLMEqual(expectedString, resultString)
    }
    
    func testSorted() {
        [true, false].forEach {
            let expected = realm.objects(TestObject.self).sorted(SortDescriptor(keyPath: "key", ascending: $0))
            let result = realm.objects(TestObject.self).sorted($0 ? TestObjectSchema.key.ascending() : TestObjectSchema.key.descending())
            PFRLMEqual(expected, result)
        }
    }
    
    func testValue() {
        let expectedInt = realm.objects(TestObject.self).value(forKeyPath: "int") as! [Int]
        let resultInt = realm.objects(TestObject.self).value(TestObjectSchema.int) as! [Int]
        XCTAssertEqual(expectedInt, resultInt)
        
        let expectedString = realm.objects(TestObject.self).value(forKeyPath: "string") as! [String]
        let resultString = realm.objects(TestObject.self).value(TestObjectSchema.string) as! [String]
        XCTAssertEqual(expectedString, resultString)
    }
    
    func testDistinct() {
        let expected = realm.objects(TestObject.self).distinct(by: ["int", "string"])
        let result = realm.objects(TestObject.self).distinct(TestObjectSchema.int, TestObjectSchema.string)
        
        PFRLMEqual(expected, result)
    }
    
    func testMin() {
        let expected: Int = realm.objects(TestObject.self).min(ofProperty: "int")!
        let result: Int = realm.objects(TestObject.self).min(TestObjectSchema.int)!
        
        XCTAssertEqual(expected, result)
    }
    
    func testMax() {
        let expected: Int = realm.objects(TestObject.self).max(ofProperty: "int")!
        let result: Int = realm.objects(TestObject.self).max(TestObjectSchema.int)!
        
        XCTAssertEqual(expected, result)
    }
    
    func testAverage() {
        let expected: Double = realm.objects(TestObject.self).average(ofProperty: "int")!
        let result: Double = realm.objects(TestObject.self).average(TestObjectSchema.int)!
        
        XCTAssertEqual(expected, result)
    }
    
    func testSum() {
        let expected: Int = realm.objects(TestObject.self).sum(ofProperty: "int")
        let result: Int = realm.objects(TestObject.self).sum(TestObjectSchema.int)
        
        XCTAssertEqual(expected, result)
    }
}
