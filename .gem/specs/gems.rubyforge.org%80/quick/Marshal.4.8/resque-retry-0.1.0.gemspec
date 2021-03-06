u:Gem::Specification`["
1.3.7i"resque-retryU:Gem::Version["
0.1.0u:	Time���    "\A resque plugin; provides retry, delay and exponential backoff support for resque jobs.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.8.0:
@name"resque:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
1.8.0;
"resque-scheduler;@*;F;;o;
;	U;[[[">=U; ["0;
"test-unit;@4;F;:developmento;
;	U;[[[">=U; ["0;
"	turn;@>;F;;o;
;	U;[[[">=U; ["0;
"	yard;@H;F;;o;
;	U;[[[">=U; ["
0.3.0;
"simplecov-html;@R;F;;0"luke@lividpenguin.com["Luke Antins"Ryan Carver"�  resque-retry provides retry, delay and exponential backoff support for
  resque jobs.

  Features:

  * Redis backed retry count/limit.
  * Retry on all or specific exceptions.
  * Exponential backoff (varying the delay between retrys).
  * Multiple failure backend with retry suppression &amp; resque-web tab.
  * Small &amp; Extendable - plenty of places to override retry logic/settings.
"+http://github.com/lantins/resque-retryF@[ 