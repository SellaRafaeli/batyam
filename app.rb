require 'rubygems'
require 'bundler'
require 'sinatra/namespace'
require 'json' 

Bundler.require

# our app files - export to require.rb or st when expands
require './middleware'
require './ruby_awesomeness'
require './db/mongo'
require './users/user'
require './users/users_api'

set :public_folder, File.dirname(__FILE__) + '/public'

puts "Ready to rock".light_red

def bp
	binding.pry
end

get '/' do 
	send_file File.join(settings.public_folder, 'index.html')
end
