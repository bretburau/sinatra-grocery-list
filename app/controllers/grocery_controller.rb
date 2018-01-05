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
    ##Show page for slugged ingredient TODO 
  end

  get '/groceries/:slug/edit' do
    @grocery = Grocery.find_by_slug(params[:slug])
    erb :'/groceries/edit'
    ##show page for patching ingredient via slug TODO
  end

  patch '/groceries/:slug/edit' do
    @grocery = Grocery.find_by_slug(params[:slug])
    @grocery.name = params[:name] if !params[:name].empty?
    @grocery.price = params[:price] if !params[:price].empty?
    flash[:message] = "Grocery updated"
    erb :'/groceries/#{@grocery.slug}'
  end

  post '/groceries/:slug/delete' do
    ###delete grocery
  end
end