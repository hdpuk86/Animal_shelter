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

end

# strftime - admission_date.strftime("%d/%m/%Y")
# Date.parse()
