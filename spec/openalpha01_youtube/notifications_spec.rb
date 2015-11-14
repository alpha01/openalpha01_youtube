
require 'spec_helper'
require 'openalpha01_youtube/action/notifications'

module OpenAlpha01YouTube
  describe Notifications do
    describe " Bitly API." do
      it "Checks if we're able to connect to Bitly's API" do
        bitly_check = Notifications.bitly_connect
	expect(bitly_check).not_to be false
      end
    end
    describe "Twitter API." do
      it "Checks if we're able to connect to Twitter's API" do
        twitter_check = Notifications.twitter_connect
        expect(twitter_check).not_to be false
      end
    end
  end
end
