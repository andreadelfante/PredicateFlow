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
    
    func testSubquery() {
        XCTAssertEqual(
            "SUBQUERY(dogs, $dog, $dog.age != nil).@count > %@",
            PersonSchema.dogs.subquery("dog") {
                $0.element().age.isNotNil
                }.count().isGreater(than: 0).stringFormat
        )
        XCTAssertEqual(
            "SUBQUERY(dogs, $dog, $dog.age != nil AND $dog.name != nil).@count > %@",
            PersonSchema.dogs.subquery("dog") {
                $0.compound($0.element().age.isNotNil)
                    .and($0.element().name.isNotNil)
                }.count().isGreater(than: 0).stringFormat
        )
    }
}
