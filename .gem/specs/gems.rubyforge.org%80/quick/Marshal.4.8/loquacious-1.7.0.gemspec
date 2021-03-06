u:Gem::Specification�["
1.3.7i"loquaciousU:Gem::Version["
1.7.0u:	Time��    "=Descriptive configuration files for Ruby written in RubyU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.3.0:
@name"
rspec:@requirement@ :@prereleaseF:
@type:development"codeforpeople"tim.pease@gmail.com["Tim Pease":Descriptive configuration files for Ruby written in Ruby.

Loquacious provides a very open configuration system written in ruby and
descriptions for each configuration attribute. The attributes and descriptions
can be iterated over allowing for helpful information about those attributes to
be displayed to the user.

In the simple case we have a file something like

  Loquacious.configuration_for('app') {
    name 'value', :desc =&gt; "Defines the name"
    foo  'bar',   :desc =&gt; "FooBar"
    id   42,      :desc =&gt; "Ara T. Howard"
  }

Which can be loaded via the standard Ruby loading mechanisms

  Kernel.load 'config/app.rb'

The attributes and their descriptions can be printed by using a Help object

  help = Loquacious.help_for('app')
  help.show :values =&gt; true        # show the values for the attributes, too

Descriptions are optional, and configurations can be nested arbitrarily deep.

  Loquacious.configuration_for('nested') {
    desc "The outermost level"
    a {
      desc "One more level in"
      b {
        desc "Finally, a real value"
        c 'value'
      }
    }
  }

  config = Loquacious.configuration_for('nested')

  p config.a.b.c  #=&gt; "value"

And as you can see, descriptions can either be given inline after the value or
they can appear above the attribute and value on their own line.")http://gemcutter.org/gems/loquaciousT@[ 