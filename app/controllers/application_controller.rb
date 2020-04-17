require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, 'p193174r8pqwg0h7r8c4'
  end

  helpers do
    
  end

end
