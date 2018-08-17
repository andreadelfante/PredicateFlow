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
}
