class SessionsController < ApplicationController

  get '/' do
    erb :'sessions/home'
  end

  post '/login' do
    @user = User.new(params)
    @user.email = @user.email.downcase

    if @user.save
      session[:user_id] = @user.id
      redirect '/jars'
    else
      erb :'sessions/home'
    end
  end

  get '/logout' do
    
  end

end