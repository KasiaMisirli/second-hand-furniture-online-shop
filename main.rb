     
require 'sinatra'
require 'active_record'
require_relative 'db_config'

get '/' do
  erb :index
end





