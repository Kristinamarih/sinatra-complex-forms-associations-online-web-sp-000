class PetsController < ApplicationController

  get '/pets' do
    @pets = Pet.all
    erb :'/pets/index' 
  end

  get '/pets/new' do 
    erb :'/pets/new'
  end

  post '/pets' do 
<<<<<<< HEAD
    @pet = Pet.create(name: params[:pet][:name])
    if params[:pet][:owner_ids]
      @pet.owner_id = params[:pet][:owner_ids].first
      elsif params[:owner_name]
      owner = Owner.create(name: params[:owner_name])
      @pet.owner = owner
=======
    @pet = Pet.create(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owner << Owner.create(name: params["owner"]["name"])
>>>>>>> c0c46f18d2559fbda1a4e5b136b5f5aabeaa870c
    end
    @pet.save
    redirect to "pets/#{@pet.id}"
  end
  
  get '/pets/:id/edit' do
    @pet = Pet.find(params[:id])
    erb :'/pets/edit'
  end

  get '/pets/:id' do 
    @pet = Pet.find(params[:id])
    erb :'/pets/show'
  end

<<<<<<< HEAD
  post '/pets/:id' do 
    @pet = Pet.find(params[:id])
    @pet.update(name: params[:pet][:name])

    if params[:pet][:owner_ids]
      @pet.owner_id = params[:pet][:owner_ids].first
    end

    if !params[:owner][:name].empty?
      owner = Owner.create(name: params[:owner][:name])
      @pet.owner = owner
    end
    @pet.save

=======
  patch '/pets/:id' do 
    @pet = Pet.find(params[:id])
    @pet.update(params["pet"])
    if !params["owner"]["name"].empty?
      @pet.owner << Owner.create(name: params["owner"]["name"])
    end
    @pet.save
>>>>>>> c0c46f18d2559fbda1a4e5b136b5f5aabeaa870c
    redirect to "pets/#{@pet.id}"
  end
end