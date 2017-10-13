require_relative '../db/sql_runner'

class Owner

  attr_reader :id, :name

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

  def self.delete_all()
    sql = "DELETE FROM owners;"
    values = []
    Sql_runner.run(sql, "delete_all_owners", values)
  end

end
