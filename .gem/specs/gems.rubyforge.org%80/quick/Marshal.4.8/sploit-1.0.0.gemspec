u:Gem::Specification�["
1.3.7i"sploitU:Gem::Version["
1.0.0Iu:	Time���    :@marshal_with_utc_coercionF"%Grab and eval Ruby code via HTTPU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
2.6.1:
@type:development:@requirement@ :@prereleaseF:
@name"hoe"sploit["jbarnette@rubygems.org"drnicwilliams@gmail.com["John Barnette"Dr. Nic Williams"Grab and eval Ruby code via HTTP. You don't care about security, right?

This gem is Dr. Nic's fault. We were looking for an easy way to run
Ruby code that was publicly available on a web server, and though
we've all written something to do this a time or two, we couldn't find
a convenient gem.

I hacked up a quick example:

    ruby -rubygems -ropen-uri -e \
      'eval open("http://gist.github.com/raw/473222/snippet.rb").read' \
      jbarnette dr-nic-magic-awesome

...but why use a simple Ruby one-liner when we can go overboard and
package it as a gem? While we're at it, why not add a tiny bit of
extra sugar for Gists?

This is not an original idea. It's been done a ton of times before,
but this one is ours. Don't use it for anything real or it'll melt
your face."'http://github.com/jbarnette/sploitT@[ 