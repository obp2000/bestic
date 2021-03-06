u:Gem::Specification�["
1.3.5i"win32-file-statU:Gem::Version["
1.3.4Iu:	Time�]�    :@marshal_with_utc_coercionF".A File::Stat class tailored to MS WindowsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["
1.0.0:
@name"windows-pr:
@type:runtime:@version_requirement0o;		;
U;[[[">=U; ["
2.0.2;"test-unit;:development;0"Win32Utils"djberg96@gmail.com["Daniel J. Berger"Park Heesob"�      The win32-file-stat library provides a custom File::Stat class
      specifically tailored for MS Windows. Examples include the ability
      to retrieve file attributes (hidden, archive, etc) as well as the
      redefinition of certain core methods that either aren't implemented
      at all, such as File.blksize, or methods that aren't implemented
      properly, such as File.size.
"1http://www.rubyforge.org/projects/win32utilsT@["Artistic 2.0