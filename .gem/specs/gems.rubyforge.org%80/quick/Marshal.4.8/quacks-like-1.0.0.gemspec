u:Gem::Specification�["
1.3.6i"quacks-likeU:Gem::Version["
1.0.0u:	Timee��    ";QuacksLike &#8212; RSpec matcher for duck-type testingU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ "quacks-like["cosine@cosine.org"michael@buselli.com["Michael H Buselli"K    QuacksLike is a module for RSpec to add matchers that test if an
    object is fully duck-typed to pretend to be another class.  This
    kind of thing is really only necessary when passing such an
    object as the return value in an API where you don't know
    exactly how it will be consumed, but it needs to "quack like an
    Array" or something.  It does its job by checking every instance
    method in the class that the target object needs to "quack like"
    and makes sure the target both responds to that method name and
    that the arity of the method is appropriate.
"'http://cosine.org/ruby/QuacksLike/T@[ 