require "./test/test_helper"
require "./test/support/frame_data"

module Boombox
  module MP3
    describe Frame::Validation do
      describe "Class Methods" do
        describe "#invalid?(bytes)" do
          context "MPEGv1 Headers" do
            it "Returns false when a valid frame header is passed in" do
              assert_equal false, Frame::Validation.invalid?(Test::FrameData::MPEGv1.valid_header)
            end

            it "Returns true when an invalid frame header is passed in" do
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv1.frame_sync_missing)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv1.wrong_version)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv1.wrong_layer)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv1.no_bitrate_set)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv1.bit_rate_error)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv1.reserved_sample_rate)
            end
          end

          context "MPEGv2 Headers" do
            it "Returns false when a valid frame header is passed in" do
              assert_equal false, Frame::Validation.invalid?(Test::FrameData::MPEGv2.valid_header)
            end

            it "Returns true when an invalid frame header is passed in" do
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv2.frame_sync_missing)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv2.wrong_version)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv2.wrong_layer)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv2.no_bitrate_set)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv2.bit_rate_error)
              assert_equal true, Frame::Validation.invalid?(Test::FrameData::MPEGv2.reserved_sample_rate)
            end
          end
        end
      end
    end
  end
end