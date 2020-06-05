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

  helpers do
    def logged_in?
      !!session[:user_id]
    end

    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end

    def datetime_to_displaytime(t)
      t.strftime("%B %d, %Y at %I:%M%p")
    end

    def birthdate_to_display(date)
        date.strftime("%B %d, %Y")
    end

    def date_time_for_todo_edit(t)
      t.strftime("%FT%H:%M")
    end
    
  end

end
