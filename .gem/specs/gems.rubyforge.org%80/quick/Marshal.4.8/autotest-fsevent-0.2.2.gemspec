u:Gem::Specificationh["
1.3.5i"autotest-fseventU:Gem::Version["
0.2.2Iu:	Time7��    :@marshal_with_utc_coercionF"LUse FSEvent (on Mac OS X 10.5 or higher) instead of filesystem polling.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["
1.3.0:
@type:development:@version_requirement0:
@name"
rspeco;		;
U;[[[">=U; ["
4.2.4;:runtime;0;"autotesto;		;
U;[[[">=U; ["0;;;0;"sys-uname0"ruby@bitcetera.com["Sven Schwyn"2Autotest relies on filesystem polling to detect modifications in source code files. This is expensive for the CPU, harddrive and battery - and unnecesary on Mac OS X 10.5 or higher which comes with the very efficient FSEvent core service for this very purpose. This gem teaches autotest how to use FSEvent."7http://www.bitcetera.com/products/autotest-fseventT@[ 