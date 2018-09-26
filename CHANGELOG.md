1.1.1 Release notes (2018-09-26)
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
