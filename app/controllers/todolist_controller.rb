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