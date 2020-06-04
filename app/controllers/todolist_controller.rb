class ToDoListController < ApplicationController
    get '/todo-list-items' do 
        if logged_in?
            @todos = current_user.todos.uniq
            erb :'/todos/index'
        else 
            redirect to "/"
        end
    end

    get '/todo-list-items/new' do 
        erb :'/todos/new'
    end

    get '/todo-list-items/:id' do
        @todo = Todo.find_by(id: params[:id])
        erb :'todos/show'
    end

    get '/todo-list-items/:id/edit' do
        @todo = Todo.find_by(id: params[:id])
        erb :'todos/edit'
    end

    get 'todo-list-items/upcoming' do
        if logged_in?
            @todos = current_user.todos.uniq
            @upcomming_todos = users_todos.select{ |todo| todo.datetime >= Date.today && todo.datetime <= 1.week.from_now && todo.complete == false}
            erb :'todos/upcoming'
        else 
            redirect to "/"
        end
    end

    post '/todo-list-items/:id/cross-it-off' do
        Todo.find_by(id: params[:id]).update(complete: true)
        redirect to '/todo-list-items'
    end

    post '/todo-list-items' do
        todo = Todo.create(params[:todo])
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