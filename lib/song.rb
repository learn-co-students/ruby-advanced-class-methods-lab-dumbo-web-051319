class Song
  attr_accessor :name, :artist_name #this creates instances 
  
  @@all = [] #class variable 
             #Array to hold all instances 

  def self.all #class method 
    @@all
  end

  def save 
    self.class.all << self
  end
  
  def self.create #class constructor 
  song = Song.new 
  song.save 
  song 
  end

  def self.new_by_name(song_name) #<- argument/parameters
  #class constructor   
  
  #take in the string name of a song
  song = self.new 
  song.name = song_name #song.name is the part of the instance I want. song_name is my parameter 
  
    song #returns song 
  end 
  
  
  def self.create_by_name(song_name) #class constructor
  song = self.create #using the class constructor from before that creates a new instance when creating a new song. This adds it to the array
  
  song.name = song_name #song.name is the part of the instance I want. song_name is my parameter 
  
  song #returns song
  end
  
  
end
