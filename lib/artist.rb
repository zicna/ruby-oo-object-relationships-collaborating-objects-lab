class Artist
    attr_accessor :name
    attr_reader :artist

    @@all = []
    

    def initialize(name)
        @name = name
        @@all << self
        @songs = []
    end

    def artist=(artist)
        @artist = artist
    end

    def add_song(song)
        @songs << song
        song.artist = self if song.artist != self
        #@songs << song
    end

    def self.all
        @@all
    end

    def songs
        @songs
    end

    def self.find_or_create_by_name(name)
        a = @@all.find do |artist|
            artist.name
        end
            if a == nil
                return Artist.new(name)
            elsif a != nil
                return a
        end
    end

    def print_songs
        @songs.each{|song| puts song.name}
    end
end
