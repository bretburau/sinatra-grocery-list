class UserController < ApplicationController

    get '/' do
      redirect 'login' if !logged_in?
      erb :index
    end 

    get '/users/new' do
      erb :'users/new'
    end

    post '/users/new' do 
      user = User.create(params[:user])
      session[:user_id] = user.id
      redirect '/'
    end

    get '/login' do
      erb :'users/login'
    end

    post '/login' do
      @user = User.find_by(username: params[:username])
      if @user && @user.authenticate(params[:password])
        session[:user_id] = @user.id
        redirect('/')
      else
        redirect('/login')
      end
    end

    get '/users/:username' do
      @user = User.find_by(username: params[:username])
      erb :'users/show'
    end

    post '/logout' do
      session.clear
      redirect '/login'
    end

    def current_user
      User.find_by_id(session[:user_id])
    end
  
    def logged_in?
      !!session[:user_id]
    end
end