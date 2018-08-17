//
//  BasicComparisonQueryTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class BasicComparisonQueryTests: XCTestCase {
    
    func testIsEqual() {
        XCTAssertEqual("sex == %@", PersonSchema.sex.isEqual(.male).stringFormat)
        XCTAssertNotEqual("sex == %@", PersonSchema.sex.isNotEqual(.female).stringFormat)
        XCTAssertNotEqual("age == %@", PersonSchema.sex.isEqual(.male).stringFormat)
    }
    
    func testIs() {
        XCTAssertEqual("sex == %@", PersonSchema.sex.is(.male).stringFormat)
        XCTAssertNotEqual("sex == %@", PersonSchema.sex.isNot(.female).stringFormat)
        XCTAssertNotEqual("age == %@", PersonSchema.sex.is(.male).stringFormat)
    }
    
    func testStaticEqual() {
        XCTAssertEqual("sex == %@", (PersonSchema.sex == .male).stringFormat)
        XCTAssertNotEqual("sex == %@", (PersonSchema.sex != .female).stringFormat)
        XCTAssertNotEqual("age == %@", (PersonSchema.sex == .male).stringFormat)
    }

    func testIsNotEqual() {
        XCTAssertEqual("sex != %@", PersonSchema.sex.isNotEqual(.female).stringFormat)
        XCTAssertNotEqual("sex != %@", PersonSchema.sex.isEqual(.male).stringFormat)
        XCTAssertNotEqual("age != %@", PersonSchema.sex.isNotEqual(.female).stringFormat)
    }
    
    func testIsNot() {
        XCTAssertEqual("sex != %@", PersonSchema.sex.isNot(.female).stringFormat)
        XCTAssertNotEqual("sex != %@", PersonSchema.sex.is(.male).stringFormat)
        XCTAssertNotEqual("age != %@", PersonSchema.sex.isNot(.female).stringFormat)
    }
    
    func testStaticNotEqual() {
        XCTAssertEqual("sex != %@", (PersonSchema.sex != .female).stringFormat)
        XCTAssertNotEqual("sex != %@", (PersonSchema.sex == .male).stringFormat)
        XCTAssertNotEqual("age != %@", (PersonSchema.sex != .female).stringFormat)
    }
    
    func testIn() {
        XCTAssertEqual("name IN %@", PersonSchema.name.in("1", "2").stringFormat)
        XCTAssertNotEqual("age IN %@", DogSchema.age.between(1, 10).stringFormat)
        XCTAssertNotEqual("age IN %@", DogSchema.age.notIn(1, 2).stringFormat)
        XCTAssertNotEqual("age IN %@", PersonSchema.name.in("1", "2").stringFormat)
    }
    
    func testNotIn() {
        XCTAssertEqual("NOT name IN %@", DogSchema.name.notIn("1", "2").stringFormat)
        XCTAssertNotEqual("NOT age IN %@", PersonSchema.name.notIn("1", "2").stringFormat)
    }
    
    func testIsGreaterThan() {
        XCTAssertEqual("age > %@", DogSchema.age.isGreater(than: 10).stringFormat)
        XCTAssertNotEqual("age > %@", DogSchema.age.isLess(than: 10).stringFormat)
        XCTAssertNotEqual("sex > %@", DogSchema.age.isGreater(than: 10).stringFormat)
    }
    
    func testStaticIsGreaterThan() {
        XCTAssertEqual("age > %@", (DogSchema.age > 10).stringFormat)
        XCTAssertNotEqual("age > %@", (DogSchema.age < 10).stringFormat)
        XCTAssertNotEqual("sex > %@", (DogSchema.age > 10).stringFormat)
    }
    
    func testIsGreaterThanOrEqual() {
        XCTAssertEqual("age >= %@", DogSchema.age.isGreater(thanOrEqual: 10).stringFormat)
        XCTAssertNotEqual("age >= %@", DogSchema.age.isLess(thanOrEqual: 10).stringFormat)
        XCTAssertNotEqual("sex >= %@", DogSchema.age.isGreater(thanOrEqual: 10).stringFormat)
    }
    
    func testStaticIsGreaterThanOrEqual() {
        XCTAssertEqual("age >= %@", (DogSchema.age >=  10).stringFormat)
        XCTAssertNotEqual("age >= %@", (DogSchema.age <= 10).stringFormat)
        XCTAssertNotEqual("sex >= %@", (DogSchema.age >= 10).stringFormat)
    }
    
    func testIsLessThan() {
        XCTAssertEqual("age < %@", DogSchema.age.isLess(than: 10).stringFormat)
        XCTAssertNotEqual("age < %@", DogSchema.age.isGreater(than: 10).stringFormat)
        XCTAssertNotEqual("sex < %@", DogSchema.age.isLess(than: 10).stringFormat)
    }
    
    func testStaticIsLessThan() {
        XCTAssertEqual("age < %@", (DogSchema.age < 10).stringFormat)
        XCTAssertNotEqual("age < %@", (DogSchema.age > 10).stringFormat)
        XCTAssertNotEqual("sex < %@", (DogSchema.age < 10).stringFormat)
    }
    
    func testIsLessThanOrEqual() {
        XCTAssertEqual("age <= %@", DogSchema.age.isLess(thanOrEqual: 10).stringFormat)
        XCTAssertNotEqual("age <= %@", DogSchema.age.isGreater(thanOrEqual: 10).stringFormat)
        XCTAssertNotEqual("name <= %@", DogSchema.age.isLess(thanOrEqual: 10).stringFormat)
    }
    
    func testStaticIsLessThanOrEqual() {
        XCTAssertEqual("age <= %@", (DogSchema.age <= 10).stringFormat)
        XCTAssertNotEqual("age <= %@", (DogSchema.age >= 10).stringFormat)
        XCTAssertNotEqual("name <= %@", (DogSchema.age <= 10).stringFormat)
    }
    
    func testBetween() {
        XCTAssertEqual("age BETWEEN %@", DogSchema.age.between(1, 10).stringFormat)
        XCTAssertNotEqual("name BETWEEN %@", PersonSchema.name.in("1", "2").stringFormat)
        XCTAssertNotEqual("name BETWEEN %@", DogSchema.age.between(1, 10).stringFormat)
        XCTAssertNotEqual("name BETWEEN %@", DogSchema.name.notBetween("1", "2").stringFormat)
    }
    
    func testNotBetween() {
        XCTAssertEqual("NOT age BETWEEN %@", DogSchema.age.notBetween(1, 10).stringFormat)
        XCTAssertNotEqual("NOT name BETWEEN %@", DogSchema.age.notBetween(2, 3).stringFormat)
    }
}
