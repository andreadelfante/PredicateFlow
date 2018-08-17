//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
The string comparison query class.
*/
public class StringComparisonQuery: BasicComparisonQuery<String> {

	private func optionValues(_ options: [StringComparisonOption]) -> String {
		guard !options.isEmpty else { return "" }
		return "[\(options.map { $0.rawValue }.joined())]"
	}
}

extension StringComparisonQuery: FlowStringComparable {

    public func begins(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("\(field) BEGINSWITH\(optionValues(options)) %@", string)
    }

    public func contains(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("\(field) CONTAINS\(optionValues(options)) %@", string)
    }

    public func ends(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("\(field) ENDSWITH\(optionValues(options)) %@", string)
    }

    public func like(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("\(field) LIKE\(optionValues(options)) %@", string)
    }

    public func matches(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("\(field) MATCHES\(optionValues(options)) %@", string)
    }

    public func notBegins(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("NOT \(field) BEGINSWITH\(optionValues(options)) %@", string)
    }

    public func notContains(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("NOT \(field) CONTAINS\(optionValues(options)) %@", string)
    }

    public func notEnds(with string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("NOT \(field) ENDSWITH\(optionValues(options)) %@", string)
    }

    public func notLike(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("NOT \(field) LIKE\(optionValues(options)) %@", string)
    }

    public func notMatches(_ string: String, options: [StringComparisonOption]) -> PredicateResult {
        return ConcretePredicateResult("NOT \(field) MATCHES\(optionValues(options)) %@", string)
    }
}
