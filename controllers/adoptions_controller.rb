require 'sinatra'
require 'sinatra/contrib/all'

get '/adoptions' do
  erb(:"adoptions/index")
end
