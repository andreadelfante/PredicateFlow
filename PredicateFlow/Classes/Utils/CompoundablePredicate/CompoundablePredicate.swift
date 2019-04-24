import Foundation

/**
Protocol to compound predicates.
*/
public protocol CompoundablePredicate: CompoundablePredicateResult {

    /**
     Create a new predicate builder that starts with a predicate
     
     - parameter predicate: an NSPredicate.
     */
    init(_ predicate: NSPredicate)

	/**
	Compound prev predicate with another one, using AND.
	
	- parameter predicate: an NSPredicate.
	
	- returns: self for chaining.
	*/
	func and(_ predicate: NSPredicate) -> Self

	/**
	Compound prev predicate with another one, using AND NOT.
	
	- parameter predicate: an NSPredicate.
	
	- returns: self for chaining.
	*/
	func andNot(_ predicate: NSPredicate) -> Self

	/**
	Compound prev predicate with another one, using OR.
	
	- parameter predicate: an NSPredicate.
	
	- returns: self for chaining.
	*/
	func or(_ predicate: NSPredicate) -> Self

	/**
	Compound prev predicate with another one, using OR NOT.
	
	- parameter predicate: an NSPredicate.
	
	- returns: self for chaining.
	*/
	func orNot(_ predicate: NSPredicate) -> Self
}

public extension CompoundablePredicate {

    /**
     Create a new predicate builder that starts with a predicate, defined by a format and args.
     
     - parameter format: a string format.
     - parameter args: an args array.
     */
    init(_ format: String, _ args: Any...) {
        self.init(NSPredicate.init(format: format, argumentArray: args))
    }

    /**
     Create a new predicate builder that starts with a predicate result.
     
     - parameter predicateQuery: a PredicateResult.
     */
    init(_ predicateQuery: PredicateResult) {
        self.init(predicateQuery.query())
    }
}

public extension CompoundablePredicate {

	/**
	Compound prev predicate with another one, using AND.
	
	- parameter format: a string format.
	- parameter args: an args array.
	
	- returns: self for chaining.
	*/
    func and(_ format: String, _ args: Any...) -> Self {
		return and(NSPredicate(format: format, argumentArray: args))
	}

	/**
	Compound prev predicate with another one, using OR.
	
	- parameter format: a string format.
	- parameter args: an args array.
	
	- returns: self for chaining.
	*/
    func or(_ format: String, _ args: Any...) -> Self {
		return or(NSPredicate(format: format, argumentArray: args))
	}

	/**
	Compound prev predicate with another one, using AND NOT.
	
	- parameter format: a string format.
	- parameter args: an args array.
	
	- returns: self for chaining.
	*/
    func andNot(_ format: String, _ args: Any...) -> Self {
		return andNot(NSPredicate(format: format, args))
	}

	/**
	Compound prev predicate with another one, using OR NOT.
	
	- parameter format: a string format.
	- parameter args: an args array.
	
	- returns: self for chaining.
	*/
    func orNot(_ format: String, _ args: Any...) -> Self {
		return orNot(NSPredicate(format: format, args))
	}
}

public extension CompoundablePredicate {

	func and(_ predicateQuery: PredicateResult) -> Self {
		return and(predicateQuery.query())
	}

	func andNot(_ predicateQuery: PredicateResult) -> Self {
		return andNot(predicateQuery.query())
	}

	func or(_ predicateQuery: PredicateResult) -> Self {
		return or(predicateQuery.query())
	}

	func orNot(_ predicateQuery: PredicateResult) -> Self {
		return orNot(predicateQuery.query())
	}
}

infix operator &&!
infix operator ||!

public extension CompoundablePredicate {

	static func &&(lhs: CompoundablePredicate, rhs: PredicateResult) -> CompoundablePredicate {
		return lhs.and(rhs)
	}

	static func &&!(lhs: CompoundablePredicate, rhs: PredicateResult) -> CompoundablePredicate {
		return lhs.andNot(rhs)
	}

	static func ||(lhs: CompoundablePredicate, rhs: PredicateResult) -> CompoundablePredicate {
		return lhs.or(rhs)
	}

	static func ||!(lhs: CompoundablePredicate, rhs: PredicateResult) -> CompoundablePredicate {
		return lhs.orNot(rhs)
	}

	static func &&(lhs: CompoundablePredicate, rhs: (String, [Any])) -> CompoundablePredicate {
		return lhs.and(rhs.0, rhs.1)
	}

	static func &&!(lhs: CompoundablePredicate, rhs: (String, [Any])) -> CompoundablePredicate {
		return lhs.andNot(rhs.0, rhs.1)
	}

	static func ||(lhs: CompoundablePredicate, rhs: (String, [Any])) -> CompoundablePredicate {
		return lhs.or(rhs.0, rhs.1)
	}

	static func ||!(lhs: CompoundablePredicate, rhs: (String, [Any])) -> CompoundablePredicate {
		return lhs.orNot(rhs.0, rhs.1)
	}

	static func &&(lhs: CompoundablePredicate, rhs: NSPredicate) -> CompoundablePredicate {
		return lhs.and(rhs)
	}

	static func &&!(lhs: CompoundablePredicate, rhs: NSPredicate) -> CompoundablePredicate {
		return lhs.andNot(rhs)
	}

	static func ||(lhs: CompoundablePredicate, rhs: NSPredicate) -> CompoundablePredicate {
		return lhs.or(rhs)
	}

	static func ||!(lhs: CompoundablePredicate, rhs: NSPredicate) -> CompoundablePredicate {
		return lhs.orNot(rhs)
	}
}
