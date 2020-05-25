class Song
  attr_accessor :name, :artist_name #this creates instances 
  
  @@all = [] #class variable / Array to hold all instances 

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

  
  def self.create_by_name(song_name) #class constructor
    song = self.create 
    song.name = song_name 
    song 
  end 
  
  
  def self.find_by_name(song_name) #class finder with parameter
    self.all.find {|song| song.name == song_name} 
  end 

  
  def self.find_or_create_by_name(song_name) #class method with parameter
    self.find_by_name(song_name) || self.create_by_name(song_name)
    #took the two methods from before and using the || (or) condition
   end

 
  def self.alphabetical #class method 
    self.all.sort_by{|song| song.name}
  end

  def self.new_from_filename(filename)
   split = filename.chomp(".mp3").split(" - ")
   artist = split[0]
   title = split[1]
   
   song = self.new
   song.name = title
   song.artist_name = artist 
   song
  end
  
  
  def self.create_from_filename(filename) 
   split = filename.chomp(".mp3").split(" - ")
   artist = split[0]
   title = split[1]
   
   song = self.create 
   song.name = title 
   song.artist_name = artist 
   song
  end 
  
  def self.destroy_all
    self.all.clear
  end 
end

  