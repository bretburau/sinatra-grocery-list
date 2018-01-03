class UserController < ApplicationController

    get '/' do
      
      erb :index
    end 

    get '/users/new' do
      erb :'users/new'
    end

    post '/users/new' do 
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect '/'
      # binding.pry
    end

    get '/login' do
      erb :'users/login'
    end

    post '/login' do
      session[:user_id] = params[:user_id]
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
  
    def logged_in?
      !!session[:user_id]
    end
end