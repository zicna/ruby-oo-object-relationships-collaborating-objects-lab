class MP3Importer

    attr_accessor :path

    def initialize(path)
        @path = path
    end

    def files
        Dir.entries(@path).select{|file| file.end_with?(".mp3")}
    end

    def import
        files.each do |file|
            file_name = file.split('.')[0]
            Song.new_by_filename(file_name)
        end
    end

    
end