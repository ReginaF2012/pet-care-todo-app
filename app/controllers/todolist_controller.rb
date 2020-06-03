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
        binding.pry
        erb :'todos/show'
    end

    post '/todo-list-items' do
        todo = Todo.create(params[:todo])
        redirect to "/todo-list-items/#{todo.id}"
    end

    patch '/todo-list-items/:id' do
    end

    delete '/todo-list-items/:id/delete' do
    end

end