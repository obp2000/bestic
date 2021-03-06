u:Gem::SpecificationK["
1.3.6i"chimeraU:Gem::Version["
0.0.4Iu:	Time��    :@marshal_with_utc_coercionF"3Chimera is an object mapper for Riak and RedisU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[["=U; ["3.0.0.beta:@prereleaseF:
@type:runtime:@requirement@ :
@name"activesupporto;	
;
U;[[["=U; ["
2.1.1;F;;;@*;"uuidtoolso;	
;
U;[[["=U; ["3.0.0.beta;F;;;@4;"activemodelo;	
;
U;[[["=U; ["
0.7.4;F;;;@>;"yajl-rubyo;	
;
U;[[["=U; ["
1.0.0;F;;;@H;"fast-stemmero;	
;
U;[[[">=U; ["
2.0.3;F;:development;@R;"rubyforgeo;	
;
U;[[[">=U; ["
0.4.1;F;;;@\;"gemcuttero;	
;
U;[[[">=U; ["
2.5.0;F;;;@f;"hoe"chimera["ben.myles@gmail.com["Ben Myles"Chimera is an object mapper for Riak and Redis. The idea is to mix the advantages of Riak
(scalability, massive data storage) with Redis (atomicity, performance, data structures).
You should store the bulk of your data in Riak, and then use Redis data structures where
appropriate (for example, a counter or set of keys).

Internally, Chimera uses Redis for any indexes you define as well as some default indexes
that are automatically created. There's no built in sharding for Redis, but since it's
only being used for key storage and basic data elements you should be able to go a long
way with one Redis server (especially if you use the new Redis VM).

!! Chimera is alpha. It's not production tested and needs a better test suite. !!
!! It's also only tested in Ruby 1.9. !!"'http://github.com/benmyles/chimeraT@[ 