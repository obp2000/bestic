u:Gem::Specification�["
1.3.5i"guerrilla_rotateU:Gem::Version["
0.1.0Iu:	Time��    :@marshal_with_utc_coercionF"A/B Testing made simpleU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[ 0"jk@handle.it["Jason King"�GuerrillaRotate
==============

This plugin lets you have multiple view pages for the one action, so that you
can rotate through different views in order to test which one is the most
effective.  This is known as A/B testing, split testing or side-by-side
testing.

It will automatically switch between the different views for different web
requests (uses .rand so is pseudo random, not round-robin or anything).  The
particular view is sticky for a (rails) session, so that once that view has been
chosen for that visitor they will see the same, consistent view each time.

It integrates automagically into
[Rubaidh::GoogleAnalytics](http://github.com/rubaidh/google_analytics) by
setting the override_trackpageview to the name of the unique view file (instead
of the action-based URL) so you can track it easily in Google Analytics.

Without that you'll want to track it by putting different tracking codes in each
of your view templates.

Example
-------

So, in your views you will create some new templates with something (can be
anything including nothing) between the template name and the first part of the
extension.  So you might have the following files for the products/index action:

    app/views/products/index.html.erb
    app/views/products/index_alt.html.erb
    app/views/products/index_new.html.erb

Then all you need to do is tell your controller to rotate for that action:

### app/controllers/products_controller.rb
    class ProductsController &lt; ApplicationController
      guerrilla_rotate :index, :show

      # etc..

    end

NB: guerrilla_rotate is also aliased as guerilla_rotate for the alternative
spelling and typos.

Copyright &amp;copy; 2009 Jason King, released under the MIT license
"1http://github.com/JasonKing/guerrilla_rotateT@[ 