//
//  ObjectProperty.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 19/02/18.
//

import Foundation

/**
Defines an object predicate property.
*/
public class ObjectProperty<T: GeneratedPredicateSchema>: CompoundablePredicateField {

	/**
	Get the element schema of this object property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current element schema of this property.
	*/
	public func element() -> T {
		return T.init(compoundFieldBuilder: compoundFieldBuilder)
	}
}
