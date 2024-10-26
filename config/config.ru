require "sinatra"
require 'sinatra/namespace'

root = File.expand_path 'lib'
require File.join(root, 'api_sinatra_postgres.rb')

run Sinatra::Application
