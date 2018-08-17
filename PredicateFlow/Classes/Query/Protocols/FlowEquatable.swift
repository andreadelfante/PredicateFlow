//
//  FlowEquatable.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 02/04/18.
//

import Foundation

public protocol FlowEquatable {
    associatedtype EquatableObject

    /**
     Create a query checking if this property is equal to object.
     
     - parameter object: The right hand expression.
     
     - returns: a predicate result.
     */
    func isEqual(_ object: EquatableObject) -> PredicateResult

    /**
     Create a query checking if this property is not equal to object.
     
     - parameter object: The right hand expression.
     
     - returns: a predicate result.
     */
    func isNotEqual(_ object: EquatableObject) -> PredicateResult

    /**
     Create a query checking if this property is in a objects collection.
     
     - parameter objects: The right hand expression, which is an objects collection.
     
     - returns: a predicate result.
     */
    func `in`(_ objects: [EquatableObject]) -> PredicateResult

    /**
     Create a query checking if this property is NOT in a objects collection.
     
     - parameter objects: The right hand expression, which is an objects collection.
     
     - returns: a predicate result.
     */
    func notIn(_ objects: [EquatableObject]) -> PredicateResult
}

extension FlowEquatable {

    /**
     Alias of isEqual(_:).
     */
    public func `is`(_ object: EquatableObject) -> PredicateResult {
        return isEqual(object)
    }

    /**
     Alias of isNotEqual(_:).
     */
    public func isNot(_ object: EquatableObject) -> PredicateResult {
        return isNotEqual(object)
    }
}

extension FlowEquatable {

    /**
     Create a query checking if this property is in a objects collection.
     
     - parameter objects: The right hand expression, which is an objects collection.
     
     - returns: a predicate result.
     */
    public func `in`(_ objects: EquatableObject...) -> PredicateResult {
        return self.in(objects)
    }

    /**
     Create a query checking if this property is NOT in a objects collection.
     
     - parameter objects: The right hand expression, which is an objects collection.
     
     - returns: a predicate result.
     */
    public func notIn(_ objects: EquatableObject...) -> PredicateResult {
        return self.notIn(objects)
    }
}

extension FlowEquatable {

    public static func ==(lhs: Self, rhs: Self.EquatableObject) -> PredicateResult {
        return lhs.isEqual(rhs)
    }

    public static func !=(lhs: Self, rhs: Self.EquatableObject) -> PredicateResult {
        return lhs.isNotEqual(rhs)
    }
}
