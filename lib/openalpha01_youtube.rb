$:.unshift(File.dirname(__FILE__)) unless
    $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'openalpha01_youtube/transcode.rb'
require 'openalpha01_youtube/image_title.rb'
require 'openalpha01_youtube/youtube.rb'



class OpenAlpha01Transcode < Transcode; end
class OpenAlpha01Image < Image_Title; end
class OpenAlpha01YouTube < YouTube; end
