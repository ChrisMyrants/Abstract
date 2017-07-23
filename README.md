# Abstract

Basic definitions for abstract algebraic structures in Swift.

To each structure are assigned some laws, that can be verified with property-based testing (and are verified for all the types considered in this repo using SwiftCheck), so than anyone can give some structure to more types: the only thing that's required is to verify the laws.

Files have comments to help understand the underlying theory, but each file builds on top of the others, so a good order to read them could be:

- Law.swift
- Magma.swift
- Semigroup.swift
- Monoid.Swift
- CommutativeMonoid.swift
- BoundedSemilattice.swift

The other files can be read in any order after these 6.

In the `Utilities` folder there are some useful functions, to start using these types in real-world programming.

------

This work is largely based on some talks of the 2017 [Functional Swift Conference](http://2017.funswiftconf.com), in particular [this](https://www.youtube.com/watch?v=6z9QjDUKkCs) and [this](https://www.youtube.com/watch?v=VFPhPOnPiTY).

The goal is to try and give a pragmatic, practical standard for abstract algebra usage in Swift. My main point is also that a usable library should expose a way to enforce the laws on types, and that's what I tried to do here with the `Law` namespace.

There's still a lot of limitations in Swift's' type system, that require some overrides and workarounds to be able to express some things (particularly when working with functions). I will update the library along with Swift's evolution, let's hope that those loose ends are tied as soon as possible: for example when [this](https://github.com/apple/swift-evolution/blob/master/proposals/0143-conditional-conformances.md) (accepted) proposal will be implementaed, everything will change for good, especially in the standard library.

------

I don't have a background in maths. I learned these things in the last few years, while also finding ways to practically apply them in my everyday work. Thus, there could be some mistakes regarding the bits of exposed theory behind all this.

Mistakes are bad, and should be removed. But I think it's extremely important to understand that concepts often change face when moving from a language to another: Swift is not Agda, Haskell or Scala... Swift is its own thing, and I find very important to try and define things in a "Swifty" way.

A plain translation into Swift from a language with a more sophisticated type system will almost certainly result in something ugly and non-practically usable. So I think it's ok to do stuff a little less rigorous (without losing laws conformance or writing unsound code, of course) but much more practically usable.

------

One final note: the closest thing to this that I could find on GitHub is the [Algebra](https://github.com/typelift/Algebra) library from typelift (the same organization behind the glorious SwiftCheck library). There are differences between this library and `Algebra`, mainly there is a plain definition of `Monoid` instead of `Additive` and `Multiplicative`. But a huge difference is probably the fact that `Algebra` is supposed to be an "exploration", like many other explorations out there of functional concepts applyied to Swift, that I also did and keep doing, trying to push the boudaries of Swift's expressivity. In general I wanted to take a different path in defining what are basically the same things, but the exploration I'm interested in is about practical applications rather than finding ways to express the theoretical concepts of abstract algebra in Swift's type system.

So, this repo is my contribution and proposal to the cause.

------

## Sourcery usage

Test code and `Arbitrary` type definitions are automatically generated for (almost) all types using [Sourcery](https://github.com/krzysztofzablocki/Sourcery)

The script in `sourceryTests.sh` requires Sourcery to scan source files in `Sources/Abstract` and generate code with the templates defined in `Templates/Tests`; generated files are put in `Tests/AbstractTests` and are recognizable by the `.generated` in the name: these files must not be edited manually. Also an `Arbitrary.generate.swift` file is automatically generated, along with `Linux.main.swift`.

Sourcery is just a tool for code generation: at compile time the actual check for a type to conform to a certain protocol is guaranteed by the functions defined in the `Law` namespace, thus the generated tests are associated to specific algebraic structures rather than particular properties (like "associative" or "idempotent").

Sourcery will automatically generate tests for all types conforming to the protocols representing the algebraic data structures considered, and some annotations associated with a type (in the form `// sourcery: annotation`) will allow some fine tuning or `Arbitrary` generation:

- `ignore = "value"`: Sourcery will not generate tests related to that protocol for that type; "value" is the protocol's name (like "Semigroup" or "CommuntativeMonoid");
- `fixedTypesForPropertyBasedTests = "value"`: for generic types it defines the concrete type to be used in tests; if more than one generic type is present, all types must be separated by a comma;
- `requiredContextForPropertyBasedTests = "value"`: use `LawInContext` instead of `Law`; "value" is the context type; this is required if the type wraps a function;
- `arbitrary`: Sourcery will generate the `Arbitrary` definitions for that type; if it's a non-generic type Sourcery will add a `extension Type: Arbitrary`; if the type is generic, Sourcery will define a new `struct ArbitraryType<T: Arbitrary>: Arbitrary`;
- `arbitraryFunction`: same as `arbitrary` but for function wrappers (like `FunctionS`);
- `arbitraryGenericParameterProtocols = "value"`: if the type is generic, Sourcery will add these constraints for the generic parameter `T` in `ArbitraryType<T>` in the form of `T: value`
- `additionalGenericParameterSubtypeRequirement = "value"`: if the type is generic, and a subtype of the generic paramter has some additional constraints, Sourcery will add them to `ArbitraryType<T>` in the form of `T.value` (example: `T.Additive: Equatable` if "value" is `Additive: Equatable`);
- `additionalGenericParameterSubtypeRequirements = "value"`: same as before, but there's more than one requirement; in this case, more than one `additionalGenericParameterSubtypeRequirements` annotation should be added; if there's only one requirement, `additionalGenericParameterSubtypeRequirement` should be used.
