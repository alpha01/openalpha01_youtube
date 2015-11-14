
require 'securerandom'

module OpenAlpha01YouTube
  class Transcode  
    def initialize(transcode_files)
      @unique_transcode_string = SecureRandom.hex(5)
      @transcode_files = transcode_files
      if @transcode_files.kind_of?(Array)
        @transcode_files.each { |file| self.transcode_video(file) }  
      else
        self.transcode_video(@transcode_files)
      end
    end 

    def transcoded_videos
      return "*#{@unique_transcode_string}.mov"
    end

    def ffmpeg
      bin = ["ffmpeg", "avconv"]
      bin.each do |v|
        return `which #{v}`.chomp unless `which #{v}`.empty?
      end
      return false
    end

    protected
    def transcode_video(file)
      if self.ffmpeg
        puts "Transcoding videos..."
        begin
          #system self.ffmpeg + " -i #{file} -s 1920x1080 -r 30 -vb 220000k -threads 2 -vcodec dnxhd -acodec copy #{file}_#{@unique_transcode_string}.mov"
          system self.ffmpeg + " -i #{file} -s 1920x1080 -r 30 -vb 220000k -threads 2 -vcodec libx264 -acodec copy #{file}_#{@unique_transcode_string}.mov"
          puts "\nSuccessfully transcoded #{file}!"
        rescue => transcode_error
          system "rm -f #{transcode_file_name} > /dev/null 2>&1"
          raise "ERROR - Unable to transcode video #{file}:\n#{transcode_error}\n#{transcode_error.backtrace.join("\n")}"
        end
      else
          puts "ffmpeg/avconv is not installed."
      end
    end
  end
end

test = OpenAlpha01YouTube::Transcode.new('00150002.MOV')
#puts test.transcoded_videos


