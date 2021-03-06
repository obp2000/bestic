u:Gem::Specification ["
1.0.1i"rubysyncU:Gem::Version["
0.2.1Iu:	TimeP�    :@marshal_with_utc_coercionF"1Event driven identity synchronization engineU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency:@version_requirement0:
@name"ruby-net-ldap:@version_requirementsU;[[[">=U; ["
0.0.4o;	;
0;"activesupport;U;[[[">=U; ["
1.4.0o;	;
0;"activerecord;U;[[[">=U; ["1.15.3o;	;
0;"simpleconsole;U;[[[">=U; ["
0.1.1o;	;
0;"contacts;U;[[[">=U; ["
1.0.7o;	;
0;"hoe;U;[[[">=U; ["
1.5.1"rubysync"ritchiey@gmail.com["Ritchie Young"�== DESCRIPTION:  RubySync is a tool for synchronizing part or all of your directory, database or application data with anything else. It's event driven so it will happily sit there monitoring changes and passing them on. Alternatively, you can run it in one-shot mode and simply sync A with B.  You can configure RubySync to perform transformations on the data as it syncs. RubySync is designed both as a handy utility to pack into your directory management toolkit or as a fully-fledged provisioning system for your organization.  == FEATURES/PROBLEMS:  * Event-driven synchronization (if connector supports it) with fall-back to polling * Ruby DSL for &quot;configuration&quot; style event processing * Clean separation of connector details from data transformation * Connectors available for CSV files, XML, LDAP and RDBMS (via ActiveRecord) * Easy API for writing your own connectors  == SYNOPSIS:"    by Ritchie YoungT@0