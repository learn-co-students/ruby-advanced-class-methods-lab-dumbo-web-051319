class Song
  attr_accessor :name, :artist_name
  @@all = []

  def save
    self.class.all << self
  end

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(song_name)
    # create a new song by using self instead of Song
    song = self.new
    # associate the string of song_name to the :name variable
    song.name = song_name
    song
  end

  def self.create_by_name(song_name)
    song_title = song_name.to_s
    song_name = self.new
    song_name.name = song_title
    @@all << song_name
    song_name
  end

  def self.find_by_name(song_name)
    self.all.detect {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(song_name)
    self.find_by_name(song_name) || self.create_by_name(song_name)
  end

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end

  def self.create_from_filename(filename)
    splits = filename.split(" - ")
    artist_name = splits[0]
    song_name = splits[1].gsub(".mp3", "")
    song = self.create
    song.name = song_name
    song.artist_name = artist_name
  end

  def self.new_from_filename(filename)
    splits = filename.split(" - ")
    artist_name = splits[0]
    song_name = splits[1].gsub(".mp3", "")

    song = self.create
    song.name = song_name
    song.artist_name = artist_name
    song
  end

  def self.all
    @@all
  end

  def self.destroy_all
      self.all.clear
    end
end
