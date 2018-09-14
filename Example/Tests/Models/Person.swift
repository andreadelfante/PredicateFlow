//
//  Person.swift
//  PredicateFlow_Example
//
//  Created by Andrea Del Fante on 19/02/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import PredicateFlow

class Person: PredicateSchema {
	
	enum Sex {
		case male
		case female
	}
	
	private var name: String = ""
	private var birth: Date?
	private var sex: Sex!
	private var dogs: [Dog] = []
    private var attributes: [String] = []
}

extension PersonSchema {
    var sex: PredicateProperty<Person.Sex> { return builder.generic("sex") }
    static var sex: PredicateProperty<Person.Sex> { return PersonSchema().sex }
}
