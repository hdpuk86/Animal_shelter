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
  "status" => "Ready to Adopt",
  "admission_date" => "2017-09-03"
  })
pet1.save()

pet2 = Pet.new({
  "name" => "Willow",
  "type" => "Cat",
  "breed" => "Tabby",
  "status" => "In Training",
  "admission_date" => "2017-09-27"
  })
pet2.save()

pet3 = Pet.new({
  "name" => "Benji",
  "type" => "Cat",
  "breed" => "British Shorthair",
  "status" => "Adopted",
  "admission_date" => "2017-07-30"
  })
pet3.save()

pet4 = Pet.new({
  "name" => "Rosie",
  "type" => "Dog",
  "breed" => "Labrador",
  "status" => "Ready to Adopt",
  "admission_date" => "2017-10-10"
  })
pet4.save()

pet5 = Pet.new({
  "name" => "Harry",
  "type" => "Dog",
  "breed" => "Bulldog",
  "status" => "In Training",
  "admission_date" => "2017-09-30"
  })
pet5.save()

pet6 = Pet.new({
  "name" => "Fisher",
  "type" => "Cat",
  "breed" => "Ginger",
  "status" => "Ready to Adopt",
  "admission_date" => "2017-10-02"
  })
pet6.save()

# owners
owner1 = Owner.new({
  "name" => "Gary Smith",
  "looking_for" => "Dog"
  })
owner1.save()

owner2 = Owner.new({
  "name" => "Sarah Colins",
  "looking_for" => "Dog"
  })
owner2.save()

owner3 = Owner.new({
  "name" => "Ray Matthews",
  "looking_for" => "Cat"
  })
owner3.save()

owner4 = Owner.new({
  "name" => "Amy Fowler",
  "looking_for" => "Cat"
  })
owner4.save()

owner5 = Owner.new({
  "name" => "Jenny Owen",
  "looking_for" => "Cat and Dog"
  })
owner5.save()

owner6 = Owner.new({
  "name" => "Jess Pine",
  "looking_for" => "Any"
  })
owner6.save()

# adoptions
adoption1 = Adoption.new({
  "pet_id" => pet3.id(),
  "owner_id" => owner1.id()
  })
adoption1.save()

binding.pry
nil
