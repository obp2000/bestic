u:Gem::Specification�["
1.3.7i"request-log-analyzerU:Gem::Version["
1.9.3u:	Timev��    "qA command line tool to analyze request logs for Apache, Rails, Merb, MySQL and other web application serversU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["0:
@name"	rake:@requirement@ :@prereleaseF:
@type:developmento;
;	U;[[[">=U; ["0;
"
rspec;@*;F;;o;
;	U;[[[">=U; ["0;
"activerecord;@4;F;;o;
;	U;[[[">=U; ["0;
"sqlite3-ruby;@>;F;;"
r-l-a["willem@railsdoctors.com"bart@railsdoctors.com["Willem van Bergen"Bart ten Brinke"�    Request log analyzer's purpose is to find out how your web application is being used, how it performs and to
    focus your optimization efforts. This tool will parse all requests in the application's log file and aggregate the 
    information. Once it is finished parsing the log file(s), it will show the requests that take op most server time 
    using various metrics. It can also insert all parsed request information into a database so you can roll your own
    analysis. It supports Rails-, Merb- and Rack-based applications logs, Apache and Amazon S3 access logs and MySQL 
    slow query logs out of the box, but file formats of other applications can easily be supported by supplying an 
    easy to write log file format definition.
"http://railsdoctors.comT@[ 