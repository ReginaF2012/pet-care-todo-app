class SessionController < ApplicationController
    get '/signup' do 
        @message = session[:message]
        session[:message] = nil
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.save
            session[:message] = "Verify Your Information!"
            redirect to '/login'
        else
            session[:message] = "Invalid username or password."
            redirect to '/signup'
        end
    end

    get '/login' do
        @message = session[:message]
        session[:message] = nil
        erb :'/sessions/login'
    end

    post '/login' do
        user = User.find_by(username: params[:user][:username])
    
        if user.authenticate(params[:user][:password])
            current_user
            session[:user_id] = user.id
            redirect to '/'
        else
            @message = "Wrong Username or Password"
            erb :'sessions/login'
        end

    end

    post '/logout' do
        session.clear
        redirect to '/'
    end
end