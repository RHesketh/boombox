require "./test/test_helper"

module Boombox
  module MP3
    describe Parser do
      describe "Parser.load_from_file(mp3_file)" do
        it "Returns a parsed MP3 file" do
          @file_location = "file-location-on-disk"
          mock_data = mock("IO")
          mock_buffer = mock("Boombox::MP3::Parser::SeekableBuffer")
          ::File.expects(:open).with(@file_location).returns(mock_data)
          Parser::SeekableBuffer.expects(:new).with(mock_data).returns(mock_buffer)
          mock_buffer.expects(:eof?).returns true
          file = Parser.load_from_file(@file_location)

          assert_equal MP3::File, file.class
        end
      end
    end
  end
end