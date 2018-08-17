//
//  CollectionPropertyTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class CollectionPropertyTests: XCTestCase {
    
    func testIsEmpty() {
        XCTAssertEqual("dogs.@count == %@", PersonSchema.dogs.isEmpty.stringFormat)
        XCTAssertNotEqual("dogs.@count > %@", PersonSchema.dogs.isEmpty.stringFormat)
    }
    
    func testAvg() {
        XCTAssertEqual("dogs.@avg == %@", PersonSchema.dogs.avg().is(1).stringFormat)
        XCTAssertEqual("dogs.@avg.age == %@", PersonSchema.dogs.avgElements().age.is(1).stringFormat)
        XCTAssertNotEqual("dogs.@avg.age == %@", PersonSchema.dogs.avgElements().name.is("1").stringFormat)
        XCTAssertNotEqual("dogs.@some.age == %@",PersonSchema.dogs.avgElements().age.is(1).stringFormat)
    }
    
    func testCount() {
        XCTAssertEqual("dogs.@count == %@", PersonSchema.dogs.count().is(1).stringFormat)
        XCTAssertEqual("dogs.@count.name == %@", PersonSchema.dogs.countElements().name.is("example").stringFormat)
        XCTAssertNotEqual("dogs.@count.name == %@", PersonSchema.dogs.minElements().name.is("example").stringFormat)
        XCTAssertNotEqual("dogs.@min.age == %@",
            PersonSchema.dogs.countElements().age.isEqual(1).stringFormat)
    }
    
    func testMin() {
        XCTAssertEqual("dogs.@min == %@", PersonSchema.dogs.min().is(1).stringFormat)
        XCTAssertEqual("dogs.@min.age == %@", PersonSchema.dogs.minElements().age.isEqual(1).stringFormat)
        XCTAssertNotEqual("dogs.@max.age == %@", PersonSchema.dogs.minElements().age.is(1).stringFormat)
        XCTAssertNotEqual("dogs.@min.age == %@", PersonSchema.dogs.maxElements().age.isEqual(1).stringFormat)
    }
    
    func testMax() {
        XCTAssertEqual("dogs.@max == %@", PersonSchema.dogs.max().is(1).stringFormat)
        XCTAssertEqual("dogs.@max.age == %@", PersonSchema.dogs.maxElements().age.isEqual(1).stringFormat)
        XCTAssertNotEqual("dogs.@min.age == %@", PersonSchema.dogs.maxElements().age.is(1).stringFormat)
        XCTAssertNotEqual("dogs.@max.age == %@", PersonSchema.dogs.minElements().age.isEqual(1).stringFormat)
    }
    
    func testSum() {
        XCTAssertEqual("dogs.@sum == %@", PersonSchema.dogs.sum().is(1).stringFormat)
        XCTAssertEqual("dogs.@sum.age == %@", PersonSchema.dogs.sumElements().age.isEqual(11).stringFormat)
        XCTAssertNotEqual("dogs.@count.age == %@", PersonSchema.dogs.sumElements().age.is(1).stringFormat)
        XCTAssertNotEqual("dogs.@sum.age == %@", PersonSchema.dogs.countElements().age.isEqual(1).stringFormat)
    }
    
    func testAny() {
        XCTAssertEqual("ANY dogs.age > %@", PersonSchema.dogs.anyElements().age.isGreater(than: 10).stringFormat)
        XCTAssertEqual("ANY attributes == %@", PersonSchema.attributes.anyStrings().is("example").stringFormat)
        XCTAssertNotEqual("ANY dogs.age >= %@", PersonSchema.dogs.allElements().age.isGreater(thanOrEqual: 10).stringFormat)
        XCTAssertNotEqual("ANY attributes == %@", PersonSchema.attributes.allStrings().is("example").stringFormat)
    }
    
    func testSome() {
        XCTAssertEqual("SOME dogs.age < %@", PersonSchema.dogs.someElements().age.isLess(than: 1).stringFormat)
        XCTAssertEqual("SOME attributes == %@", PersonSchema.attributes.someStrings().is("example").stringFormat)
        XCTAssertNotEqual("SOME dogs.age > %@", PersonSchema.dogs.anyElements().age.isGreater(than: 10).stringFormat)
        XCTAssertNotEqual("SOME attributes == %@", PersonSchema.attributes.anyStrings().is("example").stringFormat)
    }
    
    func testAll() {
        XCTAssertEqual("ALL dogs.age >= %@", PersonSchema.dogs.allElements().age.isGreater(thanOrEqual: 10).stringFormat)
        XCTAssertEqual("ALL attributes == %@", PersonSchema.attributes.allStrings().is("example").stringFormat)
        XCTAssertNotEqual("ALL dogs.age >= %@", PersonSchema.dogs.noneElements().age.isGreater(thanOrEqual: 10).stringFormat)
        XCTAssertNotEqual("ALL attributes == %@", PersonSchema.attributes.noneStrings().is("example").stringFormat)
    }
    
    func testNone() {
        XCTAssertEqual("NONE dogs.age >= %@", PersonSchema.dogs.noneElements().age.isGreater(thanOrEqual: 10).stringFormat)
        XCTAssertEqual("NONE attributes == %@", PersonSchema.attributes.noneStrings().is("example").stringFormat)
        XCTAssertNotEqual("NONE dogs.age < %@", PersonSchema.dogs.someElements().age.isLess(than: 1).stringFormat)
        XCTAssertNotEqual("NONE attributes == %@", PersonSchema.attributes.someStrings().is("example").stringFormat)
    }
    
    func testSubquery() {
        let attributeName = "random_element_name"
        let query = PersonSchema.dogs.subquery { $0.element().name.is("foo") }.isEmpty.stringFormat
        let attributeQuery = PersonSchema.dogs.subquery(attributeName, { $0.element().name.is("foo") }).isEmpty.stringFormat
        
        XCTAssertEqual("SUBQUERY(dogs, $\(attributeName), $\(attributeName).name == \"foo\").@count == %@", query)
        XCTAssertEqual(attributeQuery, query)
    }
}
