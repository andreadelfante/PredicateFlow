//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
The result protocol of a predicate query.
*/
public protocol PredicateResult: CustomStringConvertible, CustomDebugStringConvertible {
	/**
	The predicate.
	*/
	var predicate: NSPredicate { get }

	/**
	The string format of this predicate result.
	*/
	var stringFormat: String { get }

	/**
	The arguments of this predicate results.
	*/
	var arguments: [Any] { get }
}

public extension PredicateResult {

	/**
	Alias for predicate.
	*/
	func query() -> NSPredicate {
		return predicate
	}

    var description: String {
        return predicate.description
    }

    var debugDescription: String {
        return predicate.debugDescription
    }
}

internal struct ConcretePredicateResult: PredicateResult {
	private(set) var stringFormat: String
	private(set) var arguments: [Any]

	init(_ format: String, _ args: Any...) {
		self.stringFormat = format
		self.arguments = args
	}

	var predicate: NSPredicate {
		return NSPredicate(format: stringFormat, argumentArray: arguments)
	}
}

class CompoundPredicateResult: CompoundablePredicateResult, PredicateResult {

    private(set) var stringFormat: String
    private(set) var arguments: [Any]

    init(_ predicateQuery: PredicateResult) {
        self.stringFormat = predicateQuery.stringFormat
        self.arguments = predicateQuery.arguments
    }

    func and(_ predicateQuery: PredicateResult) -> Self {
        stringFormat = "\(stringFormat) AND \(predicateQuery.stringFormat)"
        arguments.append(contentsOf: predicateQuery.arguments)
        return self
    }

    func andNot(_ predicateQuery: PredicateResult) -> Self {
        stringFormat = "\(stringFormat) AND NOT \(predicateQuery.stringFormat)"
        arguments.append(contentsOf: predicateQuery.arguments)
        return self
    }

    func or(_ predicateQuery: PredicateResult) -> Self {
        stringFormat = "\(stringFormat) OR \(predicateQuery.stringFormat)"
        arguments.append(contentsOf: predicateQuery.arguments)
        return self
    }

    func orNot(_ predicateQuery: PredicateResult) -> Self {
        stringFormat = "\(stringFormat) OR NOT \(predicateQuery.stringFormat)"
        arguments.append(contentsOf: predicateQuery.arguments)
        return self
    }

    var predicate: NSPredicate {
        return NSPredicate(format: stringFormat, argumentArray: arguments)
    }
}
