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
    @jar = current_user.jars.find_by(id: params[:id])
    if @jar
      session[:jar_id] = @jar.id
      erb :"jars/show"
    else
      redirect '/jars'
    end
  end

  get '/jars/:id/edit' do
    redirect_if_not_logged_in
    @jar = current_user.jars.find_by(id: params[:id])
    if @jar
      erb :"jars/edit"
    else
      redirect '/jars'
    end
  end

  patch '/jars/:id' do
    if !params[:jar][:name].empty?
      @jar = current_user.jars.find(params[:id])
      @jar.update(params[:jar])
      redirect "/jars/#{@jar.id}"
    else
      redirect "/jars/#{params[:id]}/edit"
    end
  end

  delete '/jars/:id' do
    current_user.jars.find_by(id: params[:id]).destroy
    redirect '/jars'
  end
end