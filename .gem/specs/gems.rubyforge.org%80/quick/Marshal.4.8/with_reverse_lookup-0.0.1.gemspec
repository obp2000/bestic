u:Gem::SpecificationL["
1.3.7i"with_reverse_lookupU:Gem::Version["
0.0.1u:	Time$��    ".Bidirectional key/value lookup for hashesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"mtodd@highgroove.com["Matt Todd";    Provides a simple modification to existing hashes to provide key lookup
    by value in addition to value lookup by key.
    
    For example:
    
    TABLE = { :key =&gt; 1 }.extend(WithReverseLookup)
    
    TABLE[:key] #=&gt; 1
    TABLE[1]    #=&gt; :key
    
    This is mostly useful for lookup tables.
"0http://github.com/mtodd/with_reverse_lookupT@[ 