//
//  SubqueryProperty.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 21/02/18.
//

import Foundation

/**
	**BETA**

	Defines a subquery predicate property.
	This struct is still in **BETA**. Use this at your own risk.
*/
public struct SubqueryProperty<T: GeneratedPredicateSchema>: PredicateField {
	public private(set) var name: String
	
	init(_ name: String) {
		self.name = name
	}
	
	/**
	**BETA**
	
	Get the element schema of this subquery property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current element schema of this property.
	*/
	public func element() -> T {
		return T.init(compoundFieldBuilder: CompoundFieldBuilder().append(name))
	}
}
