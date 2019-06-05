require 'pg'
require_relative 'model_helpers'

class Bookmark
  attr_reader :all, :url

  def initialize(url)
    @url = url
  end

  def self.all
      conn = setting_database
      result = conn.exec( "SELECT * FROM bookmarks" )
      result.map { |row| row['url'] }
  end

  def add
    conn = setting_database
    conn.exec("INSERT INTO bookmarks (url) VALUES ('#{@url}');")
  end

end
