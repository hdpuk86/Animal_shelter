require 'sinatra'
require 'sinatra/contrib/all'

require_relative '../models/owner'

get '/owners' do
  @owners = Owner.all()
  erb(:"owners/index")
end

get '/owners/new' do
  erb(:"owners/new")
end

post '/owners' do
  owner = Owner.new(params)
  owner.save()
  redirect to('/owners')
end

get '/owners/:id' do
  @owner = Owner.find(params['id'])
  erb(:"owners/show")
end

get '/owners/:id/edit' do
  @owner = Owner.find(params['id'])
  erb(:"owners/edit")
end

post '/owners/:id' do
  owner = Owner.new(params)
  owner.update()
  erb(:"owners/update")
end

get '/owners/:id/delete' do
  @owner = Owner.find(params['id'])
  erb(:"owners/delete")
end

post '/owners/:id/delete' do
  @owner = Owner.find(params['id'])
  @owner.delete()
  redirect to('owners')
end
