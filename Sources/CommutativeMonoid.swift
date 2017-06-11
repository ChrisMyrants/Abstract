/*:
# Commutative Monoid

A Commutative Monoid is a Monoid in which the operation is commutative, thus:

a <> b = b <> a
*/

public protocol CommutativeMonoid: Monoid {}

extension Law where Element: CommutativeMonoid {
	public static func isCommutative(_ a: Element, _ b: Element) -> Bool {
		return (a <> b) == (b <> a)
	}
}

extension LawInContext where Element: CommutativeMonoid {
	public static func isCommutative(_ a: Element, _ b: Element) -> (Element.Context) -> Bool {
		return { context in ((a <> b) == (b <> a))(context) }
	}
}

/*:
## Types
*/

extension Add: CommutativeMonoid {}

//: ------

extension Multiply: CommutativeMonoid {}

//: ------

extension Max: CommutativeMonoid {}

//: ------

extension Min: CommutativeMonoid {}

//: ------

extension Bool: CommutativeMonoid {}

//: ------

public struct FunctionCM<A, M: CommutativeMonoid & Equatable>: CommutativeMonoid, EquatableInContext {
	public typealias Context = A
	
	public let call: (A) -> M
	
	public init(_ call: @escaping (A) -> M) {
		self.call = call
	}
	
	public static func <> (left: FunctionCM, right: FunctionCM) -> FunctionCM {
		return FunctionCM.init { left.call($0) <> right.call($0) }
	}
	
	public static var e: FunctionCM<A, M> {
		return FunctionCM { _ in M.e }
	}
	
	public static func == (left: FunctionCM, right: FunctionCM) -> (Context) -> Bool {
		return { context in left.call(context) == right.call(context) }
	}
}
