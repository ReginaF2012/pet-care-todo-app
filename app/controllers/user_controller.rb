class UserController < ApplicationController
    get '/users/:id' do 
        erb :'users/homepage'
    end
end