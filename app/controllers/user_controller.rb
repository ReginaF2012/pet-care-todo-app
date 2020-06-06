class UserController < ApplicationController
    get '/users/:id' do
        #users cannot see other user's homepage
        if logged_in? && current_user.id == params[:id].to_i
          @user = User.find_by(id: session[:user_id]) if session[:user_id]
          todos = @user.todos.uniq
          @upcoming_todos = todos.select{ |todo| todo.datetime >= Date.today && todo.datetime <= 1.week.from_now && todo.  complete == false}
          @overdue_todos = current_user.todos.select{ |todo| todo.complete == false && todo.datetime < DateTime.now }
          
          erb :'users/homepage'
        else
            session[:message] = "You don't have access to that page"
            redirect to '/'
        end
    end
end