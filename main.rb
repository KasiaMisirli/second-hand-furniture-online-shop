require 'sinatra'
require 'active_record'
require_relative 'db_config'
require 'sinatra/reloader'
require 'pg'
require_relative 'models/user'
require_relative 'models/item'
require_relative 'models/image'

enable :sessions

helpers do
  def current_user
    User.find_by(id: session[:user_id])
  end

  def logged_in?
    if current_user
      return true
    else
      return false
    end
  end
end


get '/' do
  @items = Item.all
  erb :index
end

get '/items/new' do 
  erb :new
end

post '/items' do 
  @item = Item.new
  @item.name = params[:name]
  # @item.images.first.image = params[:image]
  @item.description = params[:description]
  @item.price = params[:price]
  @item.pricetype = params[:pricetype]
  @item.location = params[:location]
  @item.user_id = session[:user_id]
  if @item.save
    redirect to ('/')
  else
    erb :new
  end
end

get '/items/:id' do
  @item = Item.find(params[:id])
  erb :show
end
  
delete '/items' do
  @item = Item.find(params[:id])
  @item.delete(params[:id])
   redirect to ('/')
end

get '/items/:id/edit' do
    @item = Item.find(params[:id])
    if @item.user_id == current_user.id
    @item.save
    erb :edit
end
end

put '/items/:id' do
  @item = Item.find(params[:id])
  @item.name = params[:name]
  # @item.images.first.image = params[:image]
  @item.description = params[:description]
  @item.price = params[:price]
  @item.pricetype = params[:pricetype]
  @item.location = params[:location]
  @item.save
  redirect to ("/items/#{params[:id]}") #redirect to single dis details page
end

get '/signup' do
    erb :signup
end

post '/signupdetails' do
    @user = User.new
    @user.name = params[:name]
    @user.tel = params[:tel]
    @user.email = params[:email]
    @user.password = params[:password]
    if @user.save
        session[:user_id] = @user.id 
        redirect to ('/')
    else
        erb :signup
    end
end

get '/login' do
    erb :login
end
  
post '/session' do
    user = User.find_by(email: params[:email])
    if user && user.authenticate(params[:password])
      session[:user_id] = user.id # single source of truth
      #using only one (id) to prevent the data going stale
      redirect to ('/')
    else
      erb :login
  end
  end
  
  delete '/session' do
    session[:user_id] = nil
    redirect to('/login')
  end 

