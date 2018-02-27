//
//  Dog.swift
//  PredicateFlow_Example
//
//  Created by Andrea Del Fante on 19/02/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import PredicateFlow

class Dog: PredicateSchema {
	
	private var name: String = ""
	private var age: Int = 0
	private var isHungry: Bool = false
	private var owner: Person?
}
