//
//  LinkingObj+PF.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 30/08/2018.
//

import RealmSwift

extension LinkingObjects {

    public func filter(_ predicateResult: PredicateResult) -> Results<Element> {
        return filter(predicateResult.query())
    }

    public func sorted(_ sortDescriptions: SortDescriptor...) -> Results<Element> {
        return sorted(by: sortDescriptions)
    }
}
