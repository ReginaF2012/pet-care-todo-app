require './config/environment'

class ApplicationController < Sinatra::Base

  configure do
    set :public_folder, 'public'
    set :views, 'app/views'
    enable :sessions
    set :session_secret, "t0d0l157_777"
  end

  get "/" do
    @message = session[:message]
    session[:message] = nil
    erb :welcome
  end

  helpers do
    # returns true if there is a user_id in the session hash, indicating a user is signed in
    def logged_in?
      !!session[:user_id]
    end
    # returns the instance of a user that is signed in, assigns them to @current_user
    def current_user
      @current_user ||= User.find_by(id: session[:user_id])
    end
    
    # a method that converts the datetime of a todo into month DD, YYYY at HH:MMam/pm format
    def datetime_to_displaytime(t)
      t.strftime("%B %d, %Y at %I:%M%p")
    end
    # a method that converts a pet's birthday to month DD, YYYY format
    def birthdate_to_display(date)
        date.strftime("%B %d, %Y")
    end
    # this method converts the datetime of a todo to a format that can be used as a placeholder for 
    # the todo edit form
    def date_time_for_todo_edit(t)
      t.strftime("%FT%H:%M")
    end
    
    # finds all todos with a datetime between today and 1 week from now
    def upcoming_todos(todos)
      todos.select{ |todo| todo.datetime >= Date.today && todo.datetime <= 1.week.from_now && todo.complete == false}
    end

    def overdue_todos(todos)
      todos.select{ |todo| todo.complete == false && todo.datetime < DateTime.now }
    end
    
  end

end
