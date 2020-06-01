require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "t0d0l157_777"
  end

  get "/" do
    @user = User.find_by(id: session[:user_id]) if session[:user_id]
    erb :welcome
  end

end
