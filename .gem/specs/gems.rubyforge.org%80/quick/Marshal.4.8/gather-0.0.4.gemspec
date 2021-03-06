u:Gem::Specification�["
1.3.5i"gatherU:Gem::Version["
0.0.4Iu:	Time6`�    :@marshal_with_utc_coercionF"MA gem that provides modules to make working with properties a bit easierU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["
1.3.0:
@name"newgem:
@type:development:@version_requirement0o;		;
U;[[[">=U; ["
1.8.0;"hoe;;;0"clevic["panic@semiosix.com["John Anderson"�A gem that provides modules to make working with properties a bit easier.

For example:

  class SumThing
    include Gather
    property :thing, :spla, :gumf, :troob
  end

  s = SumThing.new.gather :spla =&gt; 'five', :thing =&gt; 'sigma' do
    troob %w{one two three four}
    gumf 15 % 4
  end

Or

  s = SumThing.new.gather :spla =&gt; 'five', :thing =&gt; 'sigma' do |s|
    s.troob = %w{one two three four}
    s.gumf = 15 % 4
  end" http://gather.rubyforge.orgT@[ 