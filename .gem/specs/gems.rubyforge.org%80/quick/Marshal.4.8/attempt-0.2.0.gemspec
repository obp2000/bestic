u:Gem::SpecificationP["
1.3.5i"attemptU:Gem::Version["
0.2.0Iu:	TimeFc�    :@marshal_with_utc_coercionF"6A thin wrapper for begin + rescue + sleep + retryU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["0:
@name"structured_warnings:
@type:runtime:@version_requirement0o;		;
U;[[[">=U; ["
2.0.3;"test-unit;:development;0"shards"djberg96@gmail.com["Daniel J. Berger"M      The attempt library provides a thin wrapper for the typical
      begin/rescue/sleep/retry dance. Use this in order to robustly
      handle blocks of code that could briefly flake out, such as a socket
      or database connection, where it's often better to try again after
      a brief period rather than fail immediately.
"-http://www.rubyforge.org/projects/shardsT@["Artistic 2.0