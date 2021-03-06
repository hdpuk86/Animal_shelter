require_relative '../db/sql_runner'
require 'Date'

class Pet

  attr_accessor :name, :status, :image, :type, :breed, :admission_date, :child_friendly, :age
  attr_reader :id, :sex

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @status = options['status']
    @admission_date = Date.parse(options['admission_date'])
    @child_friendly = options['child_friendly']
    @age = options['age'].to_i
    @sex = options['sex']
    @image = options['image']
  end

  def save()
    sql = "INSERT INTO pets (name, type, breed, status, admission_date, child_friendly, age, sex, image)
    VALUES ($1, $2, $3, $4, $5, $6, $7, $8, $9) RETURNING id;"
    values = [@name, @type, @breed, @status, @admission_date, @child_friendly, @age, @sex, @image]
    result = Sql_runner.run(sql, "save_pet", values)
    @id = result[0]['id'].to_i
  end

  def self.delete_all()
    sql = "DELETE FROM pets;"
    values = []
    Sql_runner.run(sql, "delete_all_pets", values)
  end

  def delete()
    sql = "DELETE FROM pets WHERE id = $1;"
    values = [@id]
    Sql_runner.run(sql, "delete_a_pet", values)
  end

  def update()
    sql = "UPDATE pets SET (name, type, breed, status, admission_date, child_friendly, age, sex, image)
    =($1, $2, $3, $4, $5, $6, $7, $8, $9) WHERE id = $10;"
    values = [@name, @type, @breed, @status, @admission_date, @child_friendly, @age, @sex, @image, @id]
    Sql_runner.run(sql, "update_pet", values)
  end

  def self.all()
    sql = "SELECT * FROM pets;"
    values = []
    results = Sql_runner.run(sql, "show_all_pets", values)
    return results.map {|pet| Pet.new(pet)}
  end

  def self.find(id)
    sql = "SELECT * FROM pets WHERE id = $1;"
    values = [id]
    result = Sql_runner.run(sql, "find_pet", values).first()
    return Pet.new(result)
  end

  def owner()
    sql = "SELECT owners.* FROM owners
         INNER JOIN adoptions
         ON adoptions.owner_id = owners.id
         WHERE pet_id = $1;"
    values = [@id]
    result = Sql_runner.run(sql,"find_owner", values).first()
    return Owner.new(result).name()
  end

  def self.most_recent()
    #retrieve all pets
    pets = self.all()
    #sort pets by admission_date
    pets = pets.sort_by {|pet| pet.admission_date()}
    #return the most recent
    return pets.last()
  end

  def self.count_rescued()
    return self.all().count
  end

  def self.count_in_shelter()
    all = self.all()
    in_shelter = []
    for pet in all
      if pet.status != "Adopted"
        in_shelter << pet
      end
    end
    return in_shelter.count()
  end

  def self.count_adopted()
    all = self.all()
    adopted = []
    for pet in all
      if pet.status == "Adopted"
        adopted << pet
      end
    end
    return adopted.count()
  end

end
