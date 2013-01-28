#!/usr/bin/env ruby

# json_jsonp_app.rb

# Copyright 2013  Robert Jones  (jones@craic.com)   Craic Computing LLC
# This code and associated data files are distributed freely under the terms of the MIT license

require 'erb'
require 'json'

$:.unshift File.join(File.dirname(__FILE__))

class JsonJsonpApp < Sinatra::Base

  set :root, File.dirname(__FILE__)

  set :static, true

  get '/' do
    redirect to('index.html')
  end

  get '/json' do
    content_type :json
    # This content is whatever you want to send as long as it can be converted into JSON
    content = { :response => 'Sent via JSON',
                :timestamp => Time.now,
                :random => rand(10000) }
    content.to_json
  end

  # Generate the response as a function with the callback parameter as the function name
  # e.g. <callback>( <json> )
  get '/jsonp' do

    callback = params['callback']

    content_type :js
    content = { :response => 'Sent via JSONP',
                :timestamp => Time.now,
                :random => rand(10000) }

    "#{callback}(#{content.to_json})"
  end

end
