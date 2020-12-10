1.5.0 Release notes (2020-12-10)
=============================================================
### Breaking Changes
* Bump Sourcery version to 1.0.2.

1.4.0 Release notes (2020-07-21)
=============================================================
### Breaking Changes
* Bump min iOS version to 9.0.

1.3.0 Release notes (2019-11-22)
=============================================================
### Enhancements
* Add support to Swift 5.1

1.2.2 Release notes (2019-04-24)
=============================================================
### Enhancements
* Add support to Swift 5

1.2.1 Release notes (2019-02-14)
=============================================================
### Enhancements
* Fix wrong generation for Realm `List` and `LinkingObjects`
* Add support for type `RealmOptional`
* Change script to generate `PredicateFlow-Realm`. Please use this:
```   
"$PODS_ROOT/Sourcery/bin/sourcery" --sources "$SRCROOT/Tests" --sources "$PODS_ROOT/RealmSwift" --templates "$SRCROOT/Tests/PredicateFlow-Realm.stencil" --output "$SRCROOT/Tests/Models/PredicateFlow.generated.swift"
```

1.2.0 Release notes (2019-02-13)
=============================================================
### Breaking Changes
* Add support to generate fields of type `List` and `LinkingObjects`, if you use `PredicateFlow-Realm.stencil`.

### Enhancements
* Add new stencil template for PredicateFlow/Realm, `PredicateFlow-Realm.stencil`.
* Add auto-excluding code quality check of PredicateFlow generated file if you use [SwiftLint](https://github.com/realm/SwiftLint).
* Add support for min, max, average, sum, value of LinkingObjects and List in PredicateFlow/Realm.
* Add support to init a LinkingObjects using PredicateField.

1.1.2 Release notes (2018-12-01)
=============================================================

### Enhancements
* Add support for min, max, average, sum in PredicateFlow/Realm.

1.1.1 Release notes (2018-09-27)
=============================================================

### Enhancements
* Add support to Xcode 10 and Swift 4.2

1.1.0 Release notes (2018-09-15)
=============================================================

### Breaking Changes
* To build a new predicate property, now you must use the new builder API.

  | Old API                                                | New API                     |
  |--------------------------------------------------------|-----------------------------|
  | `CollectionProperty("foo", compoundFieldBuilder)`      | `builder.collection("foo")` |
  | `ObjectProperty("foo", compoundFieldBuilder)`          | `builder.object("foo")`     |
  | `StringPredicateProperty("foo", compoundFieldBuilder)` | `builder.string("foo")`     |
  | `BoolPredicateProperty("foo", compoundFieldBuilder)`   | `builder.bool("foo")`       |
  | `PredicateProperty("foo", compoundFieldBuilder)`       | `builder.generic("foo")`    |

### Enhancements
* Add support for subquery.
* Add support for querying LinkingObjects in PredicateFlow/Realm.
