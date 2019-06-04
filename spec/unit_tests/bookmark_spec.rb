require 'bookmark'

describe '#all' do

  it 'can display a list of bookmarks' do
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://www.makersacademy.com")
    expect(bookmarks).to include("http://www.destroyallsoftware.com")
    expect(bookmarks).to include("http://www.google.com")
  end

  it 'to connect to bookmark manager' do
    bookmarks = Bookmark.all
    conn = PG.connect( dbname: 'bookmark_manager')
    # result = conn.exec( "SELECT * FROM bookmarks" )
    expect(bookmarks).to include("http://www.makersacademy.com")
  end

end

# conn.exec( "SELECT * FROM bookmarks" ) do |result|
#   puts " id | url "
#   result.each do |row|
#     puts row.values_at('url')
#   end
# end
