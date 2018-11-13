class ApplicationController < Sinatra::Base

  get '/recipes' do 
    @recipes = Recipe.all if @recipes
    erb :index
  end

  get '/recipes/new' do
    erb :new 
  end 

  post '/recipes' do 
    @recipe = Recipe.create(params)
    redirect "/recipes/#{@recipe.id}"
  end 

  get '/recipes/:id' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :show 
  end

  get '/recipes/:id/edit' do 
    @recipe = Recipe.find_by_id(params[:id])
    erb :edit
  end 

  patch '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.name = params[:name]
    @recipe.ingredients = params[:ingredients]
    @recipe.cook_time = params[:cook_time]
    @recipe.save
    redirect "/recipes/#{@recipe.id}"
  end

  delete '/recipes/:id' do
    @recipe = Recipe.find_by_id(params[:id])
    @recipe.delete
    redirect to '/recipes'
  end

end