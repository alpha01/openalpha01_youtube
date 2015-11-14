
require 'spec_helper'
require 'openalpha01_youtube/action/transcode'

module OpenAlpha01YouTube
  describe Transcode do
    describe "Encoder Software." do
      it "Checks if ffmpeg or avconv is installed." do
        ffmpeg_check = Transcode.ffmpeg
	expect(ffmpeg_check).not_to be false
      end
    end
  end
end
