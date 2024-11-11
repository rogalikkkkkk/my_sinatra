# frozen_string_literal: true
require 'sequel'
require 'sequel/extensions/seed'
require 'pg'
require 'json'
require 'multi_json'
require 'sinatra'

%w{ controllers models routes }.each { |dir| Dir.glob("./#{ dir }/*.rb", &method(:require)) }

# Endpoints format setup
before do
  content_type 'application/json' # To see perfectly in POSTMAN - in tab Pretty
end

def collection_to_api(collection) 		# For Array
  MultiJson.dump(collection.map { |s| s.to_api })
end


get '/' do
  # system 'rake --tasks'
  "Hi! I am api_sinatra_postgres!\n\n"
  # haml :index, :layout => :my_layout
end
