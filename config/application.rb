require File.expand_path('../boot', __FILE__)

module Petshop
  class Application < Rails::Application
    # Settings in config/environments/* take precedence over those specified here.
    # Application configuration should go into files in config/initializers
    # -- all .rb files in that directory are automatically loaded.
    # See Rails::Configuration for more options.
  
    # Skip frameworks you're not going to use. To use Rails without a database
    # you must remove the Active Record framework.
    # config.frameworks -= [ :active_record, :active_resource, :action_mailer ]
  
    # Specify gems that this application depends on. 
    # They can then be installed with "rake gems:install" on new installations.
    # You have to specify the :lib option for libraries, where the Gem name (sqlite3-ruby) differs from the file itself (sqlite3)
    # config.gem "bj"
    # config.gem "hpricot", :version => '0.6', :source => "http://code.whytheluckystiff.net"
    # config.gem "sqlite3-ruby", :lib => "sqlite3"
    # config.gem "aws-s3", :lib => "aws/s3"
  
    # Only load the plugins named here, in the order given. By default, all plugins 
    # in vendor/plugins are loaded in alphabetical order.
    # :all can be used as a placeholder for all plugins not explicitly named
    # config.plugins = [ :all ]
  
    # Add additional load paths for your own custom dirs
    # config.load_paths += %W( #{RAILS_ROOT}/extras )
  
    # Force all environments to use the same logger level
    # (by default production uses :info, the others :debug)
    # config.log_level = :debug
  
    # Make Time.zone default to the specified zone, and make Active Record store time values
    # in the database in UTC, and return them converted to the specified local zone.
    # Run "rake -D time" for a list of tasks for finding time zone names. Comment line to use default local time.
    # config.time_zone = 'UTC'
  
    # The internationalization framework can be changed to have another default locale (standard is :en) or more load paths.
    # All files from config/locales/*.rb,yml are added automatically.
    # config.i18n.load_path << Dir[File.join(RAILS_ROOT, 'my', 'locales', '*.{rb,yml}')]
    # config.i18n.default_locale = :de
  
    # Your secret key for verifying cookie session data integrity.
    # If you change this key, all old sessions will become invalid!
    # Make sure the secret is at least 30 characters and all random, 
    # no regular words or you'll be exposed to dictionary attacks.
    config.action_controller.session = {
      :key => '_petshop_session',
      :secret      => '0b2c79e4c6a73d3542d17d9caf6a3ad0847d0e05d758e7817dfb5d77f1c141b16530656ada793a26f71dd1163bfe04a2ffe4298614405c8d44e3e3ed4a2847f1'
    }
  
    # Use the database for sessions instead of the cookie-based default,
    # which shouldn't be used to store highly confidential information
    # (create the session table with "rake db:sessions:create")
    config.action_controller.session_store = :active_record_store
  
    # Use SQL instead of Active Record's schema dumper when creating the test database.
    # This is necessary if your schema can't be completely dumped by the schema dumper,
    # like if you have constraints or database-specific column types
    # config.active_record.schema_format = :sql
  
    # Activate observers that should always be running
    # Please note that observers generated using script/generate observer need to have an _observer suffix
    config.active_record.observers = :user_observer
    # config.active_record.observers = :cacher, :garbage_collector, :forum_observer
    
    config.gem( 'thinking-sphinx', :lib => 'thinking_sphinx' )
    config.gem "RedCloth"
    config.gem "responds_to_parent"
    config.gem "will_paginate"
    config.gem "haml"
    config.gem "jrails"
  #  config.gem "rspec"
    #, :version => '1.2.9'
  #  config.gem "rspec-rails", :version => '1.2.9'  
    config.gem "mini_magick"
    config.gem "mysql2"
  #  config.gem "captcha", :version => "1.2.2"
  
  #  config.gem "websolr-sunspot_rails"
  #  config.gem 'sunspot_rails', :lib => 'sunspot/rails'
  end
end