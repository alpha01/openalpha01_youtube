
require 'spec_helper'
require 'openalpha01_youtube/action/notifications'

module OpenAlpha01YouTube
  describe Notifications do
    describe "YouTube API check." do
      it "Checks if we're able to connect to YouTube's API" do
        youtube_check = YouTube.connect
	expect(youtube_check.id).to match(/[0-9]+/)
      end
    end
  end
end
