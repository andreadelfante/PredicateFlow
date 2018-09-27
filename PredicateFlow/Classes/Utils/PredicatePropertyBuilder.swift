//
//  PredicatePropertyBuilder.swift
//  PredicateFlow
//
//  Created by Andrea on 14/09/18.
//

import Foundation

/// This builder is useful to construct predicate properties.
public protocol PredicatePropertyBuilder {

    /// Build a BoolPredicateProperty.
    ///
    /// - Parameter fieldName: the predicate property field name.
    /// - Returns: a new BoolPredicateProperty.
    func bool(_ fieldName: String) -> BoolPredicateProperty

    /// Build a StringPredicateProperty.
    ///
    /// - Parameter fieldName: the predicate property field name.
    /// - Returns: a new StringPredicateProperty.
    func string(_ fieldName: String) -> StringPredicateProperty

    /// Build a ObjectProperty.
    ///
    /// - Parameter fieldName: the predicate property field name.
    /// - Returns: a new ObjectProperty.
    func object<T: GeneratedPredicateSchema>(_ fieldName: String) -> ObjectProperty<T>

    /// Build a CollectionProperty.
    ///
    /// - Parameter fieldName: the predicate property field name.
    /// - Returns: a new CollectionProperty.
    func collection<T>(_ fieldName: String) -> CollectionProperty<T>

    /// Build a generic PredicateProperty.
    ///
    /// - Parameter fieldName: the predicate property field name.
    /// - Returns: a new generic PredicateProperty.
    func generic<T>(_ fieldName: String) -> PredicateProperty<T>
}

final class PFPredicatePropertyBuilder: PredicatePropertyBuilder {

    private var compoundFieldBuilder: CompoundFieldBuilder

    init(_ compoundFieldBuilder: CompoundFieldBuilder) {
        self.compoundFieldBuilder = compoundFieldBuilder
    }

    func bool(_ fieldName: String) -> BoolPredicateProperty {
        return BoolPredicateProperty(fieldName, compoundFieldBuilder)
    }

    func string(_ fieldName: String) -> StringPredicateProperty {
        return StringPredicateProperty(fieldName, compoundFieldBuilder)
    }

    func object<T>(_ fieldName: String) -> ObjectProperty<T> where T: GeneratedPredicateSchema {
        return ObjectProperty<T>(fieldName, compoundFieldBuilder)
    }

    func collection<T>(_ fieldName: String) -> CollectionProperty<T> {
        return CollectionProperty<T>(fieldName, compoundFieldBuilder)
    }

    func generic<T>(_ fieldName: String) -> PredicateProperty<T> {
        return PredicateProperty<T>(fieldName, compoundFieldBuilder)
    }
}
