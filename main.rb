     
require 'sinatra'
require 'active_record'
require_relative 'db_config'
require 'sinatra/reloader'
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
  # @item.images.first.image = params[:image]
  @item.description = params[:description]
  @item.price = params[:price]
  @item.pricetype = params[:pricetype]
  @item.location = params[:location]
  @item.save
  redirect to ('/')
end

get '/items/:id' do
  @item = Item.find(params[:id])
  @item = @item.name
  # @item.images.first.image = params[:image]
  @item = @item.description
  @item = @item.price
  @item = @item.pricetype
  @item = @item.location
  erb :show
end
  
delete '/items' do
  @item = Item.find(params[:id])
  @item.delete(params[:id])
   redirect to ('/')
end

get '/items/:id/edit' do
    @item = Item.find(params[:id])
    @item.save
    erb :edit
end

put '/items/:id' do
  @item = Item.find(params[:id])
  @item.name = params[:name]
  # @item.images.first.image = params[:image]
  @item = @item.description
  @item = @item.price
  @item = @item.pricetype
  @item = @item.location
  @item.save
  redirect to ("/items/#{params[:id]}") #redirect to single dis details page
end
