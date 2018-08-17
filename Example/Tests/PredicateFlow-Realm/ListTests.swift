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
}
