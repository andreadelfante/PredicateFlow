//
//  PredicateFlowRealmBaseTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow
import RealmSwift

class PredicateFlowRealmBaseTests: XCTestCase {
    
    var realm: Realm!
    
    override func setUp() {
        super.setUp()
        
        realm = try! Realm(configuration: Realm.Configuration(inMemoryIdentifier: "PredicateFlowRealmBaseTests-Realm"))
        
        var children = [TestObject]()
        try! realm.write {
            for i in rangeOfElementsInRealm() {
                let element = TestObject(key: i, string: "\(i)", int: i)
                element.children.append(objectsIn: children)
                
                realm.add(element)
                
                children.append(element)
            }
        }
    }
    
    override func tearDown() {
        super.tearDown()
        
        try! realm.write {
            realm.deleteAll()
        }
        realm = nil
    }
    
    func rangeOfElementsInRealm() -> CountableRange<Int> {
        return 0..<100
    }
}

func PFRLMEqual<T: Object>(_ lhs: Results<T>, _ rhs: Results<T>) {
    XCTAssertTrue(lhs.count == rhs.count)
    
    for i in 0..<lhs.count {
        XCTAssertTrue(lhs[i] == rhs[i])
    }
}

func PFRLMEqual<T: Object>(_ lhs: List<T>, _ rhs: List<T>) {
    XCTAssertTrue(lhs.count == rhs.count)
    
    for i in 0..<lhs.count {
        XCTAssertTrue(lhs[i] == rhs[i])
    }
}
