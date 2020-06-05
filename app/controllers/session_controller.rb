class SessionController < ApplicationController
    get '/signup' do 
        @message = session[:message]
        session[:message] = nil
        erb :'sessions/signup'
    end

    post '/signup' do
        user = User.new(params[:user])
        if user.email != "" && user.save
            session[:message] = "Verify Your Information!"
            redirect to '/login'
        else
            session[:message] = "Invalid email or password."
            redirect to '/signup'
        end
    end

    get '/login' do
        @message = session[:message]
        session[:message] = nil
        erb :'/sessions/login'
    end

    post '/login' do
        user = User.find_by(email: params[:user][:email])
    
        if user.authenticate(params[:user][:password])
            current_user
            session[:user_id] = user.id
            redirect to '/'
        else
            @message = "Wrong Email or Password"
            erb :'sessions/login'
        end

    end

    post '/logout' do
        session.clear
        redirect to '/'
    end
end