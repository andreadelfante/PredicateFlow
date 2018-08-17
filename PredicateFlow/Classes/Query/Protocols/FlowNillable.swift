//
//  FlowNillable.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 02/04/18.
//

import Foundation

public protocol FlowNillable {

    /**
     Create a query checking if this property is nil.
     
     - returns: a predicate result.
     */
    func isNil() -> PredicateResult

    /**
     Create a query checking if this property is not nil.
     
     - returns: a predicate result.
     */
    func isNotNil() -> PredicateResult
}
