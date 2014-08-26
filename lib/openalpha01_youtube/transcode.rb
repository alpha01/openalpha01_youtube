
# Written by Tony Baltazar. August 2014.
# Email: root[@]rubyninja.org

# This program is free software; you can redistribute it and/or
# modify it under the terms of the GNU General Public License as
# published by the Free Software Foundation; either version 3 of the
# License, or (at your option) any later version.
#
# This program is distributed in the hope that it will be useful, but
# WITHOUT ANY WARRANTY; without even the implied warranty of
# MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the GNU
# General Public License for more details.
#
# You should have received a copy of the GNU General Public License
# along with this program; if not, write to the Free Software
# Foundation, Inc., 59 Temple Place, Suite 330, Boston, MA 02111-1307 USA

require 'securerandom'

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

    protected
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
                print self.ffmpeg + " -i #{file} -s 1920x1080 -r 30 -vb 220000k -threads 2 -vcodec dnxhd -acodec copy #{file}_#{@unique_transcode_string}.mov"
            rescue => transcode_error
                raise "ERROR - Unable to transcode video #{file}:\n#{transcode_error}\n#{transcode_error.backtrace.join("\n")}"
                system "rm -f #{transcode_file_name} > /dev/null 2>&1"
            end
        else
            puts "Successfully transcoded #{file}!"
        end
    end

end

#test = Transcode.new('asdfafda.mov')
#puts test.transcoded_videos


