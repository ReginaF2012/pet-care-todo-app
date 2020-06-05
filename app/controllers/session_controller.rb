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
            session[:user_id] = user.id
            current_user
            redirect to "/users/#{current_user.id}"
        else
            @message = "Wrong Email or Password"
            erb :'sessions/login'
        end

    end

    get '/logout' do
        session.clear
        redirect to '/'
    end
end