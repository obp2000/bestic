u:Gem::Specification�["
1.1.1i"	needU:Gem::Version["
1.1.0Iu:	Time�    :@marshal_with_utc_coercionF"+Need makes relative requries just workU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency:@version_requirement0:
@name"hoe:@version_requirementsU;[[[">=U; ["
1.5.3"	need"drew@drewolson.org["Drew Olson"N== DESCRIPTION:  Need makes ruby relative requires just work. Simply need a file with a relative path and the file will always be required correctly, regardless of what file your application is being launched through. Typically, ruby projects would unshift lib onto $PATH or use the File.dirname(__FILE__) trick. Using need means you don't have to worry about either of these.  Assume you have two files, one directly in lib and the other in lib/extensions. Let's assume that file_a in lib requires file_b, in lib/extensions. Previously, you would doing some crazy load path unshifting or use the __FILE__ trick to make these requires flexible enough to work when your app is being accessed by rake, through a test suite, or required as a gem. Now, just use need.  In file_a: need{&quot;extensions/file_b&quot;} need &quot;extensions/file_b&quot;"http://need.rubyforge.orgT@0