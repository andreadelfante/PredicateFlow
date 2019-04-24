//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
    The basic protocol for something that represents a predicate field.
*/
public protocol PredicateField: CustomStringConvertible {

    /**
        The predicate field name.
    */
    var name: String { get }
}

public extension PredicateField {

    /**
        Alias of name.

        - returns: The key path of this field.
    */
	func keyPath() -> String {
		return self.name
	}

    var description: String {
        return keyPath()
    }
}

/**
    A predicate field that allows to concatenate parents fields.
*/
public class CompoundablePredicateField: PredicateField {

	internal var compoundFieldBuilder: CompoundFieldBuilder

    /**
        Create a new CompoundablePredicateField.

        - parameter name: The field name.
    */
	convenience init(_ name: String) {
		self.init(name, CompoundFieldBuilder())
	}

    /**
        Create a new CompoundablePredicateField.

        - parameter name: The field name.
        - parameter compoundFieldBuilder: The prev builder to concatenate this field name.
    */
	convenience init(_ name: String, _ compoundFieldBuilder: CompoundFieldBuilder) {
		self.init(compoundFieldBuilder)
		compoundFieldBuilder.append(name)
	}

	/**
		Create a new CompoundablePredicateField.
	
		- parameter compoundFieldBuilder: The prev builder to concatenate this field name.
	*/
	init(_ compoundFieldBuilder: CompoundFieldBuilder) {
		self.compoundFieldBuilder = compoundFieldBuilder
	}

	public var name: String {
		return compoundFieldBuilder.field().name
	}

	/**
	Create a query checking if this property is nil.
	*/
	public var isNil: PredicateResult {
		return BasicComparisonQuery<Any>(self).isNil()
	}

	/**
	Create a query checking if this property is not nil.
	*/
	public var isNotNil: PredicateResult {
		return BasicComparisonQuery<Any>(self).isNotNil()
	}
}
