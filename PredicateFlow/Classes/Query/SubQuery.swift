//
//  SubQuery.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 21/02/18.
//

import Foundation

struct SubQuery<T: GeneratedPredicateSchema>: PredicateQuery {
	
	private(set) var field: PredicateField
	private var variableName: String
	private var result: PredicateResult
	
	init(_ field: PredicateField, _ subquery: (SubqueryProperty<T>) -> PredicateResult) {
		self.field = field
		
		variableName = "$\(arc4random())"
		result = subquery(SubqueryProperty(variableName))
	}
	
	func execute() -> CollectionProperty<T> {
		return CollectionProperty<T>("SUBQUERY(\(field), \(variableName), \(result.query()))")
	}
}
