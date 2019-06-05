require 'pg'

def set_up_test_database
  puts "********"
  puts "Setting up test database"
  puts "********"
  conn = PG.connect( dbname: 'bookmark_manager_test')
  conn.exec("TRUNCATE bookmarks;")
end
