require "./test/test_helper"
require "./test/support/frame_data"

module Boombox
  module MP3
    describe Frame::Validation do
      describe "Class Methods" do
        describe "#invalid?(bytes)" do
          it "Returns false when a valid frame header is passed in" do
            assert_equal false, Frame::Validation.invalid?(Test::FrameData.valid_header)
          end

          it "Returns true when an invalid frame header is passed in" do
            assert_equal true, Frame::Validation.invalid?(Test::FrameData.frame_sync_missing)
            assert_equal true, Frame::Validation.invalid?(Test::FrameData.wrong_version)
            assert_equal true, Frame::Validation.invalid?(Test::FrameData.wrong_layer)
            assert_equal true, Frame::Validation.invalid?(Test::FrameData.no_bitrate_set)
            assert_equal true, Frame::Validation.invalid?(Test::FrameData.bit_rate_error)
            assert_equal true, Frame::Validation.invalid?(Test::FrameData.reserved_sample_rate)
          end
        end
      end
    end
  end
end