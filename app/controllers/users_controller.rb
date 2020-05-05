class UsersController < ApplicationController

  get '/' do
    redirect_if_logged_in
    erb :'users/home'
  end
  
  post '/login' do
    @user = User.find_by(:email => params[:email])

    if @user && @user.authenticate(params[:password])
      session[:user_id] = @user.id
      redirect '/jars'
    else
      flash[:warning] = 'Invalid Username and/or Password'
      erb :'users/home'
    end
  end

  get '/logout' do
    session.clear
    redirect '/'
  end

  get '/signup' do
    redirect_if_logged_in
    erb :"users/new"
  end

  post '/signup' do
    @user = User.new(params)
    @user.email = @user.email.downcase

    if @user.save
      session[:user_id] = @user.id
      redirect '/jars'
    else
      flash[:warning] = 'Invalid Email/Password'
      erb :'users/new'
    end
  end

end