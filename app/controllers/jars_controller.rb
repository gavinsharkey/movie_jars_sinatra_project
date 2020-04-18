class JarsController < ApplicationController

  get '/jars' do
    redirect_if_not_logged_in
    @jars = current_user.jars
    erb :'jars/index'
  end

  get '/jars/new' do
    redirect_if_not_logged_in
    erb :"jars/new"
  end

  post '/jars' do
    
  end

  get '/jars/:id' do
    redirect_if_not_logged_in
    erb :"jars/show"
  end

  get '/jars/:id/edit' do
    redirect_if_not_logged_in
    erb :"jars/edit"
  end

  patch '/jars/:id' do
    
  end
end