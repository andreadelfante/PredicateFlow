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
    let parent = LinkingObjects<TestObject>(fromType: TestObject.self, property: "children")
    
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

extension TestObjectSchema {
    
    var children: CollectionProperty<TestObjectSchema> {
        return CollectionProperty("children", compoundFieldBuilder)
    }
    
    static var children: CollectionProperty<TestObjectSchema> {
        return TestObjectSchema().children
    }
    
    var parent: CollectionProperty<TestObjectSchema> {
        return CollectionProperty("parent", compoundFieldBuilder)
    }
    
    static var parent: CollectionProperty<TestObjectSchema> {
        return TestObjectSchema().parent
    }
}
