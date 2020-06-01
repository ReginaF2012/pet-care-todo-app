class SessionController < ApplicationController
    get '/signup' do 
        erb :'sessions/signup'
    end

    post '/signup' do
        @user = User.create(params[:user])
        session[:user_id] = @user.id
        redirect to '/login'
    end

    get '/login' do
        erb :'/sessions/login'
    end
end