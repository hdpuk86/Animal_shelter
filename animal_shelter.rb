require 'sinatra'
require 'sinatra/contrib/all'
require_relative 'controllers/adoptions_controller'
require_relative 'controllers/owners_controller'
require_relative 'controllers/pets_controller'

require_relative 'models/pet.rb'
require_relative 'models/adoption.rb'

get '/' do
  @newest = Pet.most_recent()
  @latest = Adoption.latest()
  erb( :index )
end
