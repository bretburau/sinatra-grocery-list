class GroceryController < ApplicationController
 
  get '/groceries' do
    erb :'groceries/list'
  end

  get '/groceries/new' do
    erb :'groceries/new'
  end
end