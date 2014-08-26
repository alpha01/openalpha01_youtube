
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

require 'RMagick'
include Magick


class ImageTitle
    attr_writer :resolution

    def initialize(title, text_color="black", resolution=nil)
        @title = title
        @text_color = text_color
        @resolution = resolution
    end
    
    def resolution(arg=nil)
        if @resolution.eql?('1080p')
            @resolution = [1920, 1080]
        elsif @resolution.eql?('720p')
            @resolution = [1280, 720]
        else
            @resolution = [1920, 1080]
        end
        return @resolution
    end

    def create_title_image
        begin
            canvas = Image.new(self.resolution[0], self.resolution[1]) do |image_attribute|
                image_attribute.background_color= "Transparent"
            end

            text = Draw.new
            text.annotate(canvas, 0, 0, 620, -240, @title) do
                self.gravity = WestGravity
                self.pointsize = 50
                self.font_weight = BoldWeight
                self.font = "sans-serif"
                self.fill = "#{@text_color}"
            end
            canvas.write('/tmp/openalpha01-youtube.png')
        rescue => image_error
            raise "ERROR - Failed to create title image template:\n#{image_error}\n#{image_error.backtrace.join("\n")}"
        end
    end
end

