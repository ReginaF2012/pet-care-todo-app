class ToDoListController < ApplicationController
    get '/todo-list-items' do 
        if logged_in?
            @todos = current_user.todos.order(:datetime)
            @message = session[:message]
            session[:message] = nil
            erb :'/todos/index'
        else 
            redirect to "/"
        end
    end

    get '/todo-list-items/overdue' do
        if logged_in?
            @overdue_todos = overdue_todos(current_user.todos)
            erb :'todos/overdue'
        else
           redirect to '/'
        end 
    end

    get '/todo-list-items/complete' do
        if logged_in?
            @completed_todos = current_user.todos.select{ |todo| todo.complete == true }
            erb :'/todos/complete'
        else
            redirect to '/'
        end
    end

    get '/todo-list-items/incomplete' do
        if logged_in?
            @incompleted_todos = current_user.todos.select{ |todo| todo.complete == false }
            erb :'/todos/incomplete'
        else
            redirect to '/'
        end
    end

    get '/todo-list-items/new' do
        if logged_in?
          @message = session[:message]
          session[:message] = nil
          erb :'/todos/new'
        else
          redirect to '/'
        end
    end

    get '/todo-list-items/upcoming' do
        if logged_in?
            todos = current_user.todos
            @upcoming_todos = upcoming_todos(todos)
            erb :'todos/upcoming'
        else 
            redirect to "/"
        end
    end

    get '/todo-list-items/:id' do
        @todo = Todo.find_by(id: params[:id])
        if !@todo
            session[:message] = "Invalid Input"
            redirect to '/todo-list-items'
        else
          if logged_in? && @todo.user == current_user
            erb :'todos/show'
          else
            redirect to '/'
          end
        end
    end

    get '/todo-list-items/:id/edit' do
        @todo = Todo.find_by(id: params[:id])
        if !@todo
          session[:message] = "Invalid Input"
          redirect to '/todo-list-items'
        else
          if logged_in? && @todo.user == current_user
            @message = session[:message]
            session[:message] = nil
            erb :'todos/edit'
          else
            redirect to '/'
          end
        end
    end

    post '/todo-list-items/:id/cross-it-off' do
        todo = Todo.find_by(id: params[:id])
        if todo.user == current_user
          todo.update(complete: true)
          redirect to "/todo-list-items/#{params[:id]}"
        else
          session[:message] = "Invalid Input"
          redirect to '/todo-list-items'
        end
    end
    
    post '/todo-list-items/:id/put-it-back-on-the-list' do
        todo = Todo.find_by(id: params[:id])
        if todo.user == current_user
          todo.update(complete: false)
          redirect to "/todo-list-items/#{params[:id]}"
        else
          session[:message] = "Invalid Input"
          redirect to '/todo-list-items'
        end
    end

    post '/todo-list-items' do
        if params[:todo].has_key?("pet_ids")
          todo = Todo.create(params[:todo])
          redirect to "/todo-list-items/#{todo.id}"
        else
          session[:message] = "Must select at least 1 pet"
          redirect to '/todo-list-items/new'
        end
    end

    patch '/todo-list-items/:id' do
        todo = Todo.find_by(id: params[:id])
        if params[:todo].has_key?("pet_ids") && todo.user == current_user
          todo.update(params[:todo])
          redirect to "/todo-list-items/#{todo.id}"
        else
          session[:message] = "Must select at least 1 pet"
          redirect to "/todo-list-items/#{todo.id}/edit"
        end
    end

    delete '/todo-list-items/:id' do
        todo = Todo.find_by(id: params[:id])
        if todo.user == current_user
          todo.destroy
          session[:message] = "Successfully Deleted"
        end
        redirect to '/todo-list-items'
    end

end