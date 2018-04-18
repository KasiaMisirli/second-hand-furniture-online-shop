     
require 'sinatra'
require 'active_record'
require_relative 'db_config'
# require 'sinatra/reloader'
require 'pg'
require_relative 'models/user'
require_relative 'models/item'
require_relative 'models/image'

get '/' do
  @items = Item.all
  erb :index
end




