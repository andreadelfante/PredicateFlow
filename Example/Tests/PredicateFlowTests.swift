
import XCTest
import PredicateFlow

class PredicateFlowTests: XCTestCase {
	
	func testPredicateProperty() {
		XCTAssertEqual("age == nil", DogSchema.age.isNil.stringFormat)
		XCTAssertEqual("age != nil", DogSchema.age.isNotNil.stringFormat)
		XCTAssertEqual("name == nil", DogSchema.name.isNil.stringFormat)
		XCTAssertEqual("name != nil", DogSchema.name.isNotNil.stringFormat)
		XCTAssertNotEqual("age == nil", DogSchema.name.isNil.stringFormat)
		XCTAssertNotEqual("age != nil", DogSchema.name.isNotNil.stringFormat)
		XCTAssertNotEqual("name != nil", DogSchema.name.isNil.stringFormat)
		XCTAssertNotEqual("name == nil", DogSchema.name.isNotNil.stringFormat)
	}
	
	func testBasicComparisonQuery() {
		XCTAssertEqual("sex == %@", PersonSchema.sex.isEqual(.male).stringFormat)
		XCTAssertEqual("sex != %@", PersonSchema.sex.isNotEqual(.female).stringFormat)
		XCTAssertEqual("age > %@", DogSchema.age.isGreater(than: 10).stringFormat)
		XCTAssertEqual("age >= %@", DogSchema.age.isGreater(thanOrEqual: 10).stringFormat)
		XCTAssertEqual("age < %@", DogSchema.age.isLess(than: 10).stringFormat)
		XCTAssertEqual("age <= %@", DogSchema.age.isLess(thanOrEqual: 10).stringFormat)
		XCTAssertEqual("name IN %@", PersonSchema.name.in("1", "2").stringFormat)
		XCTAssertEqual("age BETWEEN %@", DogSchema.age.between(1, 10).stringFormat)
        XCTAssertEqual("NOT name IN %@", DogSchema.name.notIn("1", "2").stringFormat)
        XCTAssertEqual("NOT age BETWEEN %@", DogSchema.age.notBetween(1, 10).stringFormat)
		XCTAssertNotEqual("sex != %@", PersonSchema.sex.isEqual(.male).stringFormat)
		XCTAssertNotEqual("sex == %@", PersonSchema.sex.isNotEqual(.female).stringFormat)
		XCTAssertNotEqual("age < %@", DogSchema.age.isGreater(than: 10).stringFormat)
		XCTAssertNotEqual("age <= %@", DogSchema.age.isGreater(thanOrEqual: 10).stringFormat)
		XCTAssertNotEqual("age > %@", DogSchema.age.isLess(than: 10).stringFormat)
		XCTAssertNotEqual("age >= %@", DogSchema.age.isLess(thanOrEqual: 10).stringFormat)
		XCTAssertNotEqual("name BETWEEN %@", PersonSchema.name.in("1", "2").stringFormat)
		XCTAssertNotEqual("age IN %@", DogSchema.age.between(1, 10).stringFormat)
		XCTAssertNotEqual("age == %@", PersonSchema.sex.isEqual(.male).stringFormat)
		XCTAssertNotEqual("age != %@", PersonSchema.sex.isNotEqual(.female).stringFormat)
		XCTAssertNotEqual("sex > %@", DogSchema.age.isGreater(than: 10).stringFormat)
		XCTAssertNotEqual("sex >= %@", DogSchema.age.isGreater(thanOrEqual: 10).stringFormat)
		XCTAssertNotEqual("sex < %@", DogSchema.age.isLess(than: 10).stringFormat)
		XCTAssertNotEqual("name <= %@", DogSchema.age.isLess(thanOrEqual: 10).stringFormat)
		XCTAssertNotEqual("age IN %@", PersonSchema.name.in("1", "2").stringFormat)
		XCTAssertNotEqual("name BETWEEN %@", DogSchema.age.between(1, 10).stringFormat)
        XCTAssertNotEqual("NOT age IN %@", PersonSchema.name.notIn("1", "2").stringFormat)
        XCTAssertNotEqual("NOT name BETWEEN %@", DogSchema.age.notBetween(2, 3).stringFormat)
        XCTAssertNotEqual("age IN %@", DogSchema.age.notIn(1, 2).stringFormat)
        XCTAssertNotEqual("name BETWEEN %@", DogSchema.name.notBetween("1", "2").stringFormat)
	}
	
	func testStringComparisonQuery() {
		XCTAssertEqual("name BEGINSWITH %@", DogSchema.name.begins(with: "C").stringFormat)
		XCTAssertEqual("name CONTAINS %@", DogSchema.name.contains("C").stringFormat)
		XCTAssertEqual("name ENDSWITH %@", DogSchema.name.ends(with: "C").stringFormat)
		XCTAssertEqual("name LIKE %@", DogSchema.name.like("C").stringFormat)
		XCTAssertEqual("name MATCHES %@", DogSchema.name.matches("C").stringFormat)
        XCTAssertEqual("NOT name BEGINSWITH %@", DogSchema.name.notBegins(with: "C").stringFormat)
        XCTAssertEqual("NOT name CONTAINS %@", DogSchema.name.notContains("C").stringFormat)
        XCTAssertEqual("NOT name ENDSWITH %@", DogSchema.name.notEnds(with: "C").stringFormat)
        XCTAssertEqual("NOT name LIKE %@", DogSchema.name.notLike("C").stringFormat)
        XCTAssertEqual("NOT name MATCHES %@", DogSchema.name.notMatches("C").stringFormat)
		XCTAssertEqual("name BEGINSWITH[c] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive).stringFormat)
		XCTAssertEqual("name CONTAINS[c] %@", DogSchema.name.contains("c", options: .caseInsensitive).stringFormat)
		XCTAssertEqual("name ENDSWITH[c] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive).stringFormat)
		XCTAssertEqual("name LIKE[c] %@", DogSchema.name.like("c", options: .caseInsensitive).stringFormat)
		XCTAssertEqual("name MATCHES[c] %@", DogSchema.name.matches("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name BEGINSWITH[c] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name CONTAINS[c] %@", DogSchema.name.notContains("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name ENDSWITH[c] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name LIKE[c] %@", DogSchema.name.notLike("c", options: .caseInsensitive).stringFormat)
        XCTAssertEqual("NOT name MATCHES[c] %@", DogSchema.name.notMatches("c", options: .caseInsensitive).stringFormat)
		XCTAssertEqual("name BEGINSWITH[cd] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertEqual("name CONTAINS[cd] %@", DogSchema.name.contains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertEqual("name ENDSWITH[cd] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertEqual("name LIKE[cd] %@", DogSchema.name.like("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertEqual("name MATCHES[cd] %@", DogSchema.name.matches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertEqual("NOT name BEGINSWITH[cd] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertEqual("NOT name CONTAINS[cd] %@", DogSchema.name.notContains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertEqual("NOT name ENDSWITH[cd] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertEqual("NOT name LIKE[cd] %@", DogSchema.name.notLike("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertEqual("NOT name MATCHES[cd] %@", DogSchema.name.notMatches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertNotEqual("age BEGINSWITH %@", DogSchema.name.begins(with: "C").stringFormat)
		XCTAssertNotEqual("age CONTAINS %@", DogSchema.name.contains("C").stringFormat)
		XCTAssertNotEqual("age ENDSWITH %@", DogSchema.name.ends(with: "C").stringFormat)
		XCTAssertNotEqual("age LIKE %@", DogSchema.name.like("C").stringFormat)
		XCTAssertNotEqual("age MATCHES %@", DogSchema.name.matches("C").stringFormat)
        XCTAssertNotEqual("NOT age BEGINSWITH %@", DogSchema.name.notBegins(with: "C").stringFormat)
        XCTAssertNotEqual("NOT age CONTAINS %@", DogSchema.name.notContains("C").stringFormat)
        XCTAssertNotEqual("NOT age ENDSWITH %@", DogSchema.name.notEnds(with: "C").stringFormat)
        XCTAssertNotEqual("NOT age LIKE %@", DogSchema.name.notLike("C").stringFormat)
        XCTAssertNotEqual("NOT age MATCHES %@", DogSchema.name.notMatches("C").stringFormat)
		XCTAssertNotEqual("name BEGINSWITH[d] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive).stringFormat)
		XCTAssertNotEqual("name CONTAINS[d] %@", DogSchema.name.contains("c", options: .caseInsensitive).stringFormat)
		XCTAssertNotEqual("name ENDSWITH[d] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive).stringFormat)
		XCTAssertNotEqual("name LIKE[d] %@", DogSchema.name.like("c", options: .caseInsensitive).stringFormat)
		XCTAssertNotEqual("name MATCHES[d] %@", DogSchema.name.matches("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name BEGINSWITH[d] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name CONTAINS[d] %@", DogSchema.name.notContains("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name ENDSWITH[d] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name LIKE[d] %@", DogSchema.name.notLike("c", options: .caseInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name MATCHES[d] %@", DogSchema.name.notMatches("c", options: .caseInsensitive).stringFormat)
		XCTAssertNotEqual("name BEGINSWITH[dc] %@", DogSchema.name.begins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertNotEqual("name CONTAINS[dc] %@", DogSchema.name.contains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertNotEqual("name ENDSWITH[dc] %@", DogSchema.name.ends(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertNotEqual("name LIKE[dc] %@", DogSchema.name.like("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
		XCTAssertNotEqual("name MATCHES[dc] %@", DogSchema.name.matches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name BEGINSWITH[dc] %@", DogSchema.name.notBegins(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name CONTAINS[dc] %@", DogSchema.name.notContains("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name ENDSWITH[dc] %@", DogSchema.name.notEnds(with: "c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name LIKE[dc] %@", DogSchema.name.notLike("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
        XCTAssertNotEqual("NOT name MATCHES[dc] %@", DogSchema.name.notMatches("c", options: .caseInsensitive, .dialisticInsensitive).stringFormat)
	}
	
	func testBoolPredicateProperty() {
		XCTAssertEqual("isHungry == nil", DogSchema.isHungry.isNil.stringFormat)
		XCTAssertEqual("isHungry != nil", DogSchema.isHungry.isNotNil.stringFormat)
		XCTAssertEqual("isHungry == %@", DogSchema.isHungry.isTrue.stringFormat)
		XCTAssertEqual("isHungry == %@", DogSchema.isHungry.isFalse.stringFormat)
		XCTAssertNotEqual("isHungry != nil", DogSchema.isHungry.isTrue.stringFormat)
		XCTAssertNotEqual("isHungry == nil", DogSchema.isHungry.isFalse.stringFormat)
		XCTAssertNotEqual("isHungry == %@", DogSchema.isHungry.isNil.stringFormat)
		XCTAssertNotEqual("isHungry == %@", DogSchema.isHungry.isNotNil.stringFormat)
	}
	
	func testObjectProperty() {
		XCTAssertEqual("owner.name == nil", DogSchema.owner.element().name.isNil.stringFormat)
		XCTAssertEqual("owner.dogs.@max.age > %@", DogSchema.owner.element().dogs.maxElements().age.isGreater(than: 10).stringFormat)
		XCTAssertEqual("owner.dogs.@sum > %@", DogSchema.owner.element().dogs.sum().isGreater(than: 10).stringFormat)
		XCTAssertNotEqual("owner.name != nil", DogSchema.owner.element().name.isNil.stringFormat)
		XCTAssertNotEqual("owner.dogs.@max.age < %@", DogSchema.owner.element().dogs.maxElements().age.isGreater(than: 10).stringFormat)
		XCTAssertNotEqual("owner.dogs.@avg > %@", DogSchema.owner.element().dogs.sum().isGreater(than: 10).stringFormat)
	}
	
	func testCollectionProperty() {
		XCTAssertEqual("ANY dogs.age > %@", PersonSchema.dogs.anyElements().age.isGreater(than: 10).stringFormat)
		XCTAssertEqual("SOME dogs.age < %@", PersonSchema.dogs.someElements().age.isLess(than: 1).stringFormat)
		XCTAssertEqual("ALL dogs.age >= %@", PersonSchema.dogs.allElements().age.isGreater(thanOrEqual: 10).stringFormat)
		XCTAssertEqual("NONE dogs.age >= %@", PersonSchema.dogs.noneElements().age.isGreater(thanOrEqual: 10).stringFormat)
		XCTAssertNotEqual("SOME dogs.age > %@", PersonSchema.dogs.anyElements().age.isGreater(than: 10).stringFormat)
		XCTAssertNotEqual("NONE dogs.age < %@", PersonSchema.dogs.someElements().age.isLess(than: 1).stringFormat)
		XCTAssertNotEqual("ANY dogs.age >= %@", PersonSchema.dogs.allElements().age.isGreater(thanOrEqual: 10).stringFormat)
		XCTAssertNotEqual("ALL dogs.age >= %@", PersonSchema.dogs.noneElements().age.isGreater(thanOrEqual: 10).stringFormat)
	}
    
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
