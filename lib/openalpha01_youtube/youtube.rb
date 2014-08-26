
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

require 'youtube_it'


class YouTube

    attr_writer :options

    def initialize(settings={})
        @settings = settings
        self.connect
    end

    def connect
        begin
            client = YouTubeIt::OAuth2Client.new(@settings)
        rescue => connection_error

        else 
            #client.refresh_access_token!
        end
    end

    def check_playlist

    end

    def upload_video
        #begin
            #client.video_upload(File.open(video), :title => @options[:title], :description => @options[:description], :category => @options[:category], :keywords => @options[:keywords])
        #rescue => error_msg
            #puts "Video upload failed:\n#{error_msg}\n#{error_msg.backtrace.join("\n")}"
        #else
            #puts "Finished uploading!"
        #end
    end

end

test = YouTube.new({:title=>"Title", :description=>"Test descriptiong", :category=>"PEOPLE", :keywords=>"OC, driving", :playlist=>"dashcam"})

puts test.options.inspect
