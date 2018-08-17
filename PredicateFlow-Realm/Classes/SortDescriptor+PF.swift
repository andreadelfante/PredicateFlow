//
//  SortDescriptor+PF.swift
//  Pods-PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//

import RealmSwift

extension SortDescriptor {

    public init(_ predicateField: PredicateField, ascending: Bool = true) {
        self.init(keyPath: predicateField.keyPath(), ascending: ascending)
    }
}

extension PredicateField {

    public func ascending() -> SortDescriptor {
        return SortDescriptor(self, ascending: true)
    }

    public func descending() -> SortDescriptor {
        return SortDescriptor(self, ascending: false)
    }
}
