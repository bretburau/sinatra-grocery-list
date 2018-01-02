class UserController < ApplicationController

    get '/' do
      # binding.pry
      erb :index
    end 

    get '/users/new' do
      erb :'users/new'
    end

    post '/users/new' do 
      binding.pry
    end
end