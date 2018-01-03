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
end