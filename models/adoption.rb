require_relative '../db/sql_runner'

class Adoption

  attr_reader :id
  attr_accessor :pet_id, :owner_id

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @pet_id = options['pet_id'].to_i
    @owner_id = options['owner_id'].to_i
  end

  def save()
    sql = "INSERT INTO adoptions (pet_id, owner_id) VALUES ($1, $2) RETURNING id;"
    values = [@pet_id, @owner_id]
    result = Sql_runner.run(sql, "save_adoption", values)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM adoptions WHERE id = $1;"
    values = [@id]
    Sql_runner.run(sql, "delete_adoption", values)
  end

  def update()
    sql = "UPDATE adoptions SET (pet_id, owner_id) = ($1, $2) WHERE id = $3;"
    values = [@pet_id, @owner_id, @id]
    Sql_runner.run(sql, "update_adoption", values)
  end

  def self.delete_all()
    sql = "DELETE FROM adoptions;"
    values = []
    Sql_runner.run(sql, "delete_all_adoptions", values)
  end

  def self.all()
    sql = "SELECT * FROM adoptions;"
    values = []
    results = Sql_runner.run(sql, "show_all_adoptions", values)
    return results.map {|adoption| Adoption.new(adoption)}
  end

  def self.find(id)
    sql = "SELECT * FROM adoptions WHERE id = $1;"
    values = [id]
    result = Sql_runner.run(sql, "find_adoption", values).first()
    return Adoption.new(result)
  end

  def pet()
    sql = "SELECT * FROM pets WHERE id = $1;"
    values = [@pet_id]
    result = Sql_runner.run(sql, "show_pet", values).first()
    return Pet.new(result)
  end

  def owner()
    sql = "SELECT * FROM owners WHERE id = $1;"
    values = [@owner_id]
    result = Sql_runner.run(sql, "show_owner", values).first()
    return Owner.new(result)
  end

end
