require "./test/test_helper"

# A class for reading MP3 frame data and relaying it back to an individual user.
# The MP3::Player class is responsible for the buffering and delivery of MP3 data
# to a single listener. If there are multiple people listening at once, each should
# have their own MP3::Player instance.
module Boombox
  module MP3
    describe Player do
      describe "Player.new(mp3)" do
        it "Returns without error" do
          skip
        end
      end

      describe "#start" do
        it "Returns without an error" do
          refute_raises do
            skip
          end
        end
      end

      describe "#current_time" do
        it "Returns the amount of time that has passed since #start was last called"
      end

      describe "#duration" do
        it "returns the total duration of the MP3 currently being played"
      end

      describe "#current_sample" do
        it "Returns the current sample based on the amount of time that has passed" do
          skip
        end
      end

      describe "#listen" do
        context "When the MP3 has been started" do
          context "and we are at the point in time where new data is ready to be sent" do
            it "Returns the latest MP3 frame(s)"
          end

          context "but we are not yet ready to send more MP3 data" do
            it "Returns nil"
          end
        end
      end
    end
  end
end