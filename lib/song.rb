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
  	song.save
  	song
  end

  def self.new_by_name(name)
  	song = self.new
  	song.name = name
  	song
  end

  def self.create_by_name(name)
  	# song = self.new
  	# song.name = name
  	# song.save
  	# song
  	song = self.create
  	song.name = name
  	song
  end

  def self.find_by_name(name)
  	self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
  	if self.all.include?(name)
  		song = find_by_name(name)
  	else
  		song = self.create_by_name(name)
  	end
  end

  def self.alphabetical
  	self.all.sort_by {|song| song.name}
  end

  def song_artist_name(filename)
  	file_name.slice!(".mp3")
  	@song_name = file_name.split(' - ')[1]
  	@song_artist_name = file_name.split(' - ')[0]
  end

  def self.new_from_filename(file_name)
  	song = Song.new
  	file_name.slice!(".mp3")
  	song.name = file_name.split(' - ')[1]
  	song.artist_name = file_name.split(' - ')[0]
  	song
  end

  def self.create_from_filename(file_name)
  	song = Song.new
   	file_name.slice!(".mp3")
  	song.name = file_name.split(' - ')[1]
  	song.artist_name = file_name.split(' - ')[0]
  	song.save
  	song
  end

  def self.destroy_all
  	self.all.clear
  end

end
