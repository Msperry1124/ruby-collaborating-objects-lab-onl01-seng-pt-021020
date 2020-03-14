class Song
  @@all = []
  attr_accessor :name, :artist
  def initialize(name)
    @name = name
    @@all << self
   end
   def self.new_by_filename(file)
     song_name = file.split(" - ")[1]
     new_artist_name = file.split(" - ")[0]
     new_song = Song.new(song_name)
     new_song.artist_name = new_artist_name
     new_song
  end
   def artist_name=(name)
     self.artist = Artist.find_or_create_by_name(name)
     self.artist.add_song(self)
   end
   def self.all
     @@all
   end
end 
