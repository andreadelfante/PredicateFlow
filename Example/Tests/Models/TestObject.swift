//
//  TestObject.swift
//  PredicateFlow_Tests
//
//  Created by Andrea on 17/08/18.
//  Copyright © 2018 CocoaPods. All rights reserved.
//

import RealmSwift
import PredicateFlow

class TestObject: Object, PredicateSchema {
    
    @objc dynamic var key: Int = 0
    @objc dynamic var string: String = ""
    @objc dynamic var int: Int = 0
    @objc dynamic var date: Date?
    let children = List<TestObject>()
    let parent = LinkingObjects<TestObject>(TestObject.self, TestObjectSchema.children)
    let numbers = List<Int>()
    let test2Objects = List<Test2Object>()
    let booleans = List<Bool>()
    let doubles = List<Double>()
    let floats = List<Float>()
    
    convenience init(key: Int, string: String, int: Int, date: Date? = nil) {
        self.init()
        
        self.key = key
        self.string = string
        self.int = int
        self.date = date
    }
    
    override class func primaryKey() -> String? {
        return TestObjectSchema.key.keyPath()
    }
}
