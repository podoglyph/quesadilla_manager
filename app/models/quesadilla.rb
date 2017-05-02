require 'sqlite3'

class Quesadilla
  attr_reader :name, :description, :id

  def initialize(quesadilla_params)
    @name = quesadilla_params["name"]
    @description = quesadilla_params["description"]
    @id = quesadilla_params["id"] if quesadilla_params["id"]
    @database = SQLite3::Database.new("db/quesadilla_development.db")
    @database.results_as_hash = true
  end

  def self.database
    database = SQLite3::Database.new("db/quesadilla_development.db")
    database.results_as_hash = true
    database
  end
  
  def save
    @database.execute("INSERT INTO quesadillas (name, description) VALUES (?, ?);", @name, @description)
  end

  def self.all
    quesadillas = database.execute("SELECT * FROM quesadillas")
    quesadillas.map do |quesadilla|
      Quesadilla.new(quesadilla)
    end
  end

  def self.find(id)
    quesadilla = database.execute("SELECT * FROM quesadillas WHERE id=?", id).first
    Quesadilla.new(quesadilla)
  end

end
