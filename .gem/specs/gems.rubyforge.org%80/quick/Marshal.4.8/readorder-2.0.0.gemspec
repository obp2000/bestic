u:Gem::Specification�["
1.3.1i"readorderU:Gem::Version["
2.0.0Iu:	Time_�    :@marshal_with_utc_coercionF"FReadorder orders a list of files into a more effective read orderU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[["~>U; ["
0.0.5:
@name"configuration:
@type:runtime:@version_requirement0o;		;
U;[[["~>U; ["0.11.0;"amalgalite;;;0o;		;
U;[[["~>U; ["
2.8.3;"	main;;;0o;		;
U;[[["~>U; ["
1.1.4;"logging;;;0o;		;
U;[[["~>U; ["
1.0.4;"hitimes;;;0o;		;
U;[[["~>U; ["
0.8.3;"	rake;:development;0"copiousfreetime"jeremy@copiousfreetime.org["Jeremy Hinegardner"Readorder orders a list of files into a more effective read order.  You would possibly want to use readorder in a case where you know ahead of time that you have a large quantity of files on disc to process.  You can give that list off those files and it will report back to you the order in which you should process them to make most effective use of your disc I/O.  Given a list of filenames, either on the command line or via stdin, readorder will output the filenames in an order that should increase  the I/O throughput when the files corresponding to the filenames are read off of disc.  The output order of the filenames can either be in inode order or physical disc block order.  This is dependent upon operating system support and permission level of the user running readorder."$http://readorder.rubyforge.org/T@0