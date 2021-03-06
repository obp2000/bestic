u:Gem::Specification["
1.3.6i"requiredU:Gem::Version["
0.1.3Iu:	TimeE��    :@marshal_with_utc_coercionF"?Required is a utility to require all files in a directory.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"ashirazi@codesherpas.com["Arild Shirazi"�Required is a utility to require all files in a directory.

Why would one want to require a whole bunch of files at once? I have used this
gem on 2 projects to:
  - require dozens of jar files when working on a JRuby project
  - pull in all files before running code coverage (rcov), to find code that
      is otherwise dead/untouched

Options for required include the ability to recursively descend through
subdirectories, include/exclude files based on pattern matching, and to specify
the order of requires based on filename.  An array of all the files that were
loaded is returned.

Quick example:
  require 'required'
  required "some/path/to/dir"

See the README for more examples, and description of options.
"(http://github.com/ashirazi/requiredT@[ 