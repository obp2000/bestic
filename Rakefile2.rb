# Add your own tasks in files placed in lib/tasks ending in .rake,
# for example lib/tasks/capistrano.rake, and they will automatically be available to Rake.

require(File.join(File.dirname(__FILE__), 'config', 'boot'))
require 'rake'
require 'rake/testtask'
require 'rake/rdoctask'
require 'tasks/rails'
require 'thinking_sphinx/tasks'
#require 'tasks/zendesk-captcha-34ab18c'
#require 'ar_fixtures-0.0.4/tasks'
#require 'sunspot/rails/tasks'