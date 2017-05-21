require "./test/test_helper"

module Boombox
  module MP3
    describe Parser do
      describe "Parser.load_from_file(mp3_file)" do
        it "Returns a parsed MP3 file" do
          skip
          file = Parser.load_from_file("file-location-on-disk")

          assert_equal MP3::File, file.class
        end
      end
    end
  end
end