u:Gem::Specification"["
1.3.6i"ffi-rzmqU:Gem::Version["
0.5.0u:	TimeŔ�    "aThis gem wraps the ZeroMQ networking library using the ruby FFI (foreign function interface)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
3.4.3:
@name"
bones:@requirement@ :@prereleaseF:
@type:development"ffi-rzmq"cremes@mac.com["Chuck Remes"gThis gem wraps the ZeroMQ networking library using the ruby FFI (foreign
function interface). It's a pure ruby wrapper so this gem can be loaded
and run by any ruby runtime that supports FFI. Right now that means
MRI 1.8.7, 1.9.1 and JRuby.

The impetus behind this library was to provide support for ZeroMQ in
JRuby which has native threads. Unlike MRI, MacRuby, IronRuby and
Rubinius which all have a GIL, JRuby allows for threaded access to ruby
code from outside extensions. ZeroMQ is heavily threaded, so until the
other runtimes remove their GIL, JRuby will likely be the best
environment to run this library."*http://github.com/chuckremes/ffi-rzmqT@[ 