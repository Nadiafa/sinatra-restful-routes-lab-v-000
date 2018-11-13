class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end
  
  get '/' do
    erb :index
  end
  
  get '/new' do 
    erb :new 
  end
  
  get '/recipes/new' do
    erb :new 
  end
  
  post '/recipes/new' do
    @recipe = Recipe.create(params)
    redirect to "/recipes/#{@recipe.id}"
  end

end
