require "./test/test_helper"

module Boombox
  module MP3
    describe Frame do
      describe "initialize" do
        it "Sets bytes to be an empty array" do
          frame = Frame.new
          assert_equal [], frame.bytes
        end
      end

      describe "Instance Methods" do
        it "Should have the following properties" do
          assert Frame.instance_methods.include? :bytes
        end

        describe "#<<(byte_array)" do
          it "Adds the given bytes to the raw frame buffer" do
            frame = Frame.new
            frame << [65]

            assert_equal [65], frame.bytes
          end
        end

        describe "#header_complete?" do
          context "When the header is finished" do
            it "returns true" do
              frame = Frame.new
              frame << [0xFF,0xFB, 0xB0, 0x00]

              assert_equal true, frame.header_complete?
            end
          end

          context "Header is not finished" do
            it "returns false" do
              frame = Frame.new
              frame << [0xFF,0xFB]

              assert_equal false, frame.header_complete?
            end
          end
        end

        describe "#invalid?" do
          context "Valid frames" do
            context "When the FrameHeader is valid" do
              it "returns false" do
                Frame::Validation.expects(:invalid?).returns(false)
                frame = Frame.new

                assert_equal false, frame.invalid?
              end
            end
          end

          context "Invalid frames" do
            context "When the FrameHeader is not valid" do
              it "returns true" do
                Frame::Validation.expects(:invalid?).returns(true)
                frame = Frame.new

                assert_equal true, frame.invalid?
              end
            end
          end
        end

        describe "#header_bytes" do
          before do
            bytes = [1,2,3,4,5]
            @frame = Frame.new
            @frame << bytes
          end

          it "Returns the bytes that make up the frame header" do
            assert_equal [1,2,3,4], @frame.header_bytes
          end
        end

        describe "#byte_length" do
          before do
            @frame = Frame.new
          end

          it "Uses Frame::Header to find the byte length" do
            Frame::Header.expects(:frame_length_in_bytes).with(@frame.bytes).returns(777)

            assert_equal 777, @frame.byte_length
          end
        end

        describe "#clear_bytes" do
          before do
            @frame = Frame.new
            @frame << [0xFF,0xFB]

            @cleared = @frame.clear_bytes
          end

          it "Gets rid of everything in the bytes array" do
            assert_equal [], @frame.bytes
          end

          it "Returns the number of bytes cleared" do
            assert_equal 2, @cleared
          end
        end
      end
    end
  end
end