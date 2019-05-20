require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.create
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = self.create
    song.name= name
    song
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end


  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(song_name)
  Song.all.find {|song| song.name == song_name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else Song.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.uniq.sort_by {|song| song.name  }
  end

  def self.new_from_filename(song_format)
    new_song = song_format.chomp(".mp3").split(" - ")
    song = self.new
    song.name = new_song[1]
    song.artist_name = new_song[0]
    song
    # binding.pry
  end

  def self.create_from_filename(song_format)
    new_song = song_format.chomp(".mp3").split(" - ")
    song = self.new
    song.name = new_song[1]
    song.artist_name = new_song[0]
    @@all << song
  end

  def self.destroy_all
    self.all.clear
    self.all
  end

end
