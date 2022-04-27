//
//  SortDescriptor+PF.swift
//  Pods-PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//

import RealmSwift

extension RealmSwift.SortDescriptor {

    public init(_ predicateField: PredicateField, ascending: Bool = true) {
        self.init(keyPath: predicateField.keyPath(), ascending: ascending)
    }
}

extension PredicateField {

    public func ascending() -> RealmSwift.SortDescriptor {
        return SortDescriptor(self, ascending: true)
    }

    public func descending() -> RealmSwift.SortDescriptor {
        return SortDescriptor(self, ascending: false)
    }
}
