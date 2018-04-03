import Foundation

/**
This class is a wrapper of NSCompoundPredicate, using to write a more readable and flowable compound predicates.
*/
public final class PredicateBuilder {

    private var predicate: NSPredicate

	/**
	Create a new predicate builder that starts with a predicate, defined by a format and args.
	
	- parameter format: a string format.
	- parameter args: an args array.
	*/
    public convenience init(_ format: String, _ args: Any...) {
        self.init(NSPredicate.init(format: format, argumentArray: args))
    }

	/**
	Create a new predicate builder that starts with a predicate
	
	- parameter predicate: an NSPredicate.
	*/
    public init(_ predicate: NSPredicate) {
        self.predicate = predicate
    }
	
	/**
	Create a new predicate builder that starts with a predicate result.
	
	- parameter predicateQuery: a PredicateResult.
	*/
	public convenience init(_ predicateQuery: PredicateResult) {
		self.init(predicateQuery.query())
	}

	/**
	Compound prev predicate with another one, using AND.
	
	- parameter format: a string format.
	- parameter args: an args array.
	
	- returns: self for chaining.
	*/
    public func and(_ format: String, _ args: Any...) -> Self {
        return and(NSPredicate(format: format, argumentArray: args))
    }

	/**
	Compound prev predicate with another one, using AND.
	
	- parameter predicate: an NSPredicate.
	
	- returns: self for chaining.
	*/
    public func and(_ predicate: NSPredicate) -> Self {
        self.predicate = NSCompoundPredicate(andPredicateWithSubpredicates: [self.predicate, predicate])
        return self
    }

	/**
	Compound prev predicate with another one, using AND.
	
	- parameter predicateQuery: a PredicateResult.
	
	- returns: self for chaining.
	*/
    public func and(_ predicateQuery: PredicateResult) -> Self {
        return and(predicateQuery.query())
    }
    
    /**
     Compound prev predicate with another one, using AND NOT.
     
     - parameter format: a string format.
     - parameter args: an args array.
     
     - returns: self for chaining.
     */
    public func andNot(_ format: String, _ args: Any...) -> Self {
        return andNot(NSPredicate(format: format, args))
    }
    
    /**
     Compound prev predicate with another one, using AND NOT.
     
     - parameter predicate: an NSPredicate.
     
     - returns: self for chaining.
     */
    public func andNot(_ predicate: NSPredicate) -> Self {
        let notPredicate = NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
        return and(notPredicate)
    }
    
    /**
     Compound prev predicate with another one, using AND NOT.
     
     - parameter predicateQuery: a PredicateResult.
     
     - returns: self for chaining.
     */
    public func andNot(_ predicateQuery: PredicateResult) -> Self {
        return andNot(predicateQuery.query())
    }

	/**
	Compound prev predicate with another one, using OR.
	
	- parameter format: a string format.
	- parameter args: an args array.
	
	- returns: self for chaining.
	*/
    public func or(_ format: String, _ args: Any...) -> Self {
        return or(NSPredicate(format: format, argumentArray: args))
    }

	/**
	Compound prev predicate with another one, using OR.
	
	- parameter predicate: an NSPredicate.
	
	- returns: self for chaining.
	*/
    public func or(_ predicate: NSPredicate) -> Self {
        self.predicate = NSCompoundPredicate(orPredicateWithSubpredicates: [self.predicate, predicate])
        return self
    }

	/**
	Compound prev predicate with another one, using OR.
	
	- parameter predicateQuery: a PredicateResult.
	
	- returns: self for chaining.
	*/
    public func or(_ predicateQuery: PredicateResult) -> Self {
        return or(predicateQuery.query())
    }
    
    /**
     Compound prev predicate with another one, using OR NOT.
     
     - parameter format: a string format.
     - parameter args: an args array.
     
     - returns: self for chaining.
     */
    public func orNot(_ format: String, _ args: Any...) -> Self {
        return orNot(NSPredicate(format: format, args))
    }
    
    /**
     Compound prev predicate with another one, using OR NOT.
     
     - parameter predicate: an NSPredicate.
     
     - returns: self for chaining.
     */
    public func orNot(_ predicate: NSPredicate) -> Self {
        let notPredicate = NSCompoundPredicate(notPredicateWithSubpredicate: predicate)
        return or(notPredicate)
    }
    
    /**
     Compound prev predicate with another one, using OR NOT.
     
     - parameter predicateQuery: a PredicateResult.
     
     - returns: self for chaining.
     */
    public func orNot(_ predicateQuery: PredicateResult) -> Self {
        return orNot(predicateQuery.query())
    }

	/**
	Alias of build().
	*/
    public var asPredicate: NSPredicate {
        return build()
    }

	/**
	Build a compound predicate.
	*/
    public func build() -> NSPredicate {
        return self.predicate
    }
	
	/**
	Alias of build().
	*/
	public func query() -> NSPredicate {
		return build()
	}
}

infix operator &&!
infix operator ||!

public extension PredicateBuilder {
	
	public static func &&(lhs: PredicateBuilder, rhs: PredicateResult) -> PredicateBuilder {
		return lhs.and(rhs)
	}
    
    public static func &&!(lhs: PredicateBuilder, rhs: PredicateResult) -> PredicateBuilder {
        return lhs.andNot(rhs)
    }
	
	public static func ||(lhs: PredicateBuilder, rhs: PredicateResult) -> PredicateBuilder {
		return lhs.or(rhs)
	}
    
    public static func ||!(lhs: PredicateBuilder, rhs: PredicateResult) -> PredicateBuilder {
        return lhs.orNot(rhs)
    }
	
	public static func &&(lhs: PredicateBuilder, rhs: (String, [Any])) -> PredicateBuilder {
		return lhs.and(rhs.0, rhs.1)
	}
    
    public static func &&!(lhs: PredicateBuilder, rhs: (String, [Any])) -> PredicateBuilder {
        return lhs.andNot(rhs.0, rhs.1)
    }
	
	public static func ||(lhs: PredicateBuilder, rhs: (String, [Any])) -> PredicateBuilder {
		return lhs.or(rhs.0, rhs.1)
	}
    
    public static func ||!(lhs: PredicateBuilder, rhs: (String, [Any])) -> PredicateBuilder {
        return lhs.orNot(rhs.0, rhs.1)
    }
	
	public static func &&(lhs: PredicateBuilder, rhs: NSPredicate) -> PredicateBuilder {
		return lhs.and(rhs)
	}
    
    public static func &&!(lhs: PredicateBuilder, rhs: NSPredicate) -> PredicateBuilder {
        return lhs.andNot(rhs)
    }
	
	public static func ||(lhs: PredicateBuilder, rhs: NSPredicate) -> PredicateBuilder {
		return lhs.or(rhs)
	}
    
    public static func ||!(lhs: PredicateBuilder, rhs: NSPredicate) -> PredicateBuilder {
        return lhs.orNot(rhs)
    }
}

public extension NSPredicate {

	/**
	Create a new predicate builder that starts with a predicate
	
	- parameter predicate: an NSPredicate.
	
	- returns: a new instance of PredicateBuilder.
	*/
    public static func builder(_ predicate: NSPredicate) -> PredicateBuilder {
        return PredicateBuilder.init(predicate)
    }

	/**
	Create a new predicate builder that starts with a predicate, defined by a format and args.
	
	- parameter format: a string format.
	- parameter args: an args array.
	
	- returns: a new instance of PredicateBuilder.
	*/
    public static func builder(_ format: String, args: Any...) -> PredicateBuilder {
        return PredicateBuilder.init(format, args)
    }
	
	/**
	Create a new predicate builder that starts with a predicate result.
	
	- parameter predicateQuery: a PredicateResult.
	
	- returns: a new instance of PredicateBuilder.
	*/
	public static func builder(_ predicateQuery: PredicateResult) -> PredicateBuilder {
		return PredicateBuilder.init(predicateQuery)
	}
}
