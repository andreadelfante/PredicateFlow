//
//  SequenceProperty.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
Defines a collection predicate property.
*/
public class CollectionProperty<T>: CompoundablePredicateField {

	/**
	Convenience var to check if this collection property is empty.
	*/
	public var isEmpty: PredicateResult {
		return BasicComparisonQuery<Int>(compoundFieldBuilder.count().field()).isEqual(0)
	}

	/**
	The average of the objects in this collection property.
	
	- returns: A basic comparison query.
	*/
	public func avg() -> BasicComparisonQuery<NSNumber> {
		return BasicComparisonQuery<NSNumber>(compoundFieldBuilder.avg().field())
	}

	/**
	The number of the objects in this collection property.
	
	- returns: A basic comparison query.
	*/
	public func count() -> BasicComparisonQuery<NSNumber> {
		return BasicComparisonQuery<NSNumber>(compoundFieldBuilder.count().field())
	}

	/**
	The minimum value of the objects in this collection property.
	
	- returns: A basic comparison query.
	*/
	public func min() -> BasicComparisonQuery<NSNumber> {
		return BasicComparisonQuery<NSNumber>(compoundFieldBuilder.min().field())
	}

	/**
	The maximum value of the objects in this collection property.
	
	- returns: A basic comparison query.
	*/
	public func max() -> BasicComparisonQuery<NSNumber> {
		return BasicComparisonQuery<NSNumber>(compoundFieldBuilder.max().field())
	}

	/**
	The sum of the objects in this collection property.
	
	- returns: A basic comparison query.
	*/
	public func sum() -> BasicComparisonQuery<NSNumber> {
		return BasicComparisonQuery<NSNumber>(compoundFieldBuilder.sum().field())
	}
}

public extension CollectionProperty where T: GeneratedPredicateSchema {

	/**
	Get the elements schema of this collection property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current elements schema of this property.
	*/
    func elements() -> T {
		return T.init(compoundFieldBuilder: compoundFieldBuilder)
	}

	/**
	Begin a query using ANY and get the elements schema of this collection property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current elements schema of this property.
	*/
    func anyElements() -> T {
		compoundFieldBuilder.any()
		return elements()
	}

	/**
	Begin a query using SOME and get the elements schema of this collection property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current elements schema of this property.
	*/
    func someElements() -> T {
		compoundFieldBuilder.some()
		return elements()
	}

	/**
	Begin a query using ALL and get the elements schema of this collection property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current elements schema of this property.
	*/
    func allElements() -> T {
		compoundFieldBuilder.all()
		return elements()
	}

	/**
	Begin a query using NONE and get the elements schema of this collection property.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: The current elements schema of this property.
	*/
    func noneElements() -> T {
		compoundFieldBuilder.none()
		return elements()
	}

	/**
	Begin a query using the average of the objects in this collection property and get the elements schema of this collection property.
	
	- returns: The current elements schema of this property.
	*/
    func avgElements() -> T {
		compoundFieldBuilder.avg()
		return elements()
	}

	/**
	Begin a query using the count of the objects in this collection property and get the elements schema of this collection property.
	
	- returns: The current elements schema of this property.
	*/
    func countElements() -> T {
		compoundFieldBuilder.count()
		return elements()
	}

	/**
	Begin a query using the minimum value in this collection property and get the elements schema of this collection property.
	
	- returns: The current elements schema of this property.
	*/
    func minElements() -> T {
		compoundFieldBuilder.min()
		return elements()
	}

	/**
	Begin a query using the maximum value in this collection property and get the elements schema of this collection property.
	
	- returns: The current elements schema of this property.
	*/
    func maxElements() -> T {
		compoundFieldBuilder.max()
		return elements()
	}

	/**
	Begin a query using the sum of the objects in this collection property and get the elements schema of this collection property.
	
	- returns: The current elements schema of this property.
	*/
    func sumElements() -> T {
		compoundFieldBuilder.sum()
		return elements()
	}

	/**
	Begin a subquery in this collection property.
	
	- parameter subquery: The subquery element.
	
	- returns: A collection property.
	*/
    func subquery(_ subquery: (SubqueryProperty<T>) -> PredicateResult) -> CollectionProperty<T> {
        return self.subquery("random_element_name", subquery)
	}

    /**
     Begin a subquery in this collection property.
     
     - parameter variableName: The name of the element.
     - parameter subquery: The subquery element.
     
     - returns: A collection property.
     */
    func subquery(_ variableName: String, _ subquery: (SubqueryProperty<T>) -> PredicateResult) -> CollectionProperty<T> {
        let property = SubqueryProperty<T>(variableName)
        return SubQuery(self, subqueryProperty: property, subquery(property)).execute()
    }
}

public extension CollectionProperty where T == String {

	/**
	Begin a query using ANY.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: A string comparison query.
	*/
    func anyStrings() -> StringComparisonQuery {
		return StringComparisonQuery(compoundFieldBuilder.any().field())
	}

	/**
	Begin a query using SOME.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: A string comparison query.
	*/
    func someStrings() -> StringComparisonQuery {
		return StringComparisonQuery(compoundFieldBuilder.some().field())
	}

	/**
	Begin a query using ALL.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: A string comparison query.
	*/
    func allStrings() -> StringComparisonQuery {
		return StringComparisonQuery(compoundFieldBuilder.all().field())
	}

	/**
	Begin a query using NONE.
	**WARNING**: Do not put the returned value in a var or let. Use it once per query (e.g. chaining).
	
	- returns: A string comparison query.
	*/
    func noneStrings() -> StringComparisonQuery {
		return StringComparisonQuery(compoundFieldBuilder.none().field())
	}
}
