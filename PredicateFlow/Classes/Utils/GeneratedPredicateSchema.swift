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

	/**
	Init with a prev compound field builder.
	*/
	init(compoundFieldBuilder: CompoundFieldBuilder)

	/**
	The entity name of the related schema. (e.g: if you define a class/struct Dog, this library will generate a related DogSchema that implements this protocol).
	*/
	static var entityName: String { get }
}

public extension GeneratedPredicateSchema {

	/**
	Init with an empty compound field builder.
	*/
	public init() {
		self.init(compoundFieldBuilder: CompoundFieldBuilder())
	}
}
