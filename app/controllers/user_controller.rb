class UserController < ApplicationController
    get '/users/:id' do
        #users cannot see other user's homepage
        if logged_in? && current_user.id == params[:id].to_i
          @user = User.find_by(id: current_user.id)
          todos = @user.todos.uniq
          @upcoming_todos = upcoming_todos(todos)
          @overdue_todos = overdue_todos(todos)
          pets_with_birthdays = current_user.pets.select{ |pet| pet.birthday != nil }
          @pets_birthday_today = pets_with_birthdays.select{ |pet| pet.birthday.day == Date.today.day && pet.birthday.month == Date.today.month }
          @pets_birthday_today_names = @pets_birthday_today.map(&:name).join(" and ")

          erb :'users/homepage'
        else
            session[:message] = "You don't have access to that page"
            redirect to '/'
        end
    end
end