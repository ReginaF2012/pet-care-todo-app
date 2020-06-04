class PetController < ApplicationController
    get '/pets' do
        if logged_in?
          @pets = Pet.where(user_id: current_user.id)
          erb :'/pets/index'
        else 
          redirect to "/"
        end
    end

    get '/pets/new' do
        erb :'/pets/new'
    end

    get '/pets/:slug' do
        @pet = Pet.find_by(slug: params[:slug])
        if @pet.user == current_user
          erb :'/pets/show'
        else
          redirect to '/'
        end
    end

    get '/pets/:slug/edit' do
        @pet = Pet.find_by(slug: params[:slug])
        erb :'/pets/edit'
    end

    post '/pets' do
        pet = Pet.create(params[:pet])
        pet.update(user: current_user)
        redirect to "/pets/#{pet.slug}"
    end

    patch '/pets/:slug' do
        pet = Pet.find_by(slug: params[:slug])
        pet.update(params[:pet])
        pet.make_slug
        redirect to "/pets/#{pet.slug}"
    end

    delete '/pets/:slug' do
        pet = Pet.find_by(slug: params[:slug])
        pet.destroy
        redirect to '/pets'
    end

    get '/pets/:slug/to-do' do
      @pet = Pet.find_by(slug: params[:slug])
      erb :'/pets/todos_for_one_pet'
    end
end