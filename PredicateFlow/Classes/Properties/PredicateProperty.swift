//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
Defines a generic predicate property.
*/
public class PredicateProperty<T>: CompoundablePredicateField {
	
	/**
	Create a query checking if this property is equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isEqual(_ object: T) -> PredicateResult {
		return BasicComparisonQuery<T>(self).isEqual(object)
	}
	
	/**
	Create a query checking if this property is not equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isNotEqual(_ object: T) -> PredicateResult {
		return BasicComparisonQuery<T>(self).isNotEqual(object)
	}
	
	/**
	Create a query checking if this property is greater than object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isGreater(than object: T) -> PredicateResult {
		return BasicComparisonQuery<T>(self).isGreater(than: object)
	}
	
	/**
	Create a query checking if this property is greater than or equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isGreater(thanOrEqual object: T) -> PredicateResult {
		return BasicComparisonQuery<T>(self).isGreater(thanOrEqual: object)
	}
	
	/**
	Create a query checking if this property is less than object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isLess(than object: T) -> PredicateResult {
		return BasicComparisonQuery<T>(self).isLess(than: object)
	}
	
	/**
	Create a query checking if this property is less than or equal to object.
	
	- parameter object: The right hand expression.
	
	- returns: a predicate result.
	*/
	public func isLess(thanOrEqual object: T) -> PredicateResult {
		return BasicComparisonQuery<T>(self).isLess(thanOrEqual: object)
	}
	
	/**
	Create a query checking if this property is in a objects collection.
	
	- parameter objects: The right hand expression, which is an objects collection.
	
	- returns: a predicate result.
	*/
	public func `in`(_ objects: [T]) -> PredicateResult {
		return BasicComparisonQuery<T>(self).in(objects)
	}
	
	/**
	Create a query checking if this property is in a objects collection.
	
	- parameter objects: The right hand expression, which is an objects collection.
	
	- returns: a predicate result.
	*/
	public func `in`(_ objects: T...) -> PredicateResult {
		return BasicComparisonQuery<T>(self).in(objects)
	}
	
	/**
	Create a query checking if this property is between the two parameters.
	
	- parameter first: This is the first element of between operation.
	- parameter second: This is the second element of between operation.
	
	- returns: a predicate result.
	*/
	public func between(_ first: T, _ second: T) -> PredicateResult {
		return BasicComparisonQuery<T>(self).between(first, second)
	}
	
	public static func ==(lhs: PredicateProperty, rhs: T) -> PredicateResult {
		return lhs.isEqual(rhs)
	}
	
	public static func !=(lhs: PredicateProperty, rhs: T) -> PredicateResult {
		return lhs.isNotEqual(rhs)
	}
	
	public static func >(lhs: PredicateProperty, rhs: T) -> PredicateResult {
		return lhs.isGreater(than: rhs)
	}
	
	public static func >=(lhs: PredicateProperty, rhs: T) -> PredicateResult {
		return lhs.isGreater(thanOrEqual: rhs)
	}
	
	public static func <(lhs: PredicateProperty, rhs: T) -> PredicateResult {
		return lhs.isLess(than: rhs)
	}
	
	public static func <=(lhs: PredicateProperty, rhs: T) -> PredicateResult {
		return lhs.isLess(thanOrEqual: rhs)
	}
}

//MARK: - String

public extension PredicateProperty where T == String {
	
	/**
	Create a query checking if this property begins with the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	func begins(with string: String, options: [StringComparisonOption]) -> PredicateResult {
		return StringComparisonQuery(self).begins(with: string, options: options)
	}
	
	/**
	Create a query checking if this property contains the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	func contains(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
		return StringComparisonQuery(self).contains(string, options: options)
	}
	
	/**
	Create a query checking if this property ends with the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	func ends(with string: String, options: [StringComparisonOption]) -> PredicateResult {
		return StringComparisonQuery(self).ends(with: string, options: options)
	}
	
	/**
	Create a query checking if this property is like to the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	func like(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
		return StringComparisonQuery(self).like(string, options: options)
	}
	
	/**
	Create a query checking if this property matches the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	func matches(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
		return StringComparisonQuery(self).matches(string, options: options)
	}
	
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
}
