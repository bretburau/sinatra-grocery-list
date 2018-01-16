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

  get '/groceries/:slug' do
    @grocery = Grocery.find_by_slug(params[:slug])
    erb :'/groceries/show'
  end

  get '/groceries/:slug/edit' do
    @grocery = Grocery.find_by_slug(params[:slug])
    erb :'/groceries/edit'
  end

  patch '/groceries/:slug/edit' do
    @grocery = Grocery.find_by_slug(params[:slug])
    @grocery.name = params[:name] if !params[:name].empty?
    @grocery.price = params[:price] if !params[:price].empty?
    @grocery.save
    flash[:message] = "Grocery updated"
    redirect "/groceries/#{@grocery.slug}"
  end

  post '/groceries/:slug/delete' do
    Grocery.find_by_slug(params[:slug]).destroy
  end
end