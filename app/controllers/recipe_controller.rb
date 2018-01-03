class RecipeController < ApplicationController

  get '/recipes' do
    erb :'/recipes/list'
  end

  get '/recipes/new' do
    erb :'/recipes/new'
  end
end