class SessionsController < ApplicationController

  get '/' do
    erb :'sessions/home'
  end

  post '/login' do
    binding.pry
    @user = User.new(params)
  end

  get '/logout' do
    
  end

end