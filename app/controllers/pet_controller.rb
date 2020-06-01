class PetController < ApplicationController
    get '/pets' do
        if logged_in?
          @pets = Pet.where(user_id: current_user.id)
          erb :'/pets/index'
        else 
          redirect to "/"
        end
    end
end