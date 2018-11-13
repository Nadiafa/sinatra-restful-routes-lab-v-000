class ApplicationController < Sinatra::Base
  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
  end

  get '/recipes/new' do
    erb :new 
  end
  
  post '/recipes/new' do
    "recipe has been submitted"
  end

end
