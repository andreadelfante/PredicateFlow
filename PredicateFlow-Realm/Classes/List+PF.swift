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

    public func sorted(_ sortDescriptions: SortDescriptor...) -> Results<Element> {
        return sorted(by: sortDescriptions)
    }

    public func value(_ predicateField: PredicateField) -> [AnyObject] {
        return value(forKeyPath: predicateField.keyPath())
    }

    public func min<T: MinMaxType>(_ predicateField: PredicateField) -> T? {
        return min(ofProperty: predicateField.keyPath())
    }

    public func max<T: MinMaxType>(_ predicateField: PredicateField) -> T? {
        return max(ofProperty: predicateField.keyPath())
    }

    public func average(_ predicateField: PredicateField) -> Double? {
        return average(ofProperty: predicateField.keyPath())
    }

    public func sum<T: AddableType>(_ predicateField: PredicateField) -> T {
        return sum(ofProperty: predicateField.keyPath())
    }
}
