# require "pry"

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    @@all << new_song
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
    end

  def self.find_or_create_by_name(song_name)
    if self.find_by_name(song_name)
      self.find_by_name(song_name)
    else
      self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(format)
    new_song = format.chomp(".mp3").split(" - ")
    song = self.new  # new_song[1], new_song[0])
    song.name = new_song[1]
    song.artist_name = new_song[0]
    song
  end

  def self.create_from_filename(format)
    new_song = format.chomp(".mp3").split(" - ")
    song = self.new
    song.name = new_song[1]
    song.artist_name = new_song[0]
    @@all << song
  end

  def self.destroy_all
    @@all.clear
  end

end
