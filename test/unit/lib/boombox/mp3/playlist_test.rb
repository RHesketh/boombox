require "./test/test_helper"

module Boombox
  module MP3
    describe Playlist do

      describe "Public Methods"
        describe "#add(mp3_file)" do
          it "Adds an MP3 file to the playlist" do
            skip

            playlist = Playlist.new
            mp3 = mock("Boombox::MP3::File")
            playlist.add(mp3)

            assert_equal playlist.songs.count, 1
          end
        end

        describe "#sample" do
          it "Returns a file from the playlist and removes it" do
            skip
          end
        end
      end

      describe "Public Attributes" do
        describe "songs"
          it "Returns the array of songs that are on the playlist" do
            skip

            assert Playlist.instance_attributes.include? :songs
          end
        end
      end
    end
  end
end