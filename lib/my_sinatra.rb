# запросы API

require 'sinatra'
require 'sinatra/namespace'
require 'sinatra/base'

# module MyAppModule

# предыдущий код - запросы API
# class App < Sinatra::Base

# register Sinatra::Namespace

get '/' do
  'Hello My Sinatra - Easy and Wide world!'
end

# get '/hello/:name' do
#   "Sinatra приветствует тебя, #{params[:name]}!"
# end

namespace '/api/v1' do
  # 2-nd stage namespace
  get "/*" do
    "Izzzz don't know what is the #{params[:splat]}. It's what you typed."
  end
end

# get '/hello/:name' do
#   # соответствует "GET /hello/foo" и "GET /hello/bar",
#   # где params['name'] 'foo' или 'bar'
#   "Hello #{params['name']}!"
# end
#
# get '/hello/:name' do |n|
#   "Hello #{n}!"
# end

# Находит "GET /meta/hello/world", "GET /hello/world/1234" и так далее
get %r{\/hello\/(\w+)} do |c|
  "Hello, #{c}!"
end

get '/say/*/to/*' do
  # соответствует /say/hello/to/world
  params['splat'].to_s # => ["hello", "world"]
end

get '/download/*.*' do
  # соответствует /download/path/to/file.xml
  a = params['splat'][0]
  # b = ".#{params['splat'][1]}"
  b = params['splat'][1]
  [a, b]
end

get '/download/*.*' do |path, ext|
  [path, ext] # => ["path/to/file", "xml"]
end

get '/jobs.?:format?' do
  # соответствует "GET /jobs", "GET /jobs.json", "GET /jobs.xml" и т.д.
  'Да, работает этот маршрут!'
end

get '/redirect' do
  redirect to('/hello/World')
end

get '/*' do
  "I don't know what is the #{params[:splat]}. It's what you typed."
end

get '/players/:sport_id' do
  # Значение параметра доступно через params[:sport_id]
end

get '/players/*/:year' do
  # /players/performances/2016
  # Параметры - params['splat'] -> ['performances'], params[:year] -> 2016
end

# end

# end
