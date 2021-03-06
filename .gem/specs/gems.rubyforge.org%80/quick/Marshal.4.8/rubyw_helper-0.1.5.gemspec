u:Gem::SpecificationG["
1.3.1i"rubyw_helperU:Gem::Version["
0.1.5Iu:	Time`B�    :@marshal_with_utc_coercionF"LA simple redirector for use when you just want to safely redirect stdioU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"exception_string:@version_requirementsU;[[[">=U; ["0o;		;
:development;0;"	rake;U;[[[">=U; ["0o;		;
;;0;"
bones;U;[[[">=U; ["0o;		;
;;0;"
bacon;U;[[[">=U; ["0"libraggi"raggi@rubyforge.org["James Tucker"�A simple redirector for use when you just want to safely redirect stdio. Simply encapsulates a few different safety mechanisms when redirecting stdio, with the primary goal of making it easier to write apps that run under rubyw.exe, where ruby loads with stdio closed.  Whilst the primary intention for use is under win32, and was actually developed as an external helper for specifically win32-service usage, this gem may be useful to some other folks on other platforms. It is not win32  specific.")http://github.com/raggi/rubyw_helperT@0