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

    public func sorted(_ sortDescriptions: SortDescriptor...) -> Results<Element> {
        return sorted(by: sortDescriptions)
    }

    public func value(_ predicateField: PredicateField) -> Any? {
        return value(forKeyPath: predicateField.keyPath())
    }

    public func distinct(_ predicateFields: PredicateField...) -> Results<Element> {
        return distinct(by: predicateFields.map { $0.keyPath() })
    }

    public func min<T: MinMaxType>(_ predicateField: PredicateField) -> T? {
        return min(ofProperty: predicateField.keyPath())
    }

    public func max<T: MinMaxType>(_ predicateField: PredicateField) -> T? {
        return max(ofProperty: predicateField.keyPath())
    }

    public func average<T: AddableType>(_ predicateField: PredicateField) -> T? {
        return average(ofProperty: predicateField.keyPath())
    }

    public func sum<T: AddableType>(_ predicateField: PredicateField) -> T {
        return sum(ofProperty: predicateField.keyPath())
    }
}
