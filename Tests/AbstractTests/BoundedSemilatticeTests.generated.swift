// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import XCTest
@testable import Abstract
import SwiftCheck


final class BoundedSemilatticeTests: XCTestCase {

	func testAnd() {
		property("And is a BoundedSemilattice") <- forAll { (a: And, b: And) in
			Law<And>.isIdempotent(a,b)
		}
	}

	func testFunctionBS() {
		property("FunctionBS is a BoundedSemilattice") <- forAll { (a: ArbitraryFunctionBS<Int,TestStructure>, b: ArbitraryFunctionBS<Int,TestStructure>, context: Int) in
			LawInContext<FunctionBS<Int,TestStructure>>.isIdempotent(a.get,b.get)(context)
		}
	}

	func testMax() {
		property("Max is a BoundedSemilattice") <- forAll { (a: ArbitraryMax<Int>, b: ArbitraryMax<Int>) in
			Law<Max<Int>>.isIdempotent(a.get,b.get)
		}
	}

	func testMin() {
		property("Min is a BoundedSemilattice") <- forAll { (a: ArbitraryMin<Int>, b: ArbitraryMin<Int>) in
			Law<Min<Int>>.isIdempotent(a.get,b.get)
		}
	}

	func testOr() {
		property("Or is a BoundedSemilattice") <- forAll { (a: Or, b: Or) in
			Law<Or>.isIdempotent(a,b)
		}
	}

	static var allTests = [
		("testAnd",testAnd),
		("testFunctionBS",testFunctionBS),
		("testMax",testMax),
		("testMin",testMin),
		("testOr",testOr),
	]
}
