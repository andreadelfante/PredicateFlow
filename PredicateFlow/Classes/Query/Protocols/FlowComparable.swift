//
//  FlowComparable.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 02/04/18.
//

import Foundation

public protocol FlowComparable {
    associatedtype ComparableObject

    /**
     Create a query checking if this property is greater than object.
     
     - parameter object: The right hand expression.
     
     - returns: a predicate result.
     */
    func isGreater(than object: ComparableObject) -> PredicateResult

    /**
     Create a query checking if this property is greater than or equal to object.
     
     - parameter object: The right hand expression.
     
     - returns: a predicate result.
     */
    func isGreater(thanOrEqual object: ComparableObject) -> PredicateResult

    /**
     Create a query checking if this property is less than object.
     
     - parameter object: The right hand expression.
     
     - returns: a predicate result.
     */
    func isLess(than object: ComparableObject) -> PredicateResult

    /**
     Create a query checking if this property is less than or equal to object.
     
     - parameter object: The right hand expression.
     
     - returns: a predicate result.
     */
    func isLess(thanOrEqual object: ComparableObject) -> PredicateResult

    /**
     Create a query checking if this property is between the two parameters.
     
     - parameter first: This is the first element of between operation.
     - parameter second: This is the second element of between operation.
     
     - returns: a predicate result.
     */
    func between(_ first: ComparableObject, _ second: ComparableObject) -> PredicateResult

    /**
     Create a query checking if this property is NOT between the two parameters.
     
     - parameter first: This is the first element of NOT between operation.
     - parameter second: This is the second element of NOT between operation.
     
     - returns: a predicate result.
     */
    func notBetween(_ first: ComparableObject, _ second: ComparableObject) -> PredicateResult
}

extension FlowComparable {

    public static func >(lhs: Self, rhs: Self.ComparableObject) -> PredicateResult {
        return lhs.isGreater(than: rhs)
    }

    public static func >=(lhs: Self, rhs: Self.ComparableObject) -> PredicateResult {
        return lhs.isGreater(thanOrEqual: rhs)
    }

    public static func <(lhs: Self, rhs: Self.ComparableObject) -> PredicateResult {
        return lhs.isLess(than: rhs)
    }

    public static func <=(lhs: Self, rhs: Self.ComparableObject) -> PredicateResult {
        return lhs.isLess(thanOrEqual: rhs)
    }
}
