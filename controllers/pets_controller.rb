require 'sinatra'
require 'sinatra/contrib/all'
require_relative '../models/pet'


get '/pets' do
  @pets = Pet.all()
  erb( :"pets/index")
end

get '/pets/new' do
  erb (:"pets/new")
end

post '/pets' do
  pet = Pet.new(params)
  pet.save()
  redirect to('/pets')
end
