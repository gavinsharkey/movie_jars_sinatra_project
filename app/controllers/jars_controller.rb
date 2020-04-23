class JarsController < ApplicationController

  get '/jars' do
    redirect_if_not_logged_in
    @jars = current_user.jars
    session.delete('jar_id')
    erb :'jars/index'
  end

  get '/jars/new' do
    redirect_if_not_logged_in
    erb :"jars/new"
  end

  post '/jars' do
    @jar = current_user.jars.build(params[:jar])
    if @jar.save
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

  get '/jars/:id/pick' do
    redirect_if_not_logged_in
    @jar = current_user.jars.find_by(id: params[:id])
    if @jar
      @movie = @jar.movies.sample
      erb :"jars/pick"
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
    @jar = current_user.jars.find_by(id: params[:id])
    if @jar.update(params[:jar])
      redirect "/jars/#{@jar.id}"
    else
      erb :"jars/edit"
    end
  end

  delete '/jars/:id' do
    current_user.jars.find_by(id: params[:id]).destroy
    redirect '/jars'
  end
end