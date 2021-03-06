u:Gem::Specification["
1.3.5i"logrotateU:Gem::Version["
1.2.1Iu:	Time%��    :@marshal_with_utc_coercionF"]This package is a library of methods that perform log rotation on files and  directoriesU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:
@name"rubyforge:@version_requirementsU;[[[">=U; ["
2.0.3o;		;
;;0;"gemcutter;U;[[[">=U; ["
0.3.0o;		;
;;0;"hoe;U;[[[">=U; ["
2.5.0"logrotate[".technical.inquiries@designingpatterns.com["DesigningPatterns"�This package is a library of methods that perform log rotation on files and 
directories.  The log rotate methods allow the caller to specify options (via
parameters) such as how many rotated files to keep, what type of
extension to place on the rotated file (date or a simple count), and
whether to zip the rotated files.  Live log files (currently being
written to by a live process) can be rotated as well.  The post_rotate
option is useful in that context, as it can be used to send a HUP
signal to notify the live process to reopen its log file.

This package was inspired by the need to have a library version of the
unix logrotate tool.  The unix logrotate tool requires the user to
specify options in a config file, and is usually invoked through cron.

Directories can be rotated with this library.  However, the gzip option
does not work with directories.  In this case, please zip/tar the directory
in question before invoking this library."0http://www.rubyforge.org/projects/logrotateT@[ 