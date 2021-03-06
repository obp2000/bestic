u:Gem::Specification�["
1.3.5i" ngmoco-request-log-analyzerU:Gem::Version["
1.4.2Iu:	Timee�    :@marshal_with_utc_coercionF"jA command line tool to analyze request logs for Apache, Rails, Merb and other web application serversU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:@version_requirement0:@version_requirementsU;[[[">=U; ["
1.2.4:
@name"
rspeco;		;
;;0;U;[[[">=U; ["
1.1.0;"git"
r-l-a["willem@railsdoctors.com"bart@railsdoctors.com["Willem van Bergen"Bart ten Brinke"�    Request log analyzer's purpose is to find ot how your web application is being used and to focus your optimization efforts.
    This tool will parse all requests in the application's log file and aggregate the information. Once it is finished parsing
    the log file(s), it will show the requests that take op most server time using various metrics. It can also insert all
    parsed request information into a database so you can roll your own analysis. It supports Rails- and Merb-based applications
    and Apache access log files out of the box, but file formats of other applications can easily be supported by supplying an
    easy to write log file format definition.
"http://railsdoctors.comT@[ 