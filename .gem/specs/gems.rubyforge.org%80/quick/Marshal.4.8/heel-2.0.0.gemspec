u:Gem::Specification�["
1.3.1i"	heelU:Gem::Version["
2.0.0Iu:	TimeW�    :@marshal_with_utc_coercionF"_Heel is a small static web server for use when you need a quick web server for a directoryU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[	o:Gem::Dependency	:
@type:runtime:
@name"	thin:@version_requirementsU;[[["~>U; ["
1.2.0:@version_requirement0o;		;
;;"mime-types;U;[[["~>U; ["	1.16;0o;		;
;;"launchy;U;[[["~>U; ["
0.3.2;0o;		;
;;"coderay;U;[[["~>U; ["0.8.260;0"copiousfreetime""jeremy at hinegardner dot org["Jeremy Hinegardner"PHeel is a small static web server for use when you need a quick web server for a directory.  Once the server is running, heel will use {launchy}[http://copiousfreetime.rubyforge.org/launchy/] to open your browser at the URL of your document root.  Heel is built using {Rack}[http://rack.rubyforge.org] and {Thin}[http://code.macournoyer.com/thin/]  % heel         &gt;&gt; Thin web server (v1.0.0 codename That's What She Said) &gt;&gt; Threaded mode OFF &gt;&gt; Maximum connections set to 1024 &gt;&gt; Listening on 0.0.0.0:4331, CTRL+C to stop Launching your browser...  Or run it in the background  % heel --daemonize Created /Users/jeremy/.heel heel's PID (/Users/jeremy/.heel/heel.pid) and log file (/Users/jeremy/.heel/heel.log) are stored here Launching your browser at http://0.0.0.0:4331/  % heel --kill Sending TERM to process 3304 Done."/http://copiousfreetime.rubyforge.org/heel/T@0