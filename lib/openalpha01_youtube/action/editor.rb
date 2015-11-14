
module OpenAlpha01YouTube
  class Editor  
    def initialize(videos)
      @melt = self.melt
      self.join_videos(videos)
    end

    def self.join_videos(videos)
      if videos.kind_of?(Array)
        videos.each do |file|
          unless File.file?(file)
            puts "File #{file} not found!"
            return false
          end
        end 
        puts "#{@melt} #{videos.map{|a| a}.join(' ')} consumer avformat:nameofvideohere.mp4 vcodec=libx24 b=5000k acodec=aac ab=384k"
        return true
      else
        if File.file?(videos)
          return true
        elsif Dir.glob(videos).sort
          puts "#{@melt} #{Dir.glob(videos).sort.map{|a| a}.join(' ')} consumer avformat:nameofvideohere.mp4 vcodec=libx24 b=5000k acodec=aac ab=384k"
          return true
        else
          puts "File #{videos} not found!"
          return false
        end
      end
    end

    def add_transition
      # if array
    end

    def self.melt
      unless `which melt`.empty?
        return `which melt`.chomp
      else
        raise "Melt is not installed on your system"
      end
    end
  end
end
