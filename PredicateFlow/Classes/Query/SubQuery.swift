//
//  SubQuery.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 21/02/18.
//

import Foundation

struct SubQuery<T: GeneratedPredicateSchema>: PredicateQuery {

	private(set) var field: PredicateField
    private var subqueryProperty: SubqueryProperty<T>
	private var result: PredicateResult

	init(_ field: PredicateField, subqueryProperty: SubqueryProperty<T>, _ result: PredicateResult) {
        self.field = field
        self.subqueryProperty = subqueryProperty
        self.result = result
    }

	func execute() -> CollectionProperty<T> {
        return CollectionProperty<T>("SUBQUERY(\(field), \(subqueryProperty.name), \(result.predicate))")
	}
}
