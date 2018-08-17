//
// Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
A builder to compound predicate fields.
*/
public final class CompoundFieldBuilder {

	private var aggregateOperator: String?
    private var fields: [String]

    init() {
        self.fields = []
    }

	@discardableResult
    func append(_ fieldName: String) -> Self {
        fields.append(fieldName)
        return self
    }

    func field() -> PredicateField {
        return CompoundField(joinFields())
    }

	@discardableResult
    func avg() -> Self {
        fields.append("@avg")
        return self
    }

	@discardableResult
    func count() -> Self {
        fields.append("@count")
        return self
    }

	@discardableResult
    func min() -> Self {
        fields.append("@min")
        return self
    }

	@discardableResult
    func max() -> Self {
        fields.append("@max")
        return self
    }

	@discardableResult
    func sum() -> Self {
        fields.append("@sum")
        return self
    }

	@discardableResult
	func any() -> Self {
		aggregateOperator = "ANY"
		return self
	}

	@discardableResult
	func some() -> Self {
		aggregateOperator = "SOME"
		return self
	}

	@discardableResult
	func all() -> Self {
		aggregateOperator = "ALL"
		return self
	}

	@discardableResult
	func none() -> Self {
		aggregateOperator = "NONE"
		return self
	}

//    FUTURE WORK
//    @discardableResult
//    func selfValue() -> Self {
//        fields.append("SELF")
//        return self
//    }

	private func joinFields() -> String {
		let joined = fields.joined(separator: ".")
		return aggregateOperator == nil ? joined : "\(aggregateOperator!) \(joined)"
	}

	fileprivate struct CompoundField: PredicateField {
		private(set) var name: String

		init(_ name: String) {
			self.name = name
		}
    }
}
