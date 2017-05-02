require 'sqlite3'

database = SQLite3::Database.new("db/quesadilla_development.db")
database.execute("CREATE TABLE quesadillas (id INTEGER PRIMARY KEY AUTOINCREMENT,
  name VARCHAR(64),
  description VARCHAR(128)
  );"
)
puts "creating quesadilla table for development, yo"
