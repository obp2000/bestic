u:Gem::Specification�["
1.3.4i"startatU:Gem::Version["
0.1.0Iu:	Time�[�    :@marshal_with_utc_coercionF"8StartAt is a simple class for future code executionU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:development:
@name"hoe:@version_requirementsU;[[[">=U; ["
2.3.2:@version_requirement0"startat[" ikawnoclast@interocitry.com["Keith Watson"#StartAt is a simple class for future code execution.  It is designed
to execute a block of code at a specific point in time in the future.

StartAt works by spawning a new thread, determining how long it must wait (in 
seconds) until the future date and time is reached, calling sleep with the
exact number of seconds to wait, and then executing the code block.

StartAt was derived from a script written to post schedule information to
Twitter for a symposium. The schedule robot posted event details exactly
five minutes in advance of the event.""http://startat.rubyforge.org/T@[ 