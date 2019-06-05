require 'pg'

class Bookmark

  attr_reader :all

  def self.all
    if ENV['BOOKMARK_TEST'] == "test"
      conn = PG.connect( dbname: 'bookmark_manager_test')
    else
      conn = PG.connect( dbname: 'bookmark_manager')
    end
      result = conn.exec( "SELECT * FROM bookmarks" )
      result.map { |row| row['url'] }
  end
end
