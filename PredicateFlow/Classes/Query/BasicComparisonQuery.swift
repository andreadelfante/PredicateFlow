//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
The basic comparison query class.
*/
public class BasicComparisonQuery<T>: PredicateQuery {
	public private(set) var field: PredicateField

	init(_ field: PredicateField) {
		self.field = field
	}
}

extension BasicComparisonQuery: FlowEquatable {
    public typealias EquatableObject = T

    public func isEqual(_ object: EquatableObject) -> PredicateResult {
        return ConcretePredicateResult("\(field) == %@", object)
    }

    public func isNotEqual(_ object: EquatableObject) -> PredicateResult {
        return ConcretePredicateResult("\(field) != %@", object)
    }

    public func `in`(_ objects: [T]) -> PredicateResult {
        return ConcretePredicateResult("\(field) IN %@", objects)
    }

    public func notIn(_ objects: [T]) -> PredicateResult {
        return ConcretePredicateResult("NOT \(field) IN %@", objects)
    }
}

extension BasicComparisonQuery: FlowComparable {
    public typealias ComparableObject = T

    public func isGreater(than object: T) -> PredicateResult {
        return ConcretePredicateResult("\(field) > %@", object)
    }

    public func isGreater(thanOrEqual object: T) -> PredicateResult {
        return ConcretePredicateResult("\(field) >= %@", object)
    }

    public func isLess(than object: T) -> PredicateResult {
        return ConcretePredicateResult("\(field) < %@", object)
    }

    public func isLess(thanOrEqual object: T) -> PredicateResult {
        return ConcretePredicateResult("\(field) <= %@", object)
    }

    public func between(_ first: T, _ second: T) -> PredicateResult {
        return ConcretePredicateResult("\(field) BETWEEN %@", [first, second])
    }

    public func notBetween(_ first: T, _ second: T) -> PredicateResult {
        return ConcretePredicateResult("NOT \(field) BETWEEN %@", [first, second])
    }
}
