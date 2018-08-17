import Foundation

/**
 Protocol to compound predicate results.
 */
public protocol CompoundablePredicateResult {

    /**
     Compound prev predicate with another one, using AND.
     
     - parameter predicateQuery: a PredicateResult.
     
     - returns: self for chaining.
     */
    func and(_ predicateQuery: PredicateResult) -> Self

    /**
     Compound prev predicate with another one, using AND NOT.
     
     - parameter predicateQuery: a PredicateResult.
     
     - returns: self for chaining.
     */
    func andNot(_ predicateQuery: PredicateResult) -> Self

    /**
     Compound prev predicate with another one, using OR.
     
     - parameter predicateQuery: a PredicateResult.
     
     - returns: self for chaining.
     */
    func or(_ predicateQuery: PredicateResult) -> Self

    /**
     Compound prev predicate with another one, using OR NOT.
     
     - parameter predicateQuery: a PredicateResult.
     
     - returns: self for chaining.
     */
    func orNot(_ predicateQuery: PredicateResult) -> Self
}
