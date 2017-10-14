require 'pry-byebug'
require 'Date'
require_relative '../models/pet'
require_relative '../models/owner'
require_relative '../models/adoption'

Adoption.delete_all()
Pet.delete_all()
Owner.delete_all()

# pets
pet1 = Pet.new({
  "name" => "Rex",
  "type" => "Dog",
  "breed" => "Husky",
  "status" => "Ready",
  "admission_date" => "2017-09-03"
  })
pet1.save()

pet2 = Pet.new({
  "name" => "Willow",
  "type" => "Cat",
  "breed" => "Tabby",
  "status" => "Not",
  "admission_date" => "2017-09-27"
  })
pet2.save()

# owners
owner1 = Owner.new({
  "name" => "Gary Smith"
  })
owner1.save()

  owner2 = Owner.new({
    "name" => "Sarah Colins"
    })
owner2.save()

# adoptions
adoption1 = Adoption.new({
  "pet_id" => pet1.id(),
  "owner_id" => owner1.id()
  })
adoption1.save()

binding.pry
nil
