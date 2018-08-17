//
//  StringComparisonQueryTests.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 09/08/2018.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import XCTest
import PredicateFlow

class StringComparisonQueryTests: XCTestCase {
    
    func testBeginsWith() {
        XCTAssertEqual("name BEGINSWITH %@", DogSchema.name.begins(with: "C").stringFormat)
        XCTAssertEqual("name BEGINSWITH[c] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("name BEGINSWITH[cd] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("age BEGINSWITH %@", DogSchema.name.begins(with: "C").stringFormat)
        XCTAssertNotEqual("name BEGINSWITH[d] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("name BEGINSWITH[dc] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testNotBeginsWith() {
        XCTAssertEqual("NOT name BEGINSWITH %@", DogSchema.name.notBegins(with: "C").stringFormat)
        XCTAssertNotEqual("NOT age BEGINSWITH %@", DogSchema.name.notBegins(with: "C").stringFormat)
        XCTAssertEqual("NOT name BEGINSWITH[c] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name BEGINSWITH[cd] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name BEGINSWITH[d] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name BEGINSWITH[dc] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testContains() {
        XCTAssertEqual("name CONTAINS %@", DogSchema.name.contains("C").stringFormat)
        XCTAssertEqual("name CONTAINS[c] %@", DogSchema.name.contains("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("name CONTAINS[cd] %@", DogSchema.name.contains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("age CONTAINS %@", DogSchema.name.contains("C").stringFormat)
        XCTAssertNotEqual("name CONTAINS[d] %@", DogSchema.name.contains("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("name CONTAINS[dc] %@", DogSchema.name.contains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testNotContains() {
        XCTAssertEqual("NOT name CONTAINS %@", DogSchema.name.notContains("C").stringFormat)
        XCTAssertEqual("NOT name CONTAINS[c] %@", DogSchema.name.notContains("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name CONTAINS[cd] %@", DogSchema.name.notContains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT age CONTAINS %@", DogSchema.name.notContains("C").stringFormat)
        XCTAssertNotEqual("NOT name CONTAINS[d] %@", DogSchema.name.notContains("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name CONTAINS[dc] %@", DogSchema.name.notContains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testEndsWith() {
        XCTAssertEqual("name ENDSWITH %@", DogSchema.name.ends(with: "C").stringFormat)
        XCTAssertEqual("name ENDSWITH[c] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("name ENDSWITH[cd] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("age ENDSWITH %@", DogSchema.name.ends(with: "C").stringFormat)
        XCTAssertNotEqual("name ENDSWITH[d] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("name ENDSWITH[dc] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testNotEndsWith() {
        XCTAssertEqual("NOT name ENDSWITH %@", DogSchema.name.notEnds(with: "C").stringFormat)
        XCTAssertEqual("NOT name ENDSWITH[c] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name ENDSWITH[cd] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT age ENDSWITH %@", DogSchema.name.notEnds(with: "C").stringFormat)
        XCTAssertNotEqual("NOT name ENDSWITH[d] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name ENDSWITH[dc] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testLike() {
        XCTAssertEqual("name LIKE %@", DogSchema.name.like("C").stringFormat)
        XCTAssertEqual("name LIKE[c] %@", DogSchema.name.like("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("name LIKE[cd] %@", DogSchema.name.like("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("age LIKE %@", DogSchema.name.like("C").stringFormat)
        XCTAssertNotEqual("name LIKE[d] %@", DogSchema.name.like("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("name LIKE[dc] %@", DogSchema.name.like("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testNotLike() {
        XCTAssertEqual("NOT name LIKE %@", DogSchema.name.notLike("C").stringFormat)
        XCTAssertEqual("NOT name LIKE[c] %@", DogSchema.name.notLike("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name LIKE[cd] %@", DogSchema.name.notLike("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT age LIKE %@", DogSchema.name.notLike("C").stringFormat)
        XCTAssertNotEqual("NOT name LIKE[d] %@", DogSchema.name.notLike("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name LIKE[dc] %@", DogSchema.name.notLike("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testMatches() {
        XCTAssertEqual("name MATCHES %@", DogSchema.name.matches("C").stringFormat)
        XCTAssertEqual("name MATCHES[c] %@", DogSchema.name.matches("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("name MATCHES[cd] %@", DogSchema.name.matches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("age MATCHES %@", DogSchema.name.matches("C").stringFormat)
        XCTAssertNotEqual("name MATCHES[d] %@", DogSchema.name.matches("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("name MATCHES[dc] %@", DogSchema.name.matches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
    
    func testNotMatches() {
        XCTAssertEqual("NOT name MATCHES %@", DogSchema.name.notMatches("C").stringFormat)
        XCTAssertEqual("NOT name MATCHES[c] %@", DogSchema.name.notMatches("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name MATCHES[cd] %@", DogSchema.name.notMatches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT age MATCHES %@", DogSchema.name.notMatches("C").stringFormat)
        XCTAssertNotEqual("NOT name MATCHES[d] %@", DogSchema.name.notMatches("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name MATCHES[dc] %@", DogSchema.name.notMatches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
    }
}
