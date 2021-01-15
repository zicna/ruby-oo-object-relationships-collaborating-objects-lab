class Song

    @@all = []

    attr_accessor :name
    attr_reader :artist

    def initialize(name)
        @name = name
       
        @@all << self
    end

    def artist=(artist)
        @artist = artist

        artist.add_song(self) unless artist.songs.include?(self)
    end

    

    def self.new_by_filename(file)
        song = Song.new(file.split(" - ")[1])
        artist =  Artist.new(file.split(" - ")[0])
        song.artist = artist
        @@all << song
        song
    end

    def self.all
        @@all
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    
    end

end