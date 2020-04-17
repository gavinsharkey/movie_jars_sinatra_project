class SessionsController < ApplicationController

  get '/' do
    erb :'sessions/home'
  end

  post '/login' do
    @user = User.find_by(:email => params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/jars'
    else
      erb :'sessions/home'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

end