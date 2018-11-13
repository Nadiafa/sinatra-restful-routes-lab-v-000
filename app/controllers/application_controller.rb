class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/recipes/new' do
    erb :new 
  end
  
  post '/recipes/new' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end
  
  get '/recipes/:id' do
    @recipe = Recipe.find_by(params[:id])
    erb :show
  end 
  
  post '/show' do 
  end 
end
