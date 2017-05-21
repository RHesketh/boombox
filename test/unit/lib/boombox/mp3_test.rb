require "./test/test_helper"

describe MP3 do
  describe "#SAMPLES_PER_FRAME" do
    it "Returns 1152, the hardcoded number of samples in an MP3 frame" do
      assert_equal 1152, MP3::SAMPLES_PER_FRAME
    end
  end
end