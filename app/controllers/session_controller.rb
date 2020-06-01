class SessionController < ApplicationController
    get '/signup' do 
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.create(params[:user])
        session[:message] = "Verify Your Information!"
        redirect to '/login'
    end

    get '/login' do
        @message = session[:message]
        erb :'/sessions/login'
    end

    post '/login' do
        "Hello World!"
    end
end