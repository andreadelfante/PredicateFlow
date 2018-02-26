//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
The string comparison query class.
*/
public class StringComparisonQuery: BasicComparisonQuery<String> {
	
	/**
	Create a query checking if this property begins with the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func begins(with string: String, options: [StringComparisonOption]) -> PredicateResult {
		return ConcretePredicateResult("\(field) BEGINSWITH\(optionValues(options)) %@", string)
	}
	
	/**
	Create a query checking if this property contains the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func contains(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
		return ConcretePredicateResult("\(field) CONTAINS\(optionValues(options)) %@", string)
	}
	
	/**
	Create a query checking if this property ends with the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func ends(with string: String, options: [StringComparisonOption]) -> PredicateResult {
		return ConcretePredicateResult("\(field) ENDSWITH\(optionValues(options)) %@", string)
	}
	
	/**
	Create a query checking if this property is like to the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func like(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
		return ConcretePredicateResult("\(field) LIKE\(optionValues(options)) %@", string)
	}
	
	/**
	Create a query checking if this property matches the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func matches(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
		return ConcretePredicateResult("\(field) MATCHES\(optionValues(options)) %@", string)
	}
	
	private func optionValues(_ options: [StringComparisonOption]) -> String {
		guard !options.isEmpty else { return "" }
		return "[\(options.map { $0.rawValue }.joined())]"
	}
}

public extension StringComparisonQuery {
	
	/**
	Create a query checking if this property begins with the specified string.
	No options specified.
	
	- parameter string: The right hand expression.
	
	- returns: a predicate result.
	*/
    public func begins(with string: String) -> PredicateResult {
        return begins(with: string, options: [])
    }

	/**
	Create a query checking if this property contains the specified string.
	No options specified.
	
	- parameter string: The right hand expression.
	
	- returns: a predicate result.
	*/
    public func contains(_ string: String) -> PredicateResult {
        return contains(string, options: [])
    }

	/**
	Create a query checking if this property ends with the specified string.
	No options specified.
	
	- parameter string: The right hand expression.
	
	- returns: a predicate result.
	*/
    public func ends(with string: String) -> PredicateResult {
        return ends(with: string, options: [])
    }

	/**
	Create a query checking if this property is like to the specified string.
	No options specified.
	
	- parameter string: The right hand expression.
	
	- returns: a predicate result.
	*/
    public func like(_ string: String) -> PredicateResult {
        return like(string, options: [])
    }

	/**
	Create a query checking if this property matches the specified string.
	No options specified.
	
	- parameter string: The right hand expression.
	
	- returns: a predicate result.
	*/
    public func matches(_ string: String) -> PredicateResult {
        return matches(string, options: [])
    }
}

public extension StringComparisonQuery {
	
	/**
	Create a query checking if this property begins with the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func begins(with string: String, options: StringComparisonOption...) -> PredicateResult {
		return begins(with: string, options: options)
	}
	
	/**
	Create a query checking if this property contains the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func contains(_ string: String, options: StringComparisonOption...) -> PredicateResult {
		return contains(string, options: options)
	}
	
	/**
	Create a query checking if this property ends with the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func ends(with string: String, options: StringComparisonOption...) -> PredicateResult {
		return ends(with: string, options: options)
	}
	
	/**
	Create a query checking if this property is like to the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func like(_ string: String, options: StringComparisonOption...) -> PredicateResult {
		return like(string, options: options)
	}
	
	/**
	Create a query checking if this property matches the specified string.
	
	- parameter string: The right hand expression.
	- parameter options: An array of StringComparisonOption.
	
	- returns: a predicate result.
	*/
	public func matches(_ string: String, options: StringComparisonOption...) -> PredicateResult {
		return matches(string, options: options)
	}
}
