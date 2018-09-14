//
//  SubqueryPropertyTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class SubqueryPropertyTests: XCTestCase {
    
    private var array: [(NSPredicate, NSPredicate)]!
    
    override func setUp() {
        super.setUp()
        array = [
            (
                NSPredicate(format: "SUBQUERY(dogs, $dog, $dog.age != nil).@count > %@", argumentArray: [0]),
                PersonSchema.dogs.subquery("dog") {
                    $0.element().age.isNotNil
                }.count().isGreater(than: 0).predicate
            ),
            (
                NSPredicate(format: "SUBQUERY(dogs, $dog, $dog.age != nil AND $dog.name != nil AND NOT $dog.age > %@ OR $dog.name CONTAINS %@ OR NOT $dog.age == %@).@count > %@", argumentArray: [7, "foo", 7, 0]),
                PersonSchema.dogs.subquery("dog") {
                    $0.compound($0.element().age.isNotNil)
                        .and($0.element().name.isNotNil)
                        .andNot($0.element().age.isGreater(than: 7))
                        .or($0.element().name.contains("foo"))
                        .orNot($0.element().age.is(7))
                    }.count().isGreater(than: 0).predicate
            )
        ]
    }
    
    override func tearDown() {
        array = nil
        super.tearDown()
    }
    
    func testSubquery() {
        array.forEach {
            XCTAssertEqual($0.0, $0.1)
        }
    }
}
