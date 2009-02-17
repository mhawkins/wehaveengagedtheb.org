require 'vendor/rack/lib/rack'
require 'vendor/sinatra/lib/sinatra'
require 'application'

set :run, false
set :environment, :production
set :views, File.dirname(__FILE__) + "/views"

FileUtils.mkdir_p 'log' unless File.exists?('log')
log = File.new("log/sinatra.log", "a")
STDOUT.reopen(log)
STDERR.reopen(log)

run Sinatra::Application
