class SessionController < ApplicationController
    get '/signup' do 
        erb :'sessions/signup'
    end
end