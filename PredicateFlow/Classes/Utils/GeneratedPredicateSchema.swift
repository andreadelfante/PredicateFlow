//
//  GeneratedPredicateSchema.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 19/02/18.
//

import Foundation

/**
Used for defining generated predicate schema.
*/
public protocol GeneratedPredicateSchema {

    /// Use the builder property if you need to build a predicate property
    var compoundFieldBuilder: CompoundFieldBuilder { get }

	/// Init with a prev compound field builder.
	init(compoundFieldBuilder: CompoundFieldBuilder)
}

public extension GeneratedPredicateSchema {

    /// Init with an empty compound field builder.
	init() {
		self.init(compoundFieldBuilder: CompoundFieldBuilder())
	}

    /// A builder to create a new predicate property.
    /// If the code generator does not generate correctly a property, you can use this builder to create a new predicate property.
    var builder: PredicatePropertyBuilder {
        return PFPredicatePropertyBuilder(compoundFieldBuilder)
    }
}
