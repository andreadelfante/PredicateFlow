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
	
	/**
	Create a query checking if this property is equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isEqual(_ object: T) -> PredicateResult {
		return ConcretePredicateResult("\(field) == %@", object)
	}
	
	/**
	Create a query checking if this property is not equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isNotEqual(_ object: T) -> PredicateResult {
		return ConcretePredicateResult("\(field) != %@", object)
	}
	
	/**
	Create a query checking if this property is greater than object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isGreater(than object: T) -> PredicateResult {
		return ConcretePredicateResult("\(field) > %@", object)
	}
	
	/**
	Create a query checking if this property is greater than or equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isGreater(thanOrEqual object: T) -> PredicateResult {
		return ConcretePredicateResult("\(field) >= %@", object)
	}
	
	/**
	Create a query checking if this property is less than object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isLess(than object: T) -> PredicateResult {
		return ConcretePredicateResult("\(field) < %@", object)
	}
	
	/**
	Create a query checking if this property is less than or equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isLess(thanOrEqual object: T) -> PredicateResult {
		return ConcretePredicateResult("\(field) <= %@", object)
	}
	
	/**
	Create a query checking if this property is in a objects collection.
	
	- parameter objects: The right hand expression, which is an objects collection.
	
	- returns: a predicate result.
	*/
	public func `in`(_ objects: [T]) -> PredicateResult {
		return ConcretePredicateResult("\(field) IN %@", objects)
	}
	
	/**
	Create a query checking if this property is between the two parameters.
	
	- parameter first: This is the first element of between operation.
	- parameter second: This is the second element of between operation.
	
	- returns: a predicate result.
	*/
	public func between(_ first: T, _ second: T) -> PredicateResult {
		return ConcretePredicateResult("\(field) BETWEEN %@", [first, second])
	}
}

public extension BasicComparisonQuery {

	/**
	Create a query checking if this property is in a objects collection.
	
	- parameter objects: The right hand expression, which is an objects collection.
	
	- returns: a predicate result.
	*/
    public func `in`(_ objects: T...) -> PredicateResult {
        return self.in(objects)
    }
}
