//
//  PredicateQuery.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
The basic protocol for something that represents a predicate query.
*/
public protocol PredicateQuery {
	
	/**
	The field of this query.
	*/
	var field: PredicateField { get }
}

extension PredicateQuery {
	
	/**
	Create a query checking if this property is nil.
	
	- returns: a predicate result.
	*/
	func isNil() -> PredicateResult {
		return ConcretePredicateResult("\(field) == nil")
	}
	
	/**
	Create a query checking if this property is not nil.
	
	- returns: a predicate result.
	*/
	func isNotNil() -> PredicateResult {
		return ConcretePredicateResult("\(field) != nil")
	}
}
