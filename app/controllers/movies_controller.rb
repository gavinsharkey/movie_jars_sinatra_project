class MoviesController < ApplicationController
  
  get '/movies' do
    redirect_if_not_logged_in
    @movies = current_user.movies
    erb :'movies/index'
  end
  
  get '/movies/new' do
    redirect_if_not_logged_in
  end

  post '/movies' do
    
  end

  get '/movies/:id' do
    redirect_if_not_logged_in
    @movie = current_user.movies.find(params[:id])
    if @movie
      erb :"movies/show"
    else
      redirect '/jars'
    end
  end

  get '/movies/:id/edit' do
    redirect_if_not_logged_in
  end

  patch '/movies/:id' do
    
  end

  delete '/movies/:id' do
    
  end
end