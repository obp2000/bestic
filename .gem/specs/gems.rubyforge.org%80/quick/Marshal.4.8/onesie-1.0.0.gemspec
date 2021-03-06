u:Gem::Specification2["
1.3.7i"onesieU:Gem::Version["
1.0.0u:	Time��    ">A Rack middleware to make URLs in one-page webapps easierU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["1.2:
@name"	rack:@requirement@ :@prereleaseF:
@type:runtimeo;
;	U;[[[">=U; ["
2.6.1;
"hoe;@*;F;:development"onesie["code@jbarnette.com["John Barnette"dA Rack middleware to make URLs in one-page webapps easier.

In a couple of recent projects, I've needed to avoid full page
refreshes as much as possible. In the first, I wanted to keep an
embedded music player active while the user was browsing. In the
second, I just wanted fancier transitions between pages.

It's possible to do this in an ad-hoc way, but I very quickly got
tired of hacking things together. Enter Onesie.

Onesie congealed from these requirements:

* I want a one-page web app,
* But I want the back button to work,
* And I want search engines to still index some stuff,
* And I (mostly) don't want to change the way I write a Rails/Sinatra app.

If someone visits &lt;tt&gt;http://example.org/meta/contact&lt;/tt&gt;, I want
them to be redirected to &lt;tt&gt;http://example.org/blah/#/meta/contact&lt;/tt&gt;,
but after the redirection I still want the original route to be
rendered for search engine indexing, etc.

When Onesie gets a request, it looks to see if under your preferred
one-page app path ("blah" in the example above). If it's not, Onesie
sets the current request's path in the session and redirects to your
app path.

If a request is under the one-page app path, the "real" request's path
is retrieved from the session and used for subsequent routing and
rendering. This means that, as above, a request for

    http://example.org/meta/contact

Will be redirected to

    http://example.org/blah/#/meta/contact

But still render the correct action in the wrapped app, even though
URL fragments aren't passed to the server.

This is a terrible explanation. I'll write a sample app or something
soon."'http://github.com/jbarnette/onesieT@[ 