require 'pg'

class Sql_runner

  def self.run(sql, tag, values)
    begin
      db = PG.connect({ dbname: 'shelter', host: 'localhost'})
      db.prepare(tag, sql)
      result = db.exec_prepared(tag, values)
    ensure
      db.close()
    end
    return result
  end

end
