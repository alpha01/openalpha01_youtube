
require 'bitly'
require 'twitter'
require "#{File.join(File.dirname(__FILE__), '..')}/config"

module OpenAlpha01YouTube
  class Notifications
    def initialize(message, link)
      @message = message
      @link = link
      self.bitly_connect
      self.twitter_connect
    end

    def self.bitly_connect
      begin
        Bitly.use_api_version_3
        Bitly.configure do |config|
          config.api_version = 3
          config.access_token = OpenAlpha01YouTube::Config.options['bitly_access_token']
        end
        @bitly = Bitly.client
	@bitly.info('test')
      rescue => error_msg
        puts "Unable to connect to bit.ly"
	#puts "#{error_msg}\n#{error_msg.backtrace.join("\n")}"
        return false
      end
    end

    def bitly_send
      t = @bitly.shorten(@link)
      return t.short_url
    end

    def self.twitter_connect
      begin
        @twitter = Twitter::REST::Client.new do |config|
          config.consumer_key        = OpenAlpha01YouTube::Config.options['twitter_consumer_key']
          config.consumer_secret     = OpenAlpha01YouTube::Config.options['twitter_consumer_secret']
          config.access_token        = OpenAlpha01YouTube::Config.options['twitter_access_token']
          config.access_token_secret = OpenAlpha01YouTube::Config.options['twitter_access_token_secret']
        end
        @twitter.user("alpha01") # query any user, just need to make sure we have a valid token.
      rescue => error_msg
        puts "Unable to connect to Twitter."
        #puts "#{error_msg}\n#{error_msg.backtrace.join("\n")}"
        return false
      end
    end

    def twitter_send
      @twitter.update("#{@message} #{self.bitly_send}")
    end

    # TO DO
    def facebook
      return false
    end
  end
end

#test = OpenAlpha01YouTube::Notifications.new('openalpha01_youtube test', 'https://www.rubysecurity.org')
#test.twitter_send
