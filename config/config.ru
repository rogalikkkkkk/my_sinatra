require "sinatra"
require 'sinatra/namespace'

root = File.expand_path 'lib'
require File.join( root , 'my_sinatra.rb' )

run Sinatra::Application
