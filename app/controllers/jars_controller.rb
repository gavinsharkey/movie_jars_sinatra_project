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
    if !params[:jar][:name].empty?
      @jar = current_user.jars.create(params[:jar])

      params[:movies].each do |movie|
        @jar.movies.create(movie) if !movie[:title].empty?
      end

      redirect "/jars/#{@jar.id}"
    else
      redirect '/jars/new'
    end
  end

  get '/jars/:id' do
    redirect_if_not_logged_in
    @jar = Jar.find(params[:id])
    if @jar.user == current_user
      erb :"jars/show"
    else
      redirect '/jars'
    end
  end

  get '/jars/:id/edit' do
    redirect_if_not_logged_in
    erb :"jars/edit"
  end

  patch '/jars/:id' do
    
  end

  delete '/jars/:id' do
    
  end
end