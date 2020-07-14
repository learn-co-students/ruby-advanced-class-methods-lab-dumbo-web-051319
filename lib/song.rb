require "pry"
class Song
  attr_accessor :name, :artist_name
  @@all = []

  def initialize (name = "", artist_name = "")
    @name = name
    @artist_name = artist_name
  end

  def self.create
    song = self.new
    song.save
    song
  end

  def self.new_by_name (name)
    song = self.new(name)
  end

  def self.create_by_name (name)
    song = self.new_by_name (name)
    song.save
    song
  end

  def self.find_or_create_by_name (name)
    if self.find_by_name(name)
      return self.all[-1]
    else
      self.create_by_name(name)
    end
  end

  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end

  def self.new_from_filename (filename)
    ary = filename.split(" - ")
    ary[1].slice!(".mp3")
    song = self.new(ary[1], ary[0])
  end

  def self.create_from_filename (filename)
    song = self.new_from_filename (filename)
    song.save
    song
  end

  def self.destroy_all
    @@all.clear
  end

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.find_by_name(name)
    @@all.find{|song| song.name == name}
  end


end
