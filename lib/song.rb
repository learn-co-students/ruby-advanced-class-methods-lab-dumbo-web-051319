require 'pry'

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
    Song.all << song      #or song.save
    song 
  end
  
  def self.new_by_name(name)
    song = self.new       #or Song.create to add song to array
    song.name = name
    song
  end 
  
  def self.create_by_name(name)
    song = Song.new_by_name(name) #or self.new_by_name(name)
    song.save                     #not Song.save << song
    song                          #Song.save overwrites array?
  end 
  
  def self.find_by_name(name)
    #array = Song.all              #self.all == Song.all == @@all
    Song.all.detect { |song| song.name == name } 
  end 
  
  def self.find_or_create_by_name(name)
    Song.find_by_name(name) || Song.create_by_name(name)
  end 
  
  def self.alphabetical 
    Song.all.sort_by do |song|
      song.name
    end
  end 
  
  def self.new_from_filename(filename)
    filename = filename.split(" - ")
    song = Song.new
    song.name = filename[1].chomp('.mp3')
    song.artist_name = filename[0]
    song
  end
  
  def self.create_from_filename(filename)
    @@all << Song.new_from_filename(filename)
  end
  
  def self.destroy_all 
    @@all.clear
  end 
end

