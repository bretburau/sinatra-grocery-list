class UserController < ApplicationController

    get '/' do
      redirect '/login' if !logged_in?
      @user = current_user
      erb :index
    end 

    get '/users/new' do
      redirect '/' if logged_in?
      erb :'users/new'
    end

    post '/users/new' do
      # binding.pry
      if User.find_by(username: params[:user][:username])
        flash[:message] = "That username has been taken...please enter a unique username"
        redirect '/users/new' 
      end
      user = User.new(params[:user])
      if user.save 
        session[:user_id] = user.id
        redirect '/'
      end
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
        flash[:message] = "Please enter a valid username/password"
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