//
//  StringPredicateProperty.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 03/04/18.
//

import Foundation

/**
 Defines a string predicate property.
 */
public class StringPredicateProperty: PredicateProperty<String> {

}

extension StringPredicateProperty: FlowStringComparable {

    public func begins(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).begins(with: string, options: options)
    }

    public func contains(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).contains(string, options: options)
    }

    public func ends(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).ends(with: string, options: options)
    }

    public func like(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).like(string, options: options)
    }

    public func matches(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).matches(string, options: options)
    }

    public func notBegins(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).notBegins(with: string, options: options)
    }

    public func notContains(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).notContains(string, options: options)
    }

    public func notEnds(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).notEnds(with: string, options: options)
    }

    public func notLike(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).notLike(string, options: options)
    }

    public func notMatches(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return StringComparisonQuery(self).notMatches(string, options: options)
    }
}
