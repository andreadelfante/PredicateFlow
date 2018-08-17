//
//  ObjectPropertyTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class ObjectPropertyTests: XCTestCase {
    
    func testElement() {
        XCTAssertEqual("owner.name == nil", DogSchema.owner.element().name.isNil.stringFormat)
        XCTAssertEqual("owner.dogs.@max.age > %@", DogSchema.owner.element().dogs.maxElements().age.isGreater(than: 10).stringFormat)
        XCTAssertEqual("owner.dogs.@sum > %@", DogSchema.owner.element().dogs.sum().isGreater(than: 10).stringFormat)
        XCTAssertNotEqual("owner.name != nil", DogSchema.owner.element().name.isNil.stringFormat)
        XCTAssertNotEqual("owner.dogs.@max.age < %@", DogSchema.owner.element().dogs.maxElements().age.isGreater(than: 10).stringFormat)
        XCTAssertNotEqual("owner.dogs.@avg > %@", DogSchema.owner.element().dogs.sum().isGreater(than: 10).stringFormat)
    }
}
