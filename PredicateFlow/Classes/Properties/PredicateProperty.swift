//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
Defines a generic predicate property.
*/
public class PredicateProperty<T>: CompoundablePredicateField {

}

extension PredicateProperty: FlowEquatable {

    public func isEqual(_ object: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).isEqual(object)
    }

    public func isNotEqual(_ object: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).isNotEqual(object)
    }

    public func `in`(_ objects: [T]) -> PredicateResult {
        return BasicComparisonQuery<T>(self).in(objects)
    }

    public func notIn(_ objects: [T]) -> PredicateResult {
        return BasicComparisonQuery<T>(self).notIn(objects)
    }
}

extension PredicateProperty: FlowComparable {

    public func isGreater(than object: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).isGreater(than: object)
    }

    public func isGreater(thanOrEqual object: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).isGreater(thanOrEqual: object)
    }

    public func isLess(than object: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).isLess(than: object)
    }

    public func isLess(thanOrEqual object: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).isLess(thanOrEqual: object)
    }

    public func between(_ first: T, _ second: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).between(first, second)
    }

    public func notBetween(_ first: T, _ second: T) -> PredicateResult {
        return BasicComparisonQuery<T>(self).notBetween(first, second)
    }
}
