//
//  Realm+PredicateFlow.swift
//  PredicateFlow_Example
//
//  Created by Andrea Del Fante on 22/02/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RealmSwift

extension PredicateField {
	
	public func ascending() -> SortDescriptor {
		return SortDescriptor(keyPath: keyPath(), ascending: true)
	}
	
	public func descending() -> SortDescriptor {
		return SortDescriptor(keyPath: keyPath(), ascending: false)
	}
}

extension SortDescriptor {
	
	public init(_ predicateField: PredicateField, ascending: Bool = true) {
		self.init(keyPath: predicateField.keyPath(), ascending: ascending)
	}
}

extension Results {
	
	public func filter(_ predicateResult: PredicateResult) -> Results<Element> {
		return filter(predicateResult.query())
	}
	
	public func sorted(_ predicateField: PredicateField, ascending: Bool = true) -> Results<Element> {
		return sorted(byKeyPath: predicateField.keyPath(), ascending: ascending)
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
}

extension List {
	
	public func filter(_ predicateResult: PredicateResult) -> Results<Element> {
		return filter(predicateResult.query())
	}
	
	public func sorted(_ predicateField: PredicateField, ascending: Bool = true) -> Results<Element> {
		return sorted(byKeyPath: predicateField.keyPath(), ascending: ascending)
	}
	
	public func sorted(_ sortDescriptions: SortDescriptor...) -> Results<Element> {
		return sorted(by: sortDescriptions)
	}
}
