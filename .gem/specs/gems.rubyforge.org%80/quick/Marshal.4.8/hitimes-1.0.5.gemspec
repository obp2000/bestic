u:Gem::Specification�["
1.3.7i"hitimesU:Gem::Version["
1.0.5Iu:	Time���    :@marshal_with_utc_coercionF"WHitimes is a fast, high resolution timer library for recording performance metricsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[["~>U; ["
0.8.1:@requirement@ :
@type:runtime:@prereleaseF:
@name"	rakeo;	
;
U;[[["~>U; ["
0.0.5;@*;;;F;"configurationo;	
;
U;[[["~>U; ["
1.1.3;@4;:development;F;"	jsono;	
;
U;[[["~>U; ["
0.5.0;@>;;;F;"rake-compiler"copiousfreetime"jeremy@copiousfreetime.org["Jeremy Hinegardner" Hitimes is a fast, high resolution timer library for recording
performance metrics.  It uses the appropriate C method calls for each
system to get the highest granularity time increments possible.  

It currently supports any of the following systems:

* any system with the POSIX call &lt;tt&gt;clock_gettime()&lt;/tt&gt;,
* Mac OS X
* Windows

Using Hitimes can be faster than using a series of +Time.new+ calls, and
it will have a much higher granularity.   It is definitely faster than
using +Process.times+."2http://copiousfreetime.rubyforge.org/hitimes/T@[ 