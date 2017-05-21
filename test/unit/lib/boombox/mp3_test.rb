require "./test/test_helper"

module Boombox
  describe MP3 do
    describe "#SAMPLES_PER_FRAME" do
      it "Returns 1152, the hardcoded number of samples in an MP3 frame" do
        assert_equal 1152, MP3::SAMPLES_PER_FRAME
      end
    end

    describe "#BITS_PER_SAMPLE" do
      it "Returns 144, the hardcoded number of bits in an MP3 sample" do
        assert_equal 144, MP3::BITS_PER_SAMPLE
      end
    end
  end
end