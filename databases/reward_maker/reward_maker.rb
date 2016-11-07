
# require gems
require 'sqlite3'
require 'faker'

# create SQLite3 database
db = SQLite3::Database.new("rewards.db")
db.results_as_hash = true

# learn about fancy string delimiters
create_table_cmd = <<-SQL
  CREATE TABLE IF NOT EXISTS rewards(
    id INTEGER PRIMARY KEY,
    color VARCHAR(255),
    points INT
  )
SQL

# create a rewards table (if it's not there already)
db.execute(create_table_cmd)

# add a test reward
# db.execute("INSERT INTO rewards (color, points) VALUES ('yellow', 10)")

# add multiple rewards
def create_reward(db, color, points)
  db.execute("INSERT INTO rewards (color, points) VALUES (?, ?)", [color, points])
end

100.times do
  create_reward(db, Faker::Name.color, 0)
end

# explore ORM by retrieving data
# rewards = db.execute("SELECT * FROM rewards")
# rewards.each do |reward|
#  puts "reward, color #{reward['color']} is #{reward['points']} points"
# end

