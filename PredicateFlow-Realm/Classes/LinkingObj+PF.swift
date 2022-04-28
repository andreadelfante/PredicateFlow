//
//  LinkingObj+PF.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 30/08/2018.
//

import RealmSwift

extension LinkingObjects {

	public init(_ type: Element.Type, _ predicateField: PredicateField) {
        self.init(fromType: type, property: predicateField.keyPath())
    }

    public func filter(_ predicateResult: PredicateResult) -> Results<Element> {
        return filter(predicateResult.query())
    }

    public func sorted(_ sortDescriptions: RealmSwift.SortDescriptor...) -> Results<Element> {
        return sorted(by: sortDescriptions)
    }

    public func value(_ predicateField: PredicateField) -> Any? {
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
