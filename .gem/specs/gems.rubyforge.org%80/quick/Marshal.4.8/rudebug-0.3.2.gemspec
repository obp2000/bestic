u:Gem::Specification(["
0.9.0i"rudebugU:Gem::Version["
0.3.2Iu:	Time���    :@marshal_with_utc_coercionF""A graphical debugger for RubyU:Gem::Requirement[[[">=U; ["
1.8.40"	ruby[o:Gem::Dependency:@version_requirement0:
@name"ruby-debug:@version_requirementsU;[[[">=U; ["
0.5.2o;	;
0;"syntax;U;[[[">=U; ["
1.0.00"flgr@ccan.de["Author: Florian Gross"�rudebug is written using Ruby-GNOME2 and Glade. It has support for local and remote debugging with ruby-debug and ruby-breakpoint. It should work fine on Windows and Linux.  It has stepping stepping, a source code display, a powerful object browser and an interactive shell as well as additional integration and polish to make those components work together well.  It is in an early stage and will likely remain so until I have a way of using it on Mac OS X. I don't want this to molder on my hard disk however without ever having seen a public release.  With ~900 lines of actual code (excluding the glade file) it is fairly light-weight. Code quality fluctuates. Some of the code needs to be unusual because it is executed on the server and can't touch its environment, other bits could probably need some refactoring.  It was developed as part of a Summer of Code 2006 project for RubyCentral Inc."0Homepage: http://code.google.com/p/rudebug/T@0