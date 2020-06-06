class PetController < ApplicationController
    get '/pets' do
        if logged_in?
          @pets = Pet.where(user_id: current_user.id)
          @message = session[:message]
          session[:message] = nil
          erb :'/pets/index'
        else 
          redirect to "/"
        end
    end

    get '/pets/new' do
      if logged_in?
        @message = session[:message]
        session[:message] = nil
        erb :'/pets/new'
      else
        redirect to '/'
      end
    end

    get '/pets/:slug' do
        @pet = Pet.find_by(slug: params[:slug])
        if logged_in? && @pet.user == current_user
          erb :'/pets/show'
        else
          redirect to '/'
        end
    end

    get '/pets/:slug/edit' do
        @pet = Pet.find_by(slug: params[:slug])
        if logged_in? && @pet.user == current_user
          @message = session[:message]
          session[:message] = nil
          erb :'/pets/edit'
        else
          redirect to '/'
        end
    end

    post '/pets' do
        pet = Pet.new(params[:pet])
        if pet.valid?
          pet.save
          pet.update(user: current_user)
          redirect to "/pets/#{pet.slug}"
        else
          session[:message] = "Invalid Input"
          redirect to '/pets/new'
        end
    end

    patch '/pets/:slug' do
        pet = Pet.find_by(slug: params[:slug])
        if pet.valid? && pet.user == current_user
          pet.update(params[:pet])
          pet.make_slug
          redirect to "/pets/#{pet.slug}"
        else
          session[:message] = "Invalid Input"
          redirect to "/pets/#{pet.slug}/edit"
        end
    end

    delete '/pets/:slug' do
        pet = Pet.find_by(slug: params[:slug])
        if pet.user == current_user
          pet.destroy
          session[:message] = "Successfully Deleted"
        end
          redirect to '/pets'
    end

    get '/pets/:slug/to-do' do
      @pet = Pet.find_by(slug: params[:slug])
      if logged_in? && @pet.user == current_user
        erb :'/pets/todos_for_one_pet'
      else
        redirect to '/'
      end
    end
end