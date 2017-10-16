require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/adoptions_controller'
require_relative 'controllers/owners_controller'
require_relative 'controllers/pets_controller'

require_relative 'models/pet.rb'

get '/' do
  @newest = Pet.most_recent()
  erb( :index )
end
