require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "b2c0027fdd8c40fc862a330a544342bb891a0de71fc93b2a5774e803c054d138b39661e8aba22077c3d39db8aef6c014e6bc16aeb22ce8df43c70dd2eb391787"
  end

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @user ||= User.find_by(id: session[:user_id])
    end

    def current_jar
      @jar ||= Jar.find_by(id: session[:jar_id])
    end

    def redirect_if_not_logged_in
      redirect '/' if !logged_in?
    end

    def redirect_if_logged_in
      redirect '/jars' if logged_in?
    end
  end

end
