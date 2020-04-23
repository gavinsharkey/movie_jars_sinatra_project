class MoviesController < ApplicationController
  
  # get '/movies' do
  #   redirect_if_not_logged_in
  #   @movies = current_user.movies
  #   erb :'movies/index'
  # end

  post '/movies' do
    @movie = current_jar.movies.build(params)
    if @movie.save
      redirect back
    else
      current_jar.reload
      erb :"/jars/edit"
    end
  end

  get '/movies/:id' do
    redirect_if_not_logged_in
    @movie = current_user.movies.find_by(id: params[:id])
    if @movie
      erb :"movies/show"
    else
      redirect '/jars'
    end
  end

  get '/movies/:id/edit' do
    redirect_if_not_logged_in
    @movie = current_user.movies.find_by(id: params[:id])
    if @movie
      erb :"movies/edit"
    else
      redirect '/jars'
    end
  end

  patch '/movies/:id' do
    @movie = current_jar.movies.find_by(id: params[:id])
    if @movie.update(params[:movie])
      redirect "/jars/#{current_jar.id}/edit"
    else
      redirect back
    end
  end

  delete '/movies/:id' do
    current_user.movies.find_by(id: params[:id]).destroy
    redirect back
  end

  delete '/movies/:id/pick' do
    current_user.movies.find_by(id: params[:id]).destroy
    redirect "/jars/#{current_jar.id}"
  end
end