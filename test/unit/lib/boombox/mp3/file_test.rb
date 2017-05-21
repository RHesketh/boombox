require "./test/test_helper"

module Boombox
  module MP3
    describe File do
      describe "Boombox::MP3::File.new(frame_data)" do
        it "Creates a new MP3 file data object" do
          frame_data = []
          MP3::File.new(frame_data)
        end
      end

      describe "Instance Methods" do
        describe "#bit_rate" do
        end

        describe "#sample_rate" do
        end
        describe "#frames" do
        end
      end
    end
  end
end