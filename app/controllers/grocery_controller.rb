class GroceryController < ApplicationController
 
  get '/groceries' do
    erb :'groceries/list'
  end

  get '/groceries/new' do
    erb :'groceries/new'
  end

  post '/groceries/new' do
    if Grocery.find_by_name(params[:grocery][:name])
      flash[:message] = "Grocery with that name already exists!!"
      erb :'/groceries/new'
    else
      @grocery = Grocery.new(params[:grocery])
      @grocery.save
      flash[:message] = "Succesfully added #{@grocery.name}"
      erb :'/groceries/list'
    end
  end
end