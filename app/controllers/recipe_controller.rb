class RecipeController < ApplicationController

  get '/recipes' do
    # flash[:message] = "" #Not sure what this is for
    erb :'/recipes/list'
  end

  get '/recipes/new' do
    erb :'/recipes/new'
  end

  post '/recipes/new' do
    redirect '/login' if !logged_in?
    if params[:name] = ''
      flash[:message] = "Please enter a recipe name"
      redirect '/recipes/new'
    else
      recipe = Recipe.new
      recipe.name = params[:name]
      recipe.user_id = current_user.id
      params[:groceries].each do |e|
        if e[:grocery_id].to_i != 0
          grocery = Grocery.find_by(id: e[:grocery_id])
          recipe.groceries << grocery
        end
      end
      binding.pry
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
    binding.pry
    if current_user && @recipe.user_id == current_user.id #Tests if sombody is logged in and if it's correct user
      @recipe.name = params[:name] if !params[:name].empty?
      @recipe.groceries.clear
      params[:groceries].each do |g|
        @recipe.groceries << Grocery.find_by_id(g)
      end
      @recipe.save
      flash[:message] = "#{@recipe.name} was successfully edited"
      erb :'/recipes/list'
    else
      flash[:message] = "Only the recipe's owner is able to change the recipe"
      erb :'/recipes/list'
    end
  end

  post '/recipes/:slug/delete' do
    get_slug
    @recipe.destroy
    flash[:message] = "#{@recipe.name} was successfully deleted"
    erb :'/recipes/list'
  end

  def get_slug
    @recipe = Recipe.find_by_slug(params[:slug])
  end
end