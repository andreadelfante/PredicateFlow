//
//  List+PF.swift
//  PredicateFlow
//
//  Created by Andrea on 17/08/18.
//

import RealmSwift

extension List {

    public func filter(_ predicateResult: PredicateResult) -> Results<Element> {
        return filter(predicateResult.query())
    }

    public func sorted(_ sortDescriptions: RealmSwift.SortDescriptor...) -> Results<Element> {
        return sorted(by: sortDescriptions)
    }

    public func value(_ predicateField: PredicateField) -> [AnyObject] {
        return value(forKeyPath: predicateField.keyPath())
    }

    public func min<T: _HasPersistedType>(_ predicateField: PredicateField) -> T? where T.PersistedType: MinMaxType {
        return min(ofProperty: predicateField.keyPath())
    }

    public func max<T: _HasPersistedType>(_ predicateField: PredicateField) -> T? where T.PersistedType: MinMaxType {
        return max(ofProperty: predicateField.keyPath())
    }

    public func average(_ predicateField: PredicateField) -> Double? {
        return average(ofProperty: predicateField.keyPath())
    }

    public func sum<T: _HasPersistedType>(_ predicateField: PredicateField) -> T where T.PersistedType: AddableType {
        return sum(ofProperty: predicateField.keyPath())
    }
}
