class ToDoListController < ApplicationController
    get '/todo-list-items' do 
        if logged_in?
            @todos = current_user.todos.order(:datetime)
            erb :'/todos/index'
        else 
            redirect to "/"
        end
    end

    get '/todo-list-items/overdue' do
        if logged_in?
            @overdue_todos = current_user.todos.select{ |todo| todo.complete == false && todo.datetime < DateTime.now }
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
          erb :'/todos/new'
        else
          redirect to '/'
        end
    end

    get '/todo-list-items/upcoming' do
        if logged_in?
            todos = current_user.todos
            @upcoming_todos = todos.select{ |todo| todo.datetime >= Date.today && todo.datetime <= 1.week.from_now && todo.complete == false}
            erb :'todos/upcoming'
        else 
            redirect to "/"
        end
    end

    get '/todo-list-items/:id' do
        @todo = Todo.find_by(id: params[:id])
        if logged_in? && @todo.user == current_user
          erb :'todos/show'
        else
          redirect to '/'
        end
    end

    get '/todo-list-items/:id/edit' do
        @todo = Todo.find_by(id: params[:id])
        if logged_in? && @todo.user == current_user
          erb :'todos/edit'
        else
          redirect to '/'
        end
    end

    post '/todo-list-items/:id/cross-it-off' do
        Todo.find_by(id: params[:id]).update(complete: true)
        redirect to "/todo-list-items/#{params[:id]}"
    end
    
    post '/todo-list-items/:id/put-it-back-on-the-list' do
        Todo.find_by(id: params[:id]).update(complete: false)
        redirect to "/todo-list-items/#{params[:id]}"
    end

    post '/todo-list-items' do
        todo = Todo.create(params[:todo])
        # Created an after_create callback method that does this
        # todo.update(user: current_user)

        redirect to "/todo-list-items/#{todo.id}"
    end

    patch '/todo-list-items/:id' do
        todo = Todo.find_by(id: params[:id])
        todo.update(params[:todo])
        redirect to "/todo-list-items/#{todo.id}"
    end

    delete '/todo-list-items/:id' do
        todo = Todo.find_by(id: params[:id])
        todo.destroy
        redirect to '/todo-list-items'
    end

end