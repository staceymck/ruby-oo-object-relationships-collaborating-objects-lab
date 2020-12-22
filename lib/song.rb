class Song
    attr_accessor :name, :artist
    
    @@all = []

    def initialize(name)
        @name = name
        save
    end

    def save
        self.class.all << self
    end

    def self.all
        @@all
    end

    def self.new_by_filename(filename)
        song_details = filename.split(" - ")
        name = song_details[1]
        artist = song_details[0]
        song = Song.new(name)
        song.artist_name = artist
        song
    end

    def artist_name=(name)
        self.artist = Artist.find_or_create_by_name(name)
    end

end