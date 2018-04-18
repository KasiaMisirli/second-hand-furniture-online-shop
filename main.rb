     
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

get '/items/new' do 
  erb :new
end

post '/items' do 
  item = Item.new
  @item.name = params[:name]
  @item.description = params[:description]
  @item.price = params[:price]
  @item.pricetype = params[:pricetype]
  @item.location = params[:location]
  redirect to ('/')
end




