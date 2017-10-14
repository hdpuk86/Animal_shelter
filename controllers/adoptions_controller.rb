require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/adoption'

get '/adoptions' do
  @adoptions = Adoption.all()
  erb(:"adoptions/index")
end
