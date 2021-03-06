u:Gem::Specification�["
1.3.5i"called_fromU:Gem::Version["
0.1.0Iu:	Time&h���J�:@marshal_with_utc_coercionF"much faster of caller()[0]U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ "called_from"kwa.at.kuwata-lab.com["makoto kuata"jExtention Module 'called_from' provides called_from() global function
which gets filename and line number of caller.

In short:

    require 'called_from'
    filename, linenum, function = called_from(1)

is equivarent to:

    caller(1)[0] =~ /:(d+)( in `(.*)')?/
    filename, linenum, function = $`, $1, $2

But called_from() is much faster than caller()[0].
"*http://github.com/kwatch/called_from/T@[ 