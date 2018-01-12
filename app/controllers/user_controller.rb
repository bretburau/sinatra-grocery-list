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
      redirect '/' if logged_in?
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

    get '/users/:username/edit' do
      @user = User.find_by(username: params[:username])
      if @user == current_user
        erb :'/users/edit'
      elsif @user && @user != current_user
        flash[:message] = "Must be logged in to edit user info"
        redirect '/'
      else
        @user == nil
        flash[:message] = "Can't find that user"
        redirect '/'
      end
    end

    patch '/users/:username/edit' do
      @user = User.find_by(username: params[:username])
      @user.name = params[:name] if !params[:name].empty?
      @user.username = params[:username] if !params[:username].empty?
      @user.email = params[:email] if !params[:email].empty?
      @user.password = params[:password] if !params[:password].empty?
      @user.save
      redirect "/users/#{@user.username}"
    end

    get '/users/:username' do
      if @user = User.find_by(username: params[:username])
       erb :'users/show'
      else
        flash[:message] = "Can't find that user"
        erb :'index'
      end
    end

    post '/users/:username/delete' do
      @user = User.find_by(username: params[:username])
      @user.destroy if @user == current_user
      session.clear
      flash[:message] = "User was deleted"
      erb :'index'
    end

    post '/logout' do
      session.clear
      redirect '/'
    end
end