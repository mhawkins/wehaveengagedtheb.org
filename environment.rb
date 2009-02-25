require 'rubygems'
require 'dm-core'
require 'dm-validations'
require 'dm-aggregates'
require 'haml'
require 'ostruct'
require 'twitter'

require 'sinatra' unless defined?(Sinatra)

configure do
  SiteConfig = OpenStruct.new(
                 :title           => 'we have engaged the borg',       # title of application
                 :author          => 'reillyhawk',                 # your twitter user name for attribution
                 :url_base        => 'http://wehaveengagedtheb.org/', # base URL for your site
                 :search_keywords => ['wilw', 'brentspiner', 'levarburton', 'star trek', 'borg', 'georgetakei', 'leonardnimoy', 'williamshatner', 'lewar'], # search API keyword
                 :status_length   => 20                        # number of tweets to display
               )
               
  settings = YAML::load( File.read(File.join( File.dirname(__FILE__), 'config', 'database.yml')) )
  DataMapper.setup(:default, settings)

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end

# prevent Object#id warnings
Object.send(:undef_method, :id)
