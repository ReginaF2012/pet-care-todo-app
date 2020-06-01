require './config/environment'
class PetController < ApplicationController
    get '/pets' do
        "Hello World!"
    end
end