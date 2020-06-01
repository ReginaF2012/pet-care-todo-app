require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "t0d0l157_777"
  end

  get "/" do
    erb :welcome
  end

end
