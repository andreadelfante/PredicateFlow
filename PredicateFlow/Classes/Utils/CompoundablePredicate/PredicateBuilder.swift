import Foundation

/**
This class is used to write a more readable and flowable predicate.
*/
public final class PredicateBuilder: GroupingPredicate, CustomStringConvertible, CustomDebugStringConvertible {

    private var predicate: NSPredicate

    public required init(_ predicate: NSPredicate) {
        self.predicate = predicate
    }

    /**
     Create a new predicate builder that starts with a predicate group
     
     - parameter group: a predicate group.
     */
    public init(_ group: PredicateBuilder) {
        self.predicate = NSPredicate(format: "(\(group.predicate))")
    }

    public func and(_ predicate: NSPredicate) -> Self {
        self.predicate = NSPredicate(format: "\(self.predicate) AND \(predicate)")
        return self
    }

    public func andNot(_ predicate: NSPredicate) -> Self {
        return and(NSPredicate(format: "NOT \(predicate)"))
    }

    public func or(_ predicate: NSPredicate) -> Self {
        self.predicate = NSPredicate(format: "\(self.predicate) OR \(predicate)")
        return self
    }

    public func orNot(_ predicate: NSPredicate) -> Self {
        return or(NSPredicate(format: "NOT \(predicate)"))
    }

    public func and(_ group: PredicateBuilder) -> Self {
        self.predicate = NSPredicate(format: "\(self.predicate) AND (\(group.predicate))")
        return self
    }

    public func andNot(_ group: PredicateBuilder) -> Self {
        self.predicate = NSPredicate(format: "\(self.predicate) AND NOT (\(group.predicate))")
        return self
    }

    public func or(_ group: PredicateBuilder) -> Self {
        self.predicate = NSPredicate(format: "\(self.predicate) OR (\(group.predicate))")
        return self
    }

    public func orNot(_ group: PredicateBuilder) -> Self {
        self.predicate = NSPredicate(format: "\(self.predicate) OR NOT (\(group.predicate))")
        return self
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
	public final func query() -> NSPredicate {
		return build()
	}

    public var description: String {
        return self.predicate.description
    }

    public var debugDescription: String {
        return self.predicate.debugDescription
    }
}
