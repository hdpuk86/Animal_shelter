require 'sinatra'
require 'sinatra/contrib/all'

get '/pets' do
  erb( :"pets/index")
end
