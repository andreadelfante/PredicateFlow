//
//  FlowStringComparable.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 02/04/18.
//

import Foundation

public protocol FlowStringComparable {

    /**
     Create a query checking if this property begins with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func begins(with string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property contains the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func contains(_ string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property ends with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func ends(with string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property is like to the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func like(_ string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property matches the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func matches(_ string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property NOT begins with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notBegins(with string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property NOT contains the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notContains(_ string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property NOT ends with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notEnds(with string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property is NOT like to the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notLike(_ string: String, options: [StringComparisonOption]) -> PredicateResult

    /**
     Create a query checking if this property NOT matches the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notMatches(_ string: String, options: [StringComparisonOption]) -> PredicateResult
}

public extension FlowStringComparable {

    /**
     Create a query checking if this property begins with the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func begins(with string: String) -> PredicateResult {
        return begins(with: string, options: [])
    }

    /**
     Create a query checking if this property contains the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func contains(_ string: String) -> PredicateResult {
        return contains(string, options: [])
    }

    /**
     Create a query checking if this property ends with the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func ends(with string: String) -> PredicateResult {
        return ends(with: string, options: [])
    }

    /**
     Create a query checking if this property is like to the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func like(_ string: String) -> PredicateResult {
        return like(string, options: [])
    }

    /**
     Create a query checking if this property matches the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func matches(_ string: String) -> PredicateResult {
        return matches(string, options: [])
    }

    /**
     Create a query checking if this property NOT begins with the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func notBegins(with string: String) -> PredicateResult {
        return notBegins(with: string, options: [])
    }

    /**
     Create a query checking if this property NOT contains the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func notContains(_ string: String) -> PredicateResult {
        return notContains(string, options: [])
    }

    /**
     Create a query checking if this property NOT ends with the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func notEnds(with string: String) -> PredicateResult {
        return notEnds(with: string, options: [])
    }

    /**
     Create a query checking if this property is NOT like to the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func notLike(_ string: String) -> PredicateResult {
        return notLike(string, options: [])
    }

    /**
     Create a query checking if this property NOT matches the specified string.
     No options specified.
     
     - parameter string: The right hand expression.
     
     - returns: a predicate result.
     */
    func notMatches(_ string: String) -> PredicateResult {
        return notMatches(string, options: [])
    }
}

public extension FlowStringComparable {

    /**
     Create a query checking if this property begins with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func begins(with string: String, options: StringComparisonOption...) -> PredicateResult {
        return begins(with: string, options: options)
    }

    /**
     Create a query checking if this property contains the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func contains(_ string: String, options: StringComparisonOption...) -> PredicateResult {
        return contains(string, options: options)
    }

    /**
     Create a query checking if this property ends with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func ends(with string: String, options: StringComparisonOption...) -> PredicateResult {
        return ends(with: string, options: options)
    }

    /**
     Create a query checking if this property is like to the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func like(_ string: String, options: StringComparisonOption...) -> PredicateResult {
        return like(string, options: options)
    }

    /**
     Create a query checking if this property matches the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func matches(_ string: String, options: StringComparisonOption...) -> PredicateResult {
        return matches(string, options: options)
    }

    /**
     Create a query checking if this property NOT begins with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notBegins(with string: String, options: StringComparisonOption...) -> PredicateResult {
        return notBegins(with: string, options: options)
    }

    /**
     Create a query checking if this property NOT contains the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notContains(_ string: String, options: StringComparisonOption...) -> PredicateResult {
        return notContains(string, options: options)
    }

    /**
     Create a query checking if this property NOT ends with the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notEnds(with string: String, options: StringComparisonOption...) -> PredicateResult {
        return notEnds(with: string, options: options)
    }

    /**
     Create a query checking if this property is NOT like to the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notLike(_ string: String, options: StringComparisonOption...) -> PredicateResult {
        return notLike(string, options: options)
    }

    /**
     Create a query checking if this property NOT matches the specified string.
     
     - parameter string: The right hand expression.
     - parameter options: An array of StringComparisonOption.
     
     - returns: a predicate result.
     */
    func notMatches(_ string: String, options: StringComparisonOption...) -> PredicateResult {
        return notMatches(string, options: options)
    }
}
