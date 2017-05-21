require "./test/test_helper"

module Boombox
  module MP3
    describe Parser do
      describe "Parser.load(mp3_file)" do
        it "Returns a parsed MP3 file" do
          file = Parser.load("file-location-on-disk")

          assert_equal MP3::File, file.class
        end
      end
    end
  end
end