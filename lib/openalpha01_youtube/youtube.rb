
require 'yt'
require_relative 'config'

module OpenAlpha01YouTube
  class YouTube
    def initialize
      self.connect
    end

    def self.connect
      Yt.configure do |config|
        config.client_id = OpenAlpha01YouTube::Config.options['youtube_client_id']
        config.client_secret = OpenAlpha01YouTube::Config.options['youtube_client_secret']
        config.log_level = :debug
      end
      begin
        client = Yt::Account.new refresh_token: OpenAlpha01YouTube::Config.options['youtube_client_refresh_token']
      rescue => connection_error
        puts "Failed to connect to YouTube!"
        exit 1
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
end

puts OpenAlpha01YouTube::YouTube.connect
#puts test.options.inspect
