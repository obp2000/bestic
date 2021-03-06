u:Gem::Specificationc["
1.3.6i"bmizerany-sinatra-mongoU:Gem::Version["
0.0.3Iu:	TimeHm�    :@marshal_with_utc_coercionF"1A light extension to sinatra for using mongoU:Gem::Requirement[[[">=U; ["0U;[[[">=U; ["0"	ruby[o:Gem::Dependency
:@version_requirementsU;[[[">=U; ["
1.2.9:@prereleaseF:
@type:development:@requirement@ :
@name"
rspeco;	
;
U;[[[">=U; ["0;F;:runtime;@*;"
mongoo;	
;
U;[[[">=U; ["
0.9.4;F;;;@4;"sinatra0"josh@technicalpickles.com["Joshua Nichols"/= sinatra-mongo

Extends Sinatra with an extension method for dealing with monogodb using the ruby driver.


Install it with gem:

    $ gem install sinatra-mongo

Now we can use it an example application.

    require 'sinatra'
    require 'sinatra/mongo'

    # Specify the database to use. Defaults to mongo://localhost:27017/default,
    # so you will almost definitely want to change this.
    #
    # Alternatively, you can specify the MONGO_URL as an environment variable
    set :mongo, 'mongo://localhost:27017/sinatra-mongo-example'

    # At this point, you can access the Mongo::Database object using the 'mongo' helper:

    puts mongo["testCollection"].insert {"name" =&gt; "MongoDB", "type" =&gt; "database", "count" =&gt; 1, "info" =&gt; {"x" =&gt; 203, "y" =&gt; '102'}}

    get '/' do
      mongo["testCollection"].find_one
    end

If you need to use authentication, you can specify this in the mongo uri:

    set :mongo, 'mongo://myuser:mypass@localhost:27017/sinatra-mongo-example'

== Mongo Reference

 * http://www.mongodb.org/display/DOCS/Ruby+Tutorial

== Note on Patches/Pull Requests

* Fork the project.
* Make your feature addition or bug fix.
* Add tests for it. This is important so I don't break it in a
  future version unintentionally.
* Commit, do not mess with rakefile, version, or history.
  (if you want to have your own version, that is fine but bump version in a commit by itself I can ignore when I pull)
* Send me a pull request. Bonus points for topic branches.

== Copyright

Copyright (c) 2009 Joshua Nichols. See LICENSE for details.
"5http://github.com/technicalpickles/sinatra-mongoT@[ 