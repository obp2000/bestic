u:Gem::Specification^["
1.3.5i"autotest-run_dependenciesU:Gem::Version["
0.1.0Iu:	Time�h�    :@marshal_with_utc_coercionF"$Test dependencies for autotest.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:@version_requirementsU;[[[">=U; ["
3.9.0:
@name"ZenTest0"tobyclemson@gmail.com["Toby Clemson"�This gem provides a mechanism through which it is possible to specify that 
an arbitrary number of external dependencies are satisfied before a test 
run can be executed.

Dependencies are added by specifying a name, command, satisfied_regexp and 
errors_regexp parameter for each. The command refers to a script that is 
run to satisfy or test the dependency. If the output of the command 
(either to standard output or standard error) matches the satisfied_regexp 
then the dependency is considered met otherwise any lines in the output 
matching errors_regexp are output and the dependency test waits for changes 
to the codebase before trying to satisfy the dependency again.
"<http://github.com/tobyclemson/autotest-run_dependenciesT@[ 