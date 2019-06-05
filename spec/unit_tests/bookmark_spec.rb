require 'bookmark'

describe '#all' do

  it 'can display a list of bookmarks' do
    conn = PG.connect( dbname: 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url) values ('http://www.makersacademy.com'),('http://www.google.com'),('http://www.facebook.com');")
    bookmarks = Bookmark.all
    expect(bookmarks).to include("http://www.makersacademy.com")
  end

  it 'to connect to bookmark manager' do
    conn = PG.connect( dbname: 'bookmark_manager_test')
    conn.exec("INSERT INTO bookmarks (url) values ('http://www.makersacademy.com');")
    bookmarks = Bookmark.all
    # result = conn.exec( "SELECT * FROM bookmarks" )
    expect(bookmarks).to include('http://www.makersacademy.com')
  end
end

describe '#add' do
  it 'can add a new bookmark' do
    bookmark = Bookmark.new('http://www.github.com')
    bookmark.add
    bookmarks = Bookmark.all
    expect(bookmarks).to include('http://www.github.com')
  end
end

# conn.exec( "SELECT * FROM bookmarks" ) do |result|
#   puts " id | url "
#   result.each do |row|
#     puts row.values_at('url')
#   end
# end
