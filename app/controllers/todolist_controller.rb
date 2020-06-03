class ToDoListController < ApplicationController
    get '/todo-list-items' do 
        if logged_in?
            @todos = To_Do.where(user_id: current_user.id)
            erb :'/todos/index'
        else 
            redirect to "/"
        end
    end

    get '/todo-list-items/new' do 
        erb :'/todos/new'
    end

    get '/todo-list-items/:id' do
        erb :'todos/show'
    end

    post '/todo-list-items' do
        binding.pry
    end

    patch '/todo-list-items/:id' do
    end

    delete '/todo-list-items/:id/delete' do
    end

end