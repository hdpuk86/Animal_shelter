require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/pet'


get '/pets' do
  @pets = Pet.all()
  erb( :"pets/index")
end

get '/pets/adoptable' do
  @pets = Pet.all()
  erb(:"pets/adoptable")
end

get '/pets/training' do
  @pets = Pet.all()
  erb(:"pets/training")
end

get '/pets/hospital' do
  @pets = Pet.all()
  erb(:"pets/hospital")
end

get '/pets/new' do
  erb (:"pets/new")
end

post '/pets' do
  pet = Pet.new(params)
  pet.save()
  redirect to('/pets')
end

get '/pets/:id' do
  @pet = Pet.find(params['id'])
  erb(:"pets/show")
end

get '/pets/:id/edit' do
  @pet = Pet.find(params['id'])
  erb(:"pets/edit")
end

post '/pets/:id' do
  pet = Pet.new(params)
  pet.update()
  erb(:"pets/update")
end

get '/pets/:id/delete' do
  @pet = Pet.find(params['id'])
  erb(:"pets/delete")
end

post '/pets/:id/delete' do
  @pet = Pet.find(params['id'])
  @pet.delete()
  redirect to('/pets')
end
