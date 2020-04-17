class UsersController < ApplicationController

  get '/signup' do
    erb :"users/new"
  end

  post '/signup' do
    @user = User.new(params)
    @user.email = @user.email.downcase

    if @user.save
      session[:user_id] = @user.id
      redirect '/jars'
    else
      erb :'users/new'
    end
  end

end