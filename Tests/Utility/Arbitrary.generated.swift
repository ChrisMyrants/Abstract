// Generated using Sourcery 0.7.2 — https://github.com/krzysztofzablocki/Sourcery
// DO NOT EDIT

import SwiftCheck
@testable import Abstract


// MARK: - Arbitrary for structs and classes

struct ArbitraryAdd<T>: Arbitrary where T: Arbitrary & Addable {
    let get: Add<T>
    init(_ get: Add<T>) {
        self.get = get
    }

    public static var arbitrary: Gen<ArbitraryAdd<T>> {
        return Gen<Add<T>>
            .compose {
                Add<T>.init(
                    unwrap: $0.generate()
                )
            }
            .map(ArbitraryAdd<T>.init)
    }
}

extension And: Arbitrary {
    public static var arbitrary: Gen<And> {
        return Gen<And>
            .compose {
                And.init(
                    unwrap: $0.generate()
                )
        }
    }
}

struct ArbitraryMax<T>: Arbitrary where T: Arbitrary & ComparableToBottom {
    let get: Max<T>
    init(_ get: Max<T>) {
        self.get = get
    }

    public static var arbitrary: Gen<ArbitraryMax<T>> {
        return Gen<Max<T>>
            .compose {
                Max<T>.init(
                    unwrap: $0.generate()
                )
            }
            .map(ArbitraryMax<T>.init)
    }
}

struct ArbitraryMin<T>: Arbitrary where T: Arbitrary & ComparableToTop {
    let get: Min<T>
    init(_ get: Min<T>) {
        self.get = get
    }

    public static var arbitrary: Gen<ArbitraryMin<T>> {
        return Gen<Min<T>>
            .compose {
                Min<T>.init(
                    unwrap: $0.generate()
                )
            }
            .map(ArbitraryMin<T>.init)
    }
}

struct ArbitraryMultiply<T>: Arbitrary where T: Arbitrary & Multipliable {
    let get: Multiply<T>
    init(_ get: Multiply<T>) {
        self.get = get
    }

    public static var arbitrary: Gen<ArbitraryMultiply<T>> {
        return Gen<Multiply<T>>
            .compose {
                Multiply<T>.init(
                    unwrap: $0.generate()
                )
            }
            .map(ArbitraryMultiply<T>.init)
    }
}

extension Or: Arbitrary {
    public static var arbitrary: Gen<Or> {
        return Gen<Or>
            .compose {
                Or.init(
                    unwrap: $0.generate()
                )
        }
    }
}

struct ArbitraryTropical<T>: Arbitrary where T: Arbitrary & ComparableToTop & Addable {
    let get: Tropical<T>
    init(_ get: Tropical<T>) {
        self.get = get
    }

    public static var arbitrary: Gen<ArbitraryTropical<T>> {
        return Gen<Tropical<T>>
            .compose {
                Tropical<T>.init(
                    unwrap: $0.generate()
                )
            }
            .map(ArbitraryTropical<T>.init)
    }
}

// MARK: - Arbitrary for enums

extension Ordering: Arbitrary {
    public static var arbitrary: Gen<Ordering> {
        return Gen<Ordering>.one(of: [
            Gen.pure(Ordering.lowerThan),
            Gen.pure(Ordering.equalTo),
            Gen.pure(Ordering.greaterThan)
        ])
    }
}

// MARK: - Arbitrary for function wrappers

struct ArbitraryFunctionBS<S,T>: Arbitrary where S: CoArbitrary & Hashable, T: Arbitrary & BoundedSemilattice & Equatable {
	let get: FunctionBS<S,T>
	init(_ value: @escaping (S) -> T) {
		self.get = FunctionBS.init(value)
	}

	public static var arbitrary: Gen<ArbitraryFunctionBS<S,T>> {
		return ArrowOf<S,T>.arbitrary.map { $0.getArrow }.map(ArbitraryFunctionBS<S,T>.init)
	}
}

struct ArbitraryFunctionCM<S,T>: Arbitrary where S: CoArbitrary & Hashable, T: Arbitrary & CommutativeMonoid & Equatable {
	let get: FunctionCM<S,T>
	init(_ value: @escaping (S) -> T) {
		self.get = FunctionCM.init(value)
	}

	public static var arbitrary: Gen<ArbitraryFunctionCM<S,T>> {
		return ArrowOf<S,T>.arbitrary.map { $0.getArrow }.map(ArbitraryFunctionCM<S,T>.init)
	}
}

struct ArbitraryFunctionM<S,T>: Arbitrary where S: CoArbitrary & Hashable, T: Arbitrary & Monoid & Equatable {
	let get: FunctionM<S,T>
	init(_ value: @escaping (S) -> T) {
		self.get = FunctionM.init(value)
	}

	public static var arbitrary: Gen<ArbitraryFunctionM<S,T>> {
		return ArrowOf<S,T>.arbitrary.map { $0.getArrow }.map(ArbitraryFunctionM<S,T>.init)
	}
}

struct ArbitraryFunctionS<S,T>: Arbitrary where S: CoArbitrary & Hashable, T: Arbitrary & Semigroup & Equatable {
	let get: FunctionS<S,T>
	init(_ value: @escaping (S) -> T) {
		self.get = FunctionS.init(value)
	}

	public static var arbitrary: Gen<ArbitraryFunctionS<S,T>> {
		return ArrowOf<S,T>.arbitrary.map { $0.getArrow }.map(ArbitraryFunctionS<S,T>.init)
	}
}
