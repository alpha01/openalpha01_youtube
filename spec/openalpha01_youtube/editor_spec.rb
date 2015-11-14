
require 'spec_helper'
require 'openalpha01_youtube/action/editor'

module OpenAlpha01YouTube
  describe Editor do
    describe "Melt Software." do
      it "Checks if melt installed." do
        melt_check = Editor.melt
	expect(melt_check).not_to be false
      end
    end
  end
end
