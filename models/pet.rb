require_relative '../db/sql_runner'
require 'Date'

class Pet

  attr_accessor :name, :status
  attr_reader :id, :type, :breed, :admission_date

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @type = options['type']
    @breed = options['breed']
    @status = options['status']
    @admission_date = Date.parse(options['admission_date'])
  end

  def save()
    sql = "INSERT INTO pets (name, type, breed, status, admission_date)
    VALUES ($1, $2, $3, $4, $5) RETURNING id;"
    values = [@name, @type, @breed, @status, @admission_date]
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
    sql = "UPDATE pets SET (name, type, breed, status, admission_date)
    =($1, $2, $3, $4, $5) WHERE id = $6;"
    values = [@name, @type, @breed, @status, @admission_date, @id]
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
    sql = "SELECT owners.name FROM owners
         INNER JOIN adoptions
         ON adoptions.owner_id = owners.id
         WHERE pet_id = $1;"
  end

end

# strftime - admission_date.strftime("%d/%m/%Y")
# Date.parse()
