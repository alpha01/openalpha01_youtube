
require 'rmagick'
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

