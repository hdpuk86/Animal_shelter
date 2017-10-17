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
  "admission_date" => "2017-09-03",
  "image" => "/images/husky.jpg"
  })
pet1.save()

pet2 = Pet.new({
  "name" => "Willow",
  "type" => "Cat",
  "breed" => "Tabby",
  "status" => "In Training",
  "admission_date" => "2017-09-27",
  "image" => "/images/tabby.jpg"
  })
pet2.save()

pet3 = Pet.new({
  "name" => "Benji",
  "type" => "Cat",
  "breed" => "British Shorthair",
  "status" => "Adopted",
  "admission_date" => "2017-07-30",
  "image" => "/images/shorthair.jpg"
  })
pet3.save()

pet4 = Pet.new({
  "name" => "Rosie",
  "type" => "Dog",
  "breed" => "Labrador",
  "status" => "Ready to Adopt",
  "admission_date" => "2017-10-10",
  "image" => "/images/labrador.jpg"
  })
pet4.save()

pet5 = Pet.new({
  "name" => "Harry",
  "type" => "Dog",
  "breed" => "Bulldog",
  "status" => "In Training",
  "admission_date" => "2017-09-30",
  "image" => "/images/bulldog.jpg"
  })
pet5.save()

pet6 = Pet.new({
  "name" => "Fisher",
  "type" => "Cat",
  "breed" => "Ginger",
  "status" => "Ready to Adopt",
  "admission_date" => "2017-10-02",
  "image" => "/images/ginger.jpg"
  })
pet6.save()

pet7 = Pet.new({
  "name" => "Bob",
  "type" => "Cat",
  "breed" => "Persian",
  "status" => "Recovering",
  "admission_date" => "2017-10-07",
  "image" => "/images/persian.jpg"
  })
pet7.save()

pet8 = Pet.new({
  "name" => "Buddy",
  "type" => "Dog",
  "breed" => "German Sheperd",
  "status" => "Recovering",
  "admission_date" => "2017-10-12",
  "image" => "/images/german_shepard.jpg"
  })
pet8.save()

# owners
owner1 = Owner.new({
  "name" => "Gary Smith",
  "wants" => "Dog"
  })
owner1.save()

owner2 = Owner.new({
  "name" => "Sarah Colins",
  "wants" => "Dog"
  })
owner2.save()

owner3 = Owner.new({
  "name" => "Ray Matthews",
  "wants" => "Cat"
  })
owner3.save()

owner4 = Owner.new({
  "name" => "Amy Fowler",
  "wants" => "Cat"
  })
owner4.save()

owner5 = Owner.new({
  "name" => "Jenny Owen",
  "wants" => "Cat and Dog"
  })
owner5.save()

owner6 = Owner.new({
  "name" => "Jess Pine",
  "wants" => "Any"
  })
owner6.save()

# adoptions
adoption1 = Adoption.new({
  "pet_id" => pet3.id(),
  "owner_id" => owner1.id(),
  "adoption_date" => "2017-08-26"
  })
adoption1.save()

binding.pry
nil
