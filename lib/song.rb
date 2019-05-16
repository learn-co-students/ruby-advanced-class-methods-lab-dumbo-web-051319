require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize (name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create
    song = self.new
    self.all << song
    song
  end

  def self.new_by_name(name)
    self.new(name)
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    self.all << song
    song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    self.create_by_name(name)
    self.find_by_name(name)
  end

  def self.alphabetical
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(file_name)
    file_song = file_name.chomp(".mp3").split(" - ")
    self.new(file_song[1],file_song[0])
  end

  def self.create_from_filename(file_name)
    self.all <<  self.new_from_filename(file_name)
  end

  def self.destroy_all
    self.all.clear
  end

end


song = Song.new
Song.all.include?(song)
