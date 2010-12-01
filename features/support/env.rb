# Sets up the Rails environment for Cucumber

ENV["RAILS_ENV" ] ||= "cucumber"
require File.expand_path(File.dirname(__FILE__) + '/../../config/environment' )
require 'cucumber/rails/world'
# Comment out the next line if you don't want Cucumber Unicode support
require 'cucumber/formatter/unicode'
# Comment out the next line if you don't want transactions to
# open/roll back around each scenario
# Cucumber::Rails.use_transactional_fixtures
# Comment out the next line if you want Rails' own error handling
# (e.g. rescue_action_in_public / rescue_responses / rescue_from)
#Cucumber::Rails.bypass_rescue
require 'webrat'
#Webrat.configure do |config|
#config.mode = :selenium
#config.selenium_wait_timeout = 10
#end

#class ActiveSupport::TestCase
#  setup do |session|
#    session.host! "localhost:3005"
#  end
#end

Webrat.configure do |config|  
  config.mode = :selenium 
  config.application_port = 3005
end 
 class ActiveSupport::TestCase  
  self.use_transactional_fixtures = false 
end 

require 'cucumber/rails/rspec'
require 'webrat/core/matchers'

if defined?(ActiveRecord::Base)
  begin
    require 'database_cleaner'
    require "database_cleaner/cucumber"
    DatabaseCleaner.strategy = :truncation
  rescue LoadError => ignore_if_database_cleaner_not_present
  end
end