# PredicateFlow

[![Build Status](https://travis-ci.org/andreadelfante/PredicateFlow.svg?branch=master)](https://travis-ci.org/andreadelfante/PredicateFlow)
[![CocoaPods Compatible](https://img.shields.io/cocoapods/v/PredicateFlow.svg)](https://cocoapods.org/pods/PredicateFlow)
![Platform](https://img.shields.io/cocoapods/p/PredicateFlow.svg?style=flat)
[![contributions welcome](https://img.shields.io/badge/contributions-welcome-brightgreen.svg?style=flat)](https://github.com/dwyl/esta/issues)
![License](https://img.shields.io/cocoapods/l/PredicateFlow.svg?style=flat)

Write amazing, strong-typed and easy-to-read NSPredicate. This library allows you to write flowable NSPredicate, without guessing attribution names, predicate operation or writing wrong arguments type.

## Supported platforms

* iOS 9.0+
* macOS 10.9+
* tvOS 9.0+
* watchOS 2.0+

## Installation
[CocoaPods](http://cocoapods.org) is actually the only way to install it.

### Cocoapods

> CocoaPods 0.39.0+ is required to build this library

1. Add `pod 'PredicateFlow'` to your [Podfile](http://cocoapods.org/#get_started) and run `pod install`
2. In Xcode, click on your project in the file list, choose your target under `TARGETS`, click the `Build Phases` tab and add a `New Run Script Phase` by clicking the plus icon in the top left
3. Drag the new `Run Script` phase **above** the `Compile Sources` phase and **below** `Check Pods Manifest.lock`, expand it and paste the following script:  
   ```
   "$PODS_ROOT/Sourcery/bin/sourcery" --sources "$PODS_ROOT/PredicateFlow/PredicateFlow/Classes/Utils/" --sources "$SRCROOT" --templates "$PODS_ROOT/PredicateFlow/PredicateFlow/Templates/PredicateFlow.stencil" --output "$SRCROOT/PredicateFlow.generated.swift"
   ```
   
   In case you are using **PredicateFlow-Realm**, past the following  script instead of the above one:
   ```
   "$PODS_ROOT/Sourcery/bin/sourcery" --sources "$PODS_ROOT/PredicateFlow/PredicateFlow/Classes/Utils/" --sources "$SRCROOT"  --sources "$PODS_ROOT/RealmSwift" --templates "$PODS_ROOT/PredicateFlow/PredicateFlow/Templates/PredicateFlow-Realm.stencil" --output "$SRCROOT/PredicateFlow.generated.swift"
   ```
   
   For Xcode 10 only, add a new `Output Files` and paste the following:
   ```
   $SRCROOT/PredicateFlow.generated.swift
   ```
4. Build your project. In Finder you will now see a `PredicateFlow.generated.swift` in the `$SRCROOT`-folder, drag the `PredicateFlow.generated.swift` files into your project and **uncheck** `Copy items if needed`

_Tip:_ Add the `*.generated.swift` pattern to your `.gitignore` file to prevent unnecessary conflicts.

## Usage

Define a class/struct with its own attributes, which implements ```PredicateSchema```:
```swift
import PredicateFlow

class Dog: PredicateSchema {
	
	private var name: String = ""
	private var age: Int = 0
	private var isHungry: Bool = false
	private var owner: Person?
}

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
```
Build the project. PredicateFlow will autogenerate attributes references to build predicates, putting them in structures.
```swift
// Generated using Sourcery 0.10.0 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT


import PredicateFlow

/// The "Dog" Predicate Schema
internal struct DogSchema: GeneratedPredicateSchema {
    private var compoundFieldBuilder: CompoundFieldBuilder

    /// DO NOT USE THIS INIT DIRECTLY!
    internal init(compoundFieldBuilder: CompoundFieldBuilder) {
        self.compoundFieldBuilder = compoundFieldBuilder
    }

    /// "name" property
    internal var name: StringPredicateProperty { return builder.string("name") }
    /// "name" property for static access
    internal static var name: StringPredicateProperty { return DogSchema().name }
    
    // Other properties of Dog class autogenerated...
}
/// The "Person" Predicate Schema
internal struct PersonSchema: GeneratedPredicateSchema {
    private var compoundFieldBuilder: CompoundFieldBuilder

    /// DO NOT USE THIS INIT DIRECTLY!
    internal init(compoundFieldBuilder: CompoundFieldBuilder) {
        self.compoundFieldBuilder = compoundFieldBuilder
    }

    /// "name" property
    internal var name: StringPredicateProperty { return builder.string("name") }
    /// "name" property for static access
    internal static var name: StringPredicateProperty { return PersonSchema().name }
    
    // Other properties of Person class autogenerated...
}
```

To type a floawable NSPredicate, just write:
```swift
DogSchema.age.isEqual(10).query()
// or
// Vanilla mode: 
// NSPredicate("age == %@", 10)
```
You can also write compound predicate, and use deeper fields:
```swift
PredicateBuilder(DogSchema.age > 10)
    .and(DogSchema.isHungry.isTrue)
    .and(DogSchema.age.between(1, 10))
    .and(DogSchema.owner.element().name == "Foo")
    .or(DogSchema.owner.element().dogs.maxElements().age > 10)
    .or(DogSchema.owner.element().dogs.anyElements().name == "Foo")
    .build()
    
// Vanilla mode: 
// NSPredicate("age > %@ AND isHungry == %@ AND age BETWEEN %@ AND owner.name == %@ OR owner.dogs.@max.age > %@ OR ANY owner.dogs.name == %@", 10, true, [1, 10], "Foo", 10, "Foo")
```

PredicateFlow can also build KeyPaths, and you can use it to get a strong-typed one.
```swift
DogSchema.age.keyPath()
DogSchema.owner.element().dogs.keyPath()

// Vanilla mode:
// "age"
// "owner.dogs"
```

## PredicateFlow/Realm

If you want to use flowable and strong-typed queries in [Realm](https://github.com/realm/realm-cocoa), add **both** `pod 'PredicateFlow'` and `pod 'PredicateFlow/Realm'` to your [Podfile](http://cocoapods.org/#get_started) and run `pod install`.
```swift
let realm = try! Realm()
realm.objects(Dog.self)
    .filter(DogSchema.age.isGreater(than: 10))
    .filter(DogSchema.isHungry.isTrue)
    .sorted(DogSchema.age.ascending())
    
// Vanilla mode:
realm.objects(Dog.self)
    .filter("age > %@", 10)
    .filter("isHungry == %@", true)
    .sorted("age", ascending: true)
```

## Contributing

PredicateFlow is an open source project, so feel free to contribute.
You can open an issue for problems or suggestions, and you can propose your own fixes by opening a pull request with the changes.

## License

PredicateFlow is available under the MIT license. See the LICENSE file for more info.

## Attributions

This library is powered by [Sourcery](https://github.com/krzysztofzablocki/Sourcery).

## Author

Andrea Del Fante, andreadelfante94@gmail.com
