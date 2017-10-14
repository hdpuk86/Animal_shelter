require_relative '../db/sql_runner'

class Owner

  attr_reader :id
  attr_accessor :name

  def initialize(options)
    @id = options['id'].to_i if options['id']
    @name = options['name']
  end

  def save()
    sql = "INSERT INTO owners (name) VALUES ($1) RETURNING id;"
    values = [@name]
    result = Sql_runner.run(sql, "save_owner", values)
    @id = result[0]['id'].to_i
  end

  def delete()
    sql = "DELETE FROM owners WHERE id = $1;"
    values = [@id]
    Sql_runner.run(sql, "delete_owner", values)
  end

  def update()
    sql = "UPDATE owners SET (name) = ($1) WHERE id = $2;"
    values = [@name, @id]
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



end
