class RecipeController < ApplicationController

  get '/recipes' do
    erb :'/recipes/list'
  end

  get '/recipes/new' do
    erb :'/recipes/new'
  end

  post '/recipes/new' do
    if params[:recipe][:name].empty?
      flash[:message] = "Please enter a recipe name"
      erb :'/recipes/new'
    else
      binding.pry
      recipe = Recipe.new(params)
    end
  end
end