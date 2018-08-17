//
//  BoolPredicatePropertyTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class BoolPredicatePropertyTests: XCTestCase {
    
    func testNil() {
        XCTAssertEqual("isHungry == nil", DogSchema.isHungry.isNil.stringFormat)
        XCTAssertNotEqual("isHungry == nil", DogSchema.isHungry.isNotNil.stringFormat)
    }
    
    func testNotNil() {
        XCTAssertEqual("isHungry != nil", DogSchema.isHungry.isNotNil.stringFormat)
        XCTAssertNotEqual("isHungry != nil", DogSchema.isHungry.isNil.stringFormat)
    }
    
    func testIsTrue() {
        XCTAssertEqual("isHungry == %@", DogSchema.isHungry.isTrue.stringFormat)
        XCTAssertNotEqual("isHungry == %@", DogSchema.isHungry.isNil.stringFormat)
    }
    
    func testIsFalse() {
        XCTAssertEqual("isHungry == %@", DogSchema.isHungry.isFalse.stringFormat)
        XCTAssertNotEqual("isHungry == %@", DogSchema.isHungry.isNotNil.stringFormat)
    }
    
    func testStaticEqual() {
        XCTAssertEqual("isHungry == %@", (DogSchema.isHungry == true).stringFormat)
        XCTAssertEqual("isHungry == %@", (DogSchema.isHungry == false).stringFormat)
    }
}
