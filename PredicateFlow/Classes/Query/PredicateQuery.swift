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
public protocol PredicateQuery: FlowNillable {

	/**
	The field of this query.
	*/
	var field: PredicateField { get }
}

extension PredicateQuery {

	public func isNil() -> PredicateResult {
		return ConcretePredicateResult("\(field) == nil")
	}

	public func isNotNil() -> PredicateResult {
		return ConcretePredicateResult("\(field) != nil")
	}
}
