$:.unshift(File.dirname(__FILE__)) unless
    $:.include?(File.dirname(__FILE__)) || $:.include?(File.expand_path(File.dirname(__FILE__)))

require 'openalpha01_youtube/action/editor'
require 'openalpha01_youtube/action/transcode'
require 'openalpha01_youtube/action/image_title'
require 'openalpha01_youtube/youtube'


