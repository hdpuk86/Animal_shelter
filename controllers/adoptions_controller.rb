require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/adoption'
require_relative '../models/pet'
require_relative '../models/owner'

get '/adoptions' do
  @adoptions = Adoption.all()
  erb(:"adoptions/index")
end

get '/adoptions/new' do
  @pets = Pet.all()
  @owners = Owner.all()
  erb(:"adoptions/new")
end

post '/adoptions' do
  adoption = Adoption.new(params)
  adoption.save()
  pet = adoption.pet()
  owner = adoption.owner()
  owner.adopt(pet)
redirect to('/adoptions')
end
