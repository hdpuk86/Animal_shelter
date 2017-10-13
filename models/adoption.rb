require_relative '../db/sql_runner'

class Adoption

  attr_reader :id, :pet_id, :owner_id

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

  def self.delete_all()
    sql = "DELETE FROM adoptions;"
    values = []
    Sql_runner.run(sql, "delete_all_adoptions", values)
  end


end
