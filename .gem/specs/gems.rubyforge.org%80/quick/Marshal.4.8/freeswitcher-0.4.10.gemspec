u:Gem::Specification�["
1.3.5i"freeswitcherU:Gem::Version["0.4.10Iu:	TimeƂ�    :@marshal_with_utc_coercionF"]A library for interacting with the "FreeSWITCH":http://freeswitch.org telephony platformU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"eventmachine:@version_requirementsU;[[[">=U; ["0"freeswitcher"FreeSWITCHeR@rubyists.com[	"Jayson Vaughn"Michael Fellinger"Kevin Berry"TJ Vanderpoel"�=========================================================
FreeSWITCHeR
Copyright (c) 2009 The Rubyists (Jayson Vaughn, Tj Vanderpoel, Michael Fellinger, Kevin Berry) 
Distributed under the terms of the MIT License.
==========================================================

ABOUT
-----
A ruby library for interacting with the "FreeSWITCH" (http://www.freeswitch.org) opensource telephony platform

REQUIREMENTS
------------
* ruby (&gt;= 1.8)
* eventmachine (If you wish to use Outbound and Inbound listener)

USAGE
-----

An Outbound Event Listener Example that reads and returns DTMF input:
--------------------------------------------------------------------

Simply just create a subclass of FSR::Listner::Outbound and all
new calls/sessions will invoke the "session_initiated" callback method.

&lt;b&gt;NOTE&lt;/b&gt;: FSR uses blocks within the 'session_inititated' method to ensure that the next "freeswich command" is not executed until the previous "Freeswitch command" has finished.  (Basically a continuation) This is kicked off by "answer do". 

  #!/usr/bin/ruby
  require 'fsr'
  require 'fsr/listener/outbound'

  class OutboundDemo &lt; FSR::Listener::Outbound

    def session_initiated
      exten = @session.headers[:caller_caller_id_number]
      FSR::Log.info "*** Answering incoming call from #{exten}"

      answer do
        FSR::Log.info "***Reading DTMF from #{exten}"
        read("/home/freeswitch/freeswitch/sounds/music/8000/sweet.wav", 4, 10, "input", 7000) do |read_var|
          FSR::Log.info "***Success, grabbed #{read_var.to_s.strip} from #{exten}"
          # Tell the caller what they entered
          speak("Got the DTMF of: #{read_var.to_s.strip}") do 
            #Hangup the call
            hangup 
          end
        end
      end

    end

  end

  FSR.start_oes! OutboundDemo, :port =&gt; 8084, :host =&gt; "127.0.0.1"

An Inbound Event Socket Listener example using FreeSWITCHeR's hook system:
--------------------------------------------------------------------------

  #!/usr/bin/ruby
  require 'pp'
  require 'fsr'
  require "fsr/listener/inbound"

  # EXAMPLE 1 
  # This adds a hook on CHANNEL_CREATE events. You can also create a method to handle the event you're after. See the next example
  FSL::Inbound.add_event_hook(:CHANNEL_CREATE) { FSR::Log.info "*** [#{event.content[:unique_id]}] Channel created - greetings from the hook!" }

  # EXAMPLE 2
  # Define a method to handle CHANNEL_HANGUP events.
  def custom_channel_hangup_handler(event)
    FSR::Log.info "*** [#{event.content[:unique_id]}] Channel hangup. The event:"
    pp event
  end

  # This adds a hook for EXAMPLE 2
  FSL::Inbound.add_event_hook(:CHANNEL_HANGUP) { custom_channel_hangup_handler(event) }


  # Start FSR Inbound Listener
  FSR.start_ies!(FSL::Inbound, :host =&gt; "localhost", :port =&gt; 8021)


An Inbound Event Socket Listener example using the on_event callback method instead of hooks:
---------------------------------------------------------------------------------------------

  #!/usr/bin/ruby
  require 'pp'
  require 'fsr'
  require "fsr/listener/inbound"


  class IesDemo &lt; FSR::Listener::Inbound

    def on_event
      pp event.headers
      pp event.content[:event_name]
    end

  end

  FSR.start_ies!(IesDemo, :host =&gt; "localhost", :port =&gt; 8021, :auth =&gt; "ClueCon")


An example of using FSR::CommandSocket to originate a new call in irb:
----------------------------------------------------------------------

  irb(main):001:0&gt; require 'fsr'
  =&gt; true

  irb(main):002:0&gt; FSR.load_all_commands
  =&gt; [:sofia, :originate]

  irb(main):003:0&gt; sock = FSR::CommandSocket.new
  =&gt; #&lt;FSR::CommandSocket:0xb7a89104 @server="127.0.0.1", @socket=#&lt;TCPSocket:0xb7a8908c&gt;, @port="8021", @auth="ClueCon"&gt;

  irb(main):007:0&gt; sock.originate(:target =&gt; 'sofia/gateway/carlos/8179395222', :endpoint =&gt; FSR::App::Bridge.new("user/bougyman")).run
  =&gt; {"Job-UUID"=&gt;"732075a4-7dd5-4258-b124-6284a82a5ae7", "body"=&gt;"", "Content-Type"=&gt;"command/reply", "Reply-Text"=&gt;"+OK Job-UUID: 732075a4-7dd5-4258-b124-6284a82a5ae7"}



SUPPORT
-------
Home page at http://code.rubyists.com/projects/fs
#rubyists on FreeNode
")http://code.rubyists.com/projects/fsT@[ 