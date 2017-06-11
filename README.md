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

A plain translation into Swift from a language with a more sofisticated type system will almost certainly result in something ugly and non-practically usable. So I think it's ok to do stuff a little less rigorous (without losing laws conformance or writing unsound code, of course) but much more practically usable.
