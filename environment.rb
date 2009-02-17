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
                 :title           => 'We have engaged the borg',       # title of application
                 :author          => 'reillyhawk',                 # your twitter user name for attribution
                 :url_base        => 'http://wehaveengagedtheb.org/', # base URL for your site
                 :search_keywords => ['wilw', 'brentspiner', 'levarburton', 'star trek', 'borg'], # search API keyword
                 :status_length   => 20                        # number of tweets to display
               )

  DataMapper.setup(:default, "sqlite3:///#{File.expand_path(File.dirname(__FILE__))}/#{Sinatra::Base.environment}.db")

  # load models
  $LOAD_PATH.unshift("#{File.dirname(__FILE__)}/lib")
  Dir.glob("#{File.dirname(__FILE__)}/lib/*.rb") { |lib| require File.basename(lib, '.*') }
end

# prevent Object#id warnings
Object.send(:undef_method, :id)
