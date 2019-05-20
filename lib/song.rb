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
  song = self.new 
  song.name = song_name
  song 
  end 
  #INSTRUCTIONS FOR CLASS CONSTRUCTOR
  #song = self.new is constructing/creating a new song. 
  #song.name is the part of the instance I want. 
  #song_name is my parameter 
  #returns song 
  
  
  
  def self.create_by_name(song_name) #class constructor
    song = self.create 
    song.name = song_name 
    song 
  end 
  
  #INSTRUCTIONS FOR CLASS CONSTRUCTOR self.create_by_name
  #using the class constructor from before that creates a new instance when creating a new song. This adds it to the array
  #song.name is the part of the instance I want. song_name is my parameter 
  #returns song
  
  def self.find_by_name(song_name) #class finder with parameter
    self.all.find {|song| song.name == song_name} 
  end 
    #INSTRUCTIONS FOR CLASS FINDER 
    #self.all goes through my entire list/array
    #find is the method to find the parameters 
    #|song| is the singular item of my list that Im look for
    #song.name == song_name is the specificaions/condition for the singular item parameters
  
  
  def self.find_or_create_by_name(song_name) #class method with parameter
    self.find_by_name(song_name) || self.create_by_name(song_name)
    #took the two methods from before and using the || (or) condition
   end

 
  def self.alphabetical #class method 
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename) #class constructor
    filename.split("-")
    #WTF DO I DO HERE?!
    #the filename must be parsed. separate the artist naem from the rest of the data based on the - delimiter. and when you parse the song name you have to remove the .mp3
    
    song = self.new 
    song.name = song_name 
    song.artist_name = artist_name 
    song
  end 
  
  
    def self.create_from_filename(filename) #class constructor
    filename.split("-")
    #WTF DO I DO HERE 
   
    song = self.create  
    song.name = song_name 
    song.artist_name = artist_name 
    song
  end 
  
  def self.destroy_all
  self.all.clear
  end 
end
