u:Gem::Specification["
0.9.2i"	itcfU:Gem::Version["
1.0.0Iu:	Timev��    :@marshal_with_utc_coercionF"FIXU:Gem::Requirement[[[">U; ["
0.0.00"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.3.0"fiscalcode"+gerardo.lamastra <at> telecomitalia.it["Gerardo Lamastra"�== FEATURES/PROBLEMS:  FiscalCode.calc will throw an ArgumentError Exception if it cannot do the calculation, for example because day,month and years are not in the proper range (1-31,1-12,0-99), or because the city cannot be located in the city database.    == SYNOPSIS:  Use: FiscalCode.calc(name, surname, day, month, year, sex, city) Es. FiscalCode.calc(&quot;Mario&quot;, &quot;Rossi&quot;, 31,12,80, &quot;M&quot;, &quot;Milano&quot;)  == INSTALL:"== DESCRIPTION:
T@0