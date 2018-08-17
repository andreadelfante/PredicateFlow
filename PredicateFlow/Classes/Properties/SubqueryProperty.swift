//
//  SubqueryProperty.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 21/02/18.
//

import Foundation

/**
	Defines a subquery predicate property.
*/
public struct SubqueryProperty<T: GeneratedPredicateSchema>: PredicateField {

    /// The name of this subquery property
	public private(set) var name: String

	init(_ name: String) {
		self.name = "$\(name)"
	}

	/**
	Get the element schema of this subquery property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current element schema of this property.
	*/
	public func element() -> T {
		return T.init(compoundFieldBuilder: CompoundFieldBuilder().append(name))
	}

    /**
     Begin to compound multiple predicate queries with logical operators.
     **WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
     
     - returns: a compoundable predicate query.
     */
    public func compound(_ predicateQuery: PredicateResult) -> (CompoundablePredicateResult & PredicateResult) {
        return CompoundPredicateResult(predicateQuery)
    }
}
