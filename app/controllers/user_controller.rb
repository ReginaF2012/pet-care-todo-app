class UserController < ApplicationController
    get '/users/:id' do
        #users cannot see other user's homepage
        if current_user.id == params[:id].to_i
          
          erb :'users/homepage'
        else
            redirect to '/'
        end
    end
end