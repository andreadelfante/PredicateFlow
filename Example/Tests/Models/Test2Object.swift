//
//  ChildObject.swift
//  PredicateFlow_Tests
//
//  Created by Andrea Del Fante on 14/02/2019.
//  Copyright © 2019 CocoaPods. All rights reserved.
//

import RealmSwift
import PredicateFlow

class Test2Object: Object, PredicateSchema {
    
    @objc dynamic private(set) var valueString: String = ""
    let parent = LinkingObjects<TestObject>(TestObject.self, TestObjectSchema.test2Objects)
    let nilBool = RealmOptional<Bool>()
    let nilDouble = RealmOptional<Double>()
    let nilFloat = RealmOptional<Float>()
}
