//
//  PredicateFieldTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class PredicateFieldTests: XCTestCase {
    
    func testName() {
        XCTAssertEqual("name", PersonSchema.name.name)
        XCTAssertEqual("attributes", PersonSchema.attributes.name)
        XCTAssertEqual("dogs.name", PersonSchema.dogs.elements().name.name)
        XCTAssertEqual("age", DogSchema.age.name)
        XCTAssertEqual("isHungry", DogSchema.isHungry.name)
        XCTAssertEqual("owner.birth", DogSchema.owner.element().birth.name)
    }
}
