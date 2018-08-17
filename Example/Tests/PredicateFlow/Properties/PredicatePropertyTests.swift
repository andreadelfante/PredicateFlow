//
//  PredicatePropertyTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class PredicatePropertyTests: XCTestCase {

    func testNil() {
        XCTAssertEqual("age == nil", DogSchema.age.isNil.stringFormat)
        XCTAssertEqual("name == nil", DogSchema.name.isNil.stringFormat)
        XCTAssertNotEqual("age == nil", DogSchema.name.isNil.stringFormat)
        XCTAssertNotEqual("name == nil", DogSchema.name.isNotNil.stringFormat)
    }
    
    func testNotNil() {
        XCTAssertEqual("age != nil", DogSchema.age.isNotNil.stringFormat)
        XCTAssertEqual("name != nil", DogSchema.name.isNotNil.stringFormat)
        XCTAssertNotEqual("age != nil", DogSchema.name.isNotNil.stringFormat)
        XCTAssertNotEqual("name != nil", DogSchema.name.isNil.stringFormat)
    }
}
