//
//  StringComparisonOption.swift
//  PredicateFlow
//
//  Created by Andrea Del Fante on 17/02/18.
//

import Foundation

/**
Defines the options to compare strings.
*/
public enum StringComparisonOption: String {

	/**
	When comparing two strings, the predicate system will ignore case. For example, the characters 'e' and 'E' will match.
	*/
	case caseInsensitive = "c"

	/**
	When comparing two strings, the predicate system will ignore diacritic characters and normalize the special character to its base character. For example, the characters `e é ê è` are all equivalent.
	*/
	case dialisticInsensitive = "d"
}
