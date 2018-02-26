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
}
