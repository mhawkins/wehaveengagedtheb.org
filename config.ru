$:.unshift File.join(File.dirname(__FILE__), '..', '..', '..', '..', '.gem', 'ruby', '1.8')
ENV['GEM_HOME'] = '/home/reillyhawk/.gems'
ENV['GEM_PATH'] = '$GEM_HOME:/usr/lib/ruby/gems/1.8'
require 'rubygems'
require 'vendor/rack/lib/rack'
require 'vendor/sinatra/lib/sinatra'
require 'application'
Gem.clear_paths
gem 'dm-core'

set :run, false
set :environment, :production
set :views, File.dirname(__FILE__) + "/views"

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

run Sinatra::Application
