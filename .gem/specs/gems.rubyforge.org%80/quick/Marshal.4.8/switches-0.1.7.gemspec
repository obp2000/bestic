u:Gem::Specification�["
1.3.6i"switchesU:Gem::Version["
0.1.7Iu:	Timeċ�    :@marshal_with_utc_coercionF"<Turn on and off parts of your code based on yaml files.U:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.2.9:@prereleaseF:
@type:development:@requirement@ :
@name"
rspeco;	
;
U;[[[">=U; ["
2.3.4;F;:runtime;@*;"activesupport"switches"seamus@abshere.net["Seamus Abshere"�
Switches lets you turn on and off parts of your code from the commandline. There's a defaults.yml and a current.yml in the background.

For example:
app/models/user.rb
after_create :subscribe_email if Switches.campaign_monitor?

&gt;&gt; Switches.campaign_monitor?
# =&gt; false

$ rake switches:on[campaign_monitor]

&gt;&gt; Switches.campaign_monitor?
# =&gt; true

$ rake switches:reset # goes back to default.yml
$ rake switches:diff  # shows diff b/w current.yml and default.yml
$ rake s:d            # alias for switches:diff
$ rake s:c            # alias for switches:list_current

etc.

It's inspired by ActiveSupport's StringInquirer (e.g. Rails.development?) and traditional compile-time assertions.
    "-http://github.com/seamusabshere/switchesT@[ 