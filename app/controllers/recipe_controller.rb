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
      recipe = Recipe.new
      recipe.name = params[:recipe][:name]
      params[:recipe][:groceries].each do |grocery_id|
        grocery = Grocery.find_by(id: grocery_id)
        recipe.groceries << grocery
      end
    end
    recipe.save
    redirect '/recipes'
  end

  get '/recipes/:slug' do
    get_slug
    erb :'/recipes/show'
  end

  get '/recipes/:slug/edit' do
    get_slug
    erb :'/recipes/edit'
  end

  patch '/recipes/:slug/edit' do
    get_slug
    @recipe.name = params[:name] if !params[:name].empty?
    @recipe.groceries.clear
    params[:groceries].each do |g|
      @recipe.groceries << Grocery.find_by_id(g)
    end
    @recipe.save  
    binding.pry
  end

  def get_slug
    @recipe = Recipe.find_by_slug(params[:slug])
  end
end