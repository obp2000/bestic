u:Gem::Specification["
1.3.5i"sproutcoreU:Gem::Version["1.0.1046Iu:	Timeh��    :@marshal_with_utc_coercionF"XSproutCore is a platform for building native look-and-feel applications on  the webU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency	:
@type:runtime:@version_requirement0:
@name"	rack:@version_requirementsU;[[[">=U; ["
0.9.1o;		;
;;0;"json_pure;U;[[[">=U; ["
1.1.0o;		;
;;0;"extlib;U;[[[">=U; ["
0.9.9o;		;
;;0;"erubis;U;[[[">=U; ["
2.6.2o;		;
;;0;"	thor;U;[[[">=U; ["0.11.7o;		;
:development;0;"gemcutter;U;[[[">=U; ["
0.1.0o;		;
;;0;"jeweler;U;[[[">=U; ["
1.0.0o;		;
;;0;"
rspec;U;[[[">=U; ["
1.2.0"sproutcore"contact@sproutcore.com["6Sprout Systems, Inc.  Apple Inc. and contributors"�sproutcore - abbot
    by Charles Jolley and contributors
    http://www.sproutcore.com
    http://github.com/sproutit/sproutcore-abbot

== DESCRIPTION:

SproutCore is a platform for building native look-and-feel applications on 
the web.  This Ruby library includes a copy of the SproutCore JavaScript 
framework as well as a Ruby-based build system called Abbot.

Abbot is a build system for creating static web content.  You can supply Abbot with a collection of JavaScript, HTML, CSS and image files and it will 
combine the files into a bundle that are optimized for efficient, cached 
deliver directly from your server or using a CDN.

Some of the benefits of using Abbot versus assembling your own content 
include:

 * Easy maintenance.  Organize your source content in a way that is useful for 
   you without impacting performance on loaded apps.

 * Automatically versioned URLs. Serve content with long expiration dates
   while Abbot handles the cache invalidation for you.

 * Dependency management.  Divide your code into frameworks; load 3rd party
   libraries.  Abbot will make sure everything loads in the correct order.

 * Packing.  Combines JavaScript and CSS into single files to minimize the
   number of resources you download for each page.

Although Abbot is intended primarily for building Web applications that 
use the SproutCore JavaScript framework, you can also use it to efficiently build any kind of static web content, even if SproutCore is not involved.

Abbot can be used both directly from the command line or as a ruby library. 

== USING ABBOT WITH SPROUTCORE:

This gem includes both the Abbot build tools and a copy of the SproutCore
JavaScript framework.  You can use built-in commands to create, develop, 
build, and deploy SproutCore-based applications.

== KNOWN LIMITATIONS:

* Currently does not support sites using relative-links.  You must specify
  the absolute path you expect built targets to be hosted as.  

== SYNOPSIS:

To create a new project:

  sc-init my_app

To test said project:

  cd my_app
  sc-server
  open http://localhost:4020/my_app (in web browser)

Write code, refresh, debug.  Once you are ready to deploy, build your static
output using:

  cd my_app
  sc-build my_app -rc

Copy the resulting files found in my_app/tmp/build to your server and you are
deployed!

== REQUIREMENTS:

* Ruby 1.8.6 or later.  Ruby 1.9 is currently untested
* extlib 0.9.9 or later
* rack 0.9.1 or later
* erubis 2.6.2 or later
* json_pure 1.1.0 or later

== INSTALL:

sudo gem install sproutcore

== LICENSE:

Copyright (c) 2009 Apple Inc.  
Portions copyright (c) 2006-2009 Sprout Systems Inc. and contributors

Permission is hereby granted, free of charge, to any person obtaining
a copy of this software and associated documentation files (the
'Software'), to deal in the Software without restriction, including
without limitation the rights to use, copy, modify, merge, publish,
distribute, sublicense, and/or sell copies of the Software, and to
permit persons to whom the Software is furnished to do so, subject to
the following conditions:

The above copyright notice and this permission notice shall be
included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED 'AS IS', WITHOUT WARRANTY OF ANY KIND,
EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF
MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT.
IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY
CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT,
TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE
SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.

SproutCore and the SproutCore logo are trademarks of Sprout Systems Inc."http://www.sproutcore.comT@[ 