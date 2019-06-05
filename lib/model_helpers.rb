require 'pg'

def setting_database
  if ENV['BOOKMARK_TEST'] == "test"
    PG.connect( dbname: 'bookmark_manager_test')
  else
    PG.connect( dbname: 'bookmark_manager')
  end
end
