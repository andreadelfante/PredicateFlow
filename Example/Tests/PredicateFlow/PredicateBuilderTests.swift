//
//  PFBuildersTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/05/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class PFBuildersTests: XCTestCase {
    
    func testAnd() {
        XCTAssertEqual(
            NSPredicate(format: "age == nil AND name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .and(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age > 5 AND name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .and(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil OR name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .and(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age > 5 OR name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .and(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil AND NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .and(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "NOT age > 5 AND name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .and(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil OR NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .and(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "NOT age > 5 OR name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .and(DogSchema.name.isEqual("foo"))
                .query()
        )
    }
    
    func testAndNot() {
        XCTAssertEqual(
            NSPredicate(format: "age == nil AND NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .andNot(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age > 5 AND NOT name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .andNot(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil OR name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .andNot(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age > 5 OR name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .andNot(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil AND name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .andNot(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age > 5 AND name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .andNot(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil OR NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .andNot(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "NOT age > 5 OR name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .andNot(DogSchema.name.isEqual("foo"))
                .query()
        )
    }
    
    func testOr() {
        XCTAssertEqual(
            NSPredicate(format: "age == nil OR name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .or(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age > 5 OR name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .or(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil AND name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .or(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age > 5 AND name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .or(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil AND NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .or(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "NOT age > 5 AND name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .or(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil OR NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .or(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "NOT age > 5 OR name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .or(DogSchema.name.isEqual("foo"))
                .query()
        )
    }
    
    func testOrNot() {
        XCTAssertEqual(
            NSPredicate(format: "age == nil OR NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .orNot(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age > 5 OR NOT name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .orNot(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil OR name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .orNot(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "NOT age > 5 OR name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .orNot(DogSchema.name.isEqual("foo"))
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "age == nil AND NOT name != nil", argumentArray: nil),
            PredicateBuilder(DogSchema.age.isNil)
                .orNot(DogSchema.name.isNotNil)
                .query()
        )
        XCTAssertNotEqual(
            NSPredicate(format: "NOT age > 5 AND name == \"foo\""),
            PredicateBuilder(DogSchema.age.isGreater(than: 5))
                .orNot(DogSchema.name.isEqual("foo"))
                .query()
        )
    }
    
    func testGrouping() {
        XCTAssertEqual(
            NSPredicate(format: "(age == nil AND name != nil) OR owner.name != nil"),
            PredicateBuilder(PredicateBuilder(DogSchema.age.isNil).and(DogSchema.name.isNotNil))
                .or(DogSchema.owner.element().name.isNotNil)
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age == nil AND (name != nil OR owner.name != nil)"),
            PredicateBuilder(DogSchema.age.isNil)
                .and(PredicateBuilder(DogSchema.name.isNotNil).or(DogSchema.owner.element().name.isNotNil))
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "(age == nil AND (name != nil AND NOT age < 5)) OR owner.name != nil"),
            PredicateBuilder(
                    PredicateBuilder(DogSchema.age.isNil)
                        .and(
                            PredicateBuilder(DogSchema.name.isNotNil)
                                .andNot(DogSchema.age.isLess(than: 5))
                        )
                )
                .or(DogSchema.owner.element().name.isNotNil)
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age == nil AND (name != nil OR NOT (owner.name != nil AND name == \"foo\"))"),
            PredicateBuilder(DogSchema.age.isNil)
                .and(
                    PredicateBuilder(DogSchema.name.isNotNil)
                        .orNot(
                            PredicateBuilder(DogSchema.owner.element().name.isNotNil)
                                .and(DogSchema.name.is("foo"))
                        )
                )
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age == nil AND (name != nil AND NOT (owner.name != nil AND name == \"foo\"))"),
            PredicateBuilder(DogSchema.age.isNil)
                .and(
                    PredicateBuilder(DogSchema.name.isNotNil)
                        .andNot(
                            PredicateBuilder(DogSchema.owner.element().name.isNotNil)
                                .and(DogSchema.name.is("foo"))
                    )
                )
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age == nil AND (name != nil AND (owner.name != nil AND name == \"foo\"))"),
            PredicateBuilder(DogSchema.age.isNil)
                .and(
                    PredicateBuilder(DogSchema.name.isNotNil)
                        .and(
                            PredicateBuilder(DogSchema.owner.element().name.isNotNil)
                                .and(DogSchema.name.is("foo"))
                    )
                )
                .query()
        )
        XCTAssertEqual(
            NSPredicate(format: "age == nil AND (name != nil OR (owner.name != nil AND name == \"foo\"))"),
            PredicateBuilder(DogSchema.age.isNil)
                .and(
                    PredicateBuilder(DogSchema.name.isNotNil)
                        .or(
                            PredicateBuilder(DogSchema.owner.element().name.isNotNil)
                                .and(DogSchema.name.is("foo"))
                    )
                )
                .query()
        )
    }
    
    func testDescription() {
        let builder = PredicateBuilder(DogSchema.age.isGreater(than: 5))
            .and(DogSchema.name.isEqual("foo"))
        
        XCTAssertEqual("age > 5 AND name == \"foo\"", builder.description)
        XCTAssertEqual(builder.description, builder.debugDescription)
    }
}
