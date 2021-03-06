u:Gem::Specification�["
1.3.5i"inline_attachmentU:Gem::Version["
0.4.5Iu:	Timeh��    :@marshal_with_utc_coercionF"OMakes image_tag in an ActionMailer template embed the images in the emailsU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:@version_requirementsU;[[[">=U; ["	1.15:
@type:runtime:@version_requirement0:
@name"mime-types"InlineAttachment"jk@handle.it["Jason King"'Inline Attachment
=================

This package adds full support for embedding inline images into your HTML emails
through ActionMailer.

Installation
------------

### As a Gem ###

To perform a system wide installation:

	gem source -a http://gems.github.com
	gem install JasonKing-inline_attachment

To use inline_attachment in your project, add the following line to your project's
config/environment.rb:

	config.gem 'JasonKing-inline_attachment', :lib =&gt; 'inline_attachment'


### As a Rails Plugin ###

Use this to install as a plugin in a Ruby on Rails app:

	$ script/plugin install git://github.com/JasonKing/inline_attachment.git

### As a Rails Plugin (using git submodules) ###

Use this if you prefer the idea of being able to easily switch between using edge or a tagged version:

	$ git submodule add git://github.com/JasonKing/inline_attachment.git vendor/plugins/inline_attachment


Usage
-----

I've rewritten most of Edmond's great work in this version.  I now override
path_to_image instead of `image_tag` because a big reason for all the Rails2
breakages was because `image_tag` was basically reproduced in previous versions,
so broke when that method changed.

Now we override the very simple path_to_image, and most importantly we really
just add our own stuff for ActionMailer templates, and resort to the existing
code for everything else.

I've also integrated in with the new implicit multipart stuff.  So now, there is
so little code required!

#### notifier.rb
	class Notifier &lt; ActionMailer::Base
	  def signup
	    recipients %q{"Testing IA" &lt;testing@handle.it&gt;}
		  from       %q{"Mr Tester" &lt;tester@handle.it&gt;}
		  subject "Here's a funky test"
	  end
	end
	
Oh yeah baby!  Read it and weep!  So how's this work?  Well, you'll need
your templates named properly - see the _Multipart email_ section of the
ActionMailer::Base docs.
	
#### signup.text.plain.erb
	Your username is: &lt;%= @username %&gt;
	
#### signup.text.html.erb
	&lt;html&gt;&lt;head&gt;&lt;title&gt;Signup Notification&lt;/title&gt;&lt;/head&gt;&lt;body&gt;
	  &lt;%= image_tag "logo.png" %&gt;
		&lt;p&gt;Your username is: &lt;%=h @username %&gt;
	&lt;/body&gt;&lt;/html&gt;


That's it!  InlineAttachment will look for
`#{RAILS_ROOT}/public/images/logo.png` and will do the right thing and embed it
inline into the HTML version of the email.  ActionMailer will do the right thing
and offer the recipient both the `text/plain` and `text/html` parts as alternatives.

**Note the filenames include the (unusual) major.minor MIME type, look above at
the filenames closely.**


Note, that you should still be able to use this in the 0.3.0 way if you have
code that uses that.  But there were a lot of alternatives, and the examples in
here didn't show a crucial step of shuffling the parts around to be sure that
the image parts came after the html.

You can also do the old _manual_ method if you want.


Contributors
------------

* Jason King (JasonKing)
* Matt Griffin (betamatt) - file:// and chaining cleanup
* Logan Raarup (logandk)  - pluginified
* Jeffrey Damick (jdamick) - bugfix
"2http://github.com/JasonKing/inline_attachmentT@[ 