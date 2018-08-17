//
//  BoolPredicateProperty.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 24/02/18.
//

import Foundation

/**
    Defines a bool predicate property.
*/
public class BoolPredicateProperty: CompoundablePredicateField {

    /**
        Create a query checking if this property is true.
    */
	public var isTrue: PredicateResult {
		return BasicComparisonQuery<Bool>(self).isEqual(true)
	}

    /**
        Create a query checking if this property is false.
    */
	public var isFalse: PredicateResult {
		return BasicComparisonQuery<Bool>(self).isEqual(false)
	}

	public static func ==(lhs: BoolPredicateProperty, rhs: Bool) -> PredicateResult {
		return rhs ? lhs.isTrue : lhs.isFalse
	}
}
