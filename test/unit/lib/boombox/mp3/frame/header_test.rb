require "./test/test_helper"
require "./test/support/frame_data"

module Boombox
  module MP3
    describe Frame::Header do
      describe "Class Methods" do
        context "MPEG Version 1" do
          describe "#frame_length_in_bytes" do
            it "Returns the length of the passed-in frame in bytes" do
              bit_rate = 192000
              sample_rate = 44100
              padding = 1

              expected = BITS_PER_SAMPLE * bit_rate / sample_rate + padding
              actual = Frame::Header.frame_length_in_bytes(Test::FrameData::MPEGv1.valid_header)

              assert_equal expected, actual
            end
          end

          describe "#bit_rate" do
            it "Returns the bit rate of the passed-in frame in bytes" do
              expected = 192000
              actual = Frame::Header.bit_rate(Test::FrameData::MPEGv1.valid_header)

              assert_equal expected, actual
            end
          end

          describe "#sample_rate" do
            it "Returns the sample rate of the passed-in frame in bytes" do
              expected = 44100
              actual = Frame::Header.sample_rate(Test::FrameData::MPEGv1.valid_header)

              assert_equal expected, actual
            end
          end

          describe "#padding" do
            it "Returns the padding bit of the passed-in frame in bytes" do
              expected = 1
              actual = Frame::Header.padding(Test::FrameData::MPEGv1.valid_header)

              assert_equal expected, actual
            end
          end
        end

        context "MPEG Version 2" do
          describe "#frame_length_in_bytes" do
            it "Returns the length of the passed-in frame in bytes" do
              bit_rate = 128000
              sample_rate = 22050
              padding = 1

              expected = BITS_PER_SAMPLE * bit_rate / sample_rate + padding
              actual = Frame::Header.frame_length_in_bytes(Test::FrameData::MPEGv2.valid_header)

              assert_equal expected, actual
            end
          end

          describe "#bit_rate" do
            it "Returns the bit rate of the passed-in frame in bytes" do
              expected = 128000
              actual = Frame::Header.bit_rate(Test::FrameData::MPEGv2.valid_header)

              assert_equal expected, actual
            end
          end

          describe "#sample_rate" do
            it "Returns the sample rate of the passed-in frame in bytes" do
              expected = 22050
              actual = Frame::Header.sample_rate(Test::FrameData::MPEGv2.valid_header)

              assert_equal expected, actual
            end
          end

          describe "#padding" do
            it "Returns the padding bit of the passed-in frame in bytes" do
              expected = 1
              actual = Frame::Header.padding(Test::FrameData::MPEGv2.valid_header)

              assert_equal expected, actual
            end
          end
        end
      end
    end
  end
end