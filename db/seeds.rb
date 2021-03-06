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
  "child_friendly" => "Yes",
  "age" => "5",
  "sex" => "Male",
  "image" => "/images/husky.jpg"
  })
pet1.save()

pet2 = Pet.new({
  "name" => "Willow",
  "type" => "Cat",
  "breed" => "Tabby",
  "status" => "In Training",
  "admission_date" => "2017-09-27",
  "child_friendly" => "No",
  "age" => "2",
  "sex" => "Female",
  "image" => "/images/tabby.jpg"
  })
pet2.save()

pet3 = Pet.new({
  "name" => "Benji",
  "type" => "Cat",
  "breed" => "British Shorthair",
  "status" => "Adopted",
  "admission_date" => "2017-07-30",
  "child_friendly" => "Yes",
  "age" => "7",
  "sex" => "Male",
  "image" => "/images/shorthair.jpg"
  })
pet3.save()

pet4 = Pet.new({
  "name" => "Rosie",
  "type" => "Dog",
  "breed" => "Labrador",
  "status" => "Ready to Adopt",
  "admission_date" => "2017-10-10",
  "child_friendly" => "Yes",
  "age" => "1",
  "sex" => "Female",
  "image" => "/images/labrador.jpg"
  })
pet4.save()

pet5 = Pet.new({
  "name" => "Harry",
  "type" => "Dog",
  "breed" => "Bulldog",
  "status" => "In Training",
  "admission_date" => "2017-09-30",
  "child_friendly" => "Yes",
  "age" => "3",
  "sex" => "Male",
  "image" => "/images/bulldog.jpg"
  })
pet5.save()

pet6 = Pet.new({
  "name" => "Fisher",
  "type" => "Cat",
  "breed" => "Ginger",
  "status" => "Ready to Adopt",
  "admission_date" => "2017-10-02",
  "child_friendly" => "Yes",
  "age" => "3",
  "sex" => "Male",
  "image" => "/images/ginger.jpg"
  })
pet6.save()

pet7 = Pet.new({
  "name" => "Bob",
  "type" => "Cat",
  "breed" => "Persian",
  "status" => "Recovering",
  "admission_date" => "2017-10-07",
  "child_friendly" => "No",
  "age" => "10",
  "sex" => "Male",
  "image" => "/images/persian.jpg"
  })
pet7.save()

pet8 = Pet.new({
  "name" => "Buddy",
  "type" => "Dog",
  "breed" => "German Sheperd",
  "status" => "Recovering",
  "admission_date" => "2017-10-12",
  "child_friendly" => "Yes",
  "age" => "9",
  "sex" => "Male",
  "image" => "/images/german_shepard.jpg"
  })
pet8.save()

# owners
owner1 = Owner.new({
  "name" => "Gary Smith",
  "type" => "Dog",
  "preferred_sex" => "Male",
  "children" => "No"
  })
owner1.save()

owner2 = Owner.new({
  "name" => "Sarah Colins",
  "type" => "Dog",
  "preferred_sex" => "Female",
  "children" => "No"
  })
owner2.save()

owner3 = Owner.new({
  "name" => "Ray Matthews",
  "type" => "Cat",
  "preferred_sex" => "Male",
  "children" => "Yes"
  })
owner3.save()

owner4 = Owner.new({
  "name" => "Amy Fowler",
  "type" => "Cat",
  "preferred_sex" => "Male",
  "children" => "No"
  })
owner4.save()

owner5 = Owner.new({
  "name" => "Jenny Owen",
  "type" => "Cat",
  "preferred_sex" => "Male",
  "children" => "Yes"
  })
owner5.save()

owner6 = Owner.new({
  "name" => "Jess Pine",
  "type" => "Dog",
  "preferred_sex" => "Male",
  "children" => "Yes"
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
