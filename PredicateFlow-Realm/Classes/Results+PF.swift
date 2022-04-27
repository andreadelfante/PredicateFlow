//
//  Results+PF.swift
//  Pods-PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//

import RealmSwift

extension Results {

    public func filter(_ predicateResult: PredicateResult) -> Results<Element> {
        return filter(predicateResult.query())
    }

    public func sorted(_ sortDescriptions: RealmSwift.SortDescriptor...) -> Results<Element> {
        return sorted(by: sortDescriptions)
    }

    public func value(_ predicateField: PredicateField) -> Any? {
        return value(forKeyPath: predicateField.keyPath())
    }

    public func distinct(_ predicateFields: PredicateField...) -> Results<Element> {
        return distinct(by: predicateFields.map { $0.keyPath() })
    }

    public func min<T: _HasPersistedType>(_ predicateField: PredicateField) -> T? where T.PersistedType: MinMaxType {
        return min(ofProperty: predicateField.keyPath())
    }

    public func max<T: _HasPersistedType>(_ predicateField: PredicateField) -> T? where T.PersistedType: MinMaxType {
        return max(ofProperty: predicateField.keyPath())
    }

    public func average<T: _HasPersistedType>(_ predicateField: PredicateField) -> T? where T.PersistedType: AddableType {
        return average(ofProperty: predicateField.keyPath())
    }

    public func sum<T: _HasPersistedType>(_ predicateField: PredicateField) -> T where T.PersistedType: AddableType {
        return sum(ofProperty: predicateField.keyPath())
    }
}
