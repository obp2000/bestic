u:Gem::Specification["
1.3.5i"daemons-mikehaleU:Gem::Version["1.0.14Iu:	Time��    :@marshal_with_utc_coercionF"WA toolkit to convert your script to a controllable daemon (with Chris Kline's fix)U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"th.uehlinger@gmx.ch[	"Michael Hale"Thomas Uehlinger"Travis Whitton"Chris Kline"|        This is Daemons 1.0.10 with the addition of Chris Kline's fix from http://blog.rapleaf.com/dev/?p=19

        Includes ability to change the process uid/gid. Also logdir can be specified seperate from piddir.

        Daemons provides an easy way to wrap existing ruby scripts (for example a self-written server) to be run as a daemon and to be controlled by simple start/stop/restart commands.

        If you want, you can also use daemons to run blocks of ruby code in a daemon process and to control these processes from the main application.

        Besides this basic functionality, daemons offers many advanced features like exception backtracing and logging (in case your ruby script crashes) and monitoring and automatic restarting of your processes if they crash.

        Daemons includes the daemonize.rb script written by Travis Whitton to do the daemonization process.
"/http://gemcutter.org/gems/daemons-mikehaleT@[ 