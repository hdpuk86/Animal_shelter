require_relative '../db/sql_runner'

class Owner

  attr_reader :id
  attr_accessor :name, :looking_for

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
    @looking_for = options['looking_for']
  end

  def save()
    sql = "INSERT INTO owners (name, looking_for) VALUES ($1, $2) RETURNING id;"
    values = [@name, @looking_for]
    result = Sql_runner.run(sql, "save_owner", values)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1;"
    values = [@id]
    Sql_runner.run(sql, "delete_owner", values)
  end

  def update()
    sql = "UPDATE owners SET (name, looking_for) = ($1, $2) WHERE id = $3;"
    values = [@name, @looking_for, @id]
    Sql_runner.run(sql, "update_owner", values)
  end

  def self.find(id)
    sql = "SELECT * FROM owners WHERE id = $1;"
    values = [id]
    result = Sql_runner.run(sql, "find_owner", values).first()
    return Owner.new(result)
  end

  def self.delete_all()
    sql = "DELETE FROM owners;"
    values = []
    Sql_runner.run(sql, "delete_all_owners", values)
  end

  def self.all()
    sql = "SELECT * FROM owners;"
    values = []
    results = Sql_runner.run(sql, "show_all_owners", values)
    return results.map {|owner| Owner.new(owner)}
  end

  def adopt(pet)
    #if pet status is ready
    # if pet.status == "Ready"
      #change pet status to "Adopted"
      pet.status = "Adopted"
      pet.update()
      @looking_for = "None"
      self.update()
      # #insert new adoption into adoptions table in the database
      # sql = "INSERT INTO adoptions (pet_id, owner_id) VALUES ($1, $2);"
      # values = [pet.id, @id]
      # Sql_runner.run(sql, "add_adoption", values)
    # end
  end

end
