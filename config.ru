# Run this with 'rackup -p 4567'

require 'bundler'
Bundler.require

require 'sinatra'

require './json_jsonp_app.rb'

run JsonJsonpApp.new
