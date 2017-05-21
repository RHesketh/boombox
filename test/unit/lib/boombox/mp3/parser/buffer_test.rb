require "./test/test_helper"

module Boombox
  module MP3
    describe Parser::Buffer do
      describe "#initialize(io_stream)" do
        before do
          mock_io = ("IO")
          @buffer = Parser::Buffer.new(mock_io)
        end

        it "Sets the frame_marker to 0 by default" do
          assert_equal 0, @buffer.frame_marker
        end

        it "Takes a base IO stream" do

        end
      end

      describe "Object Attributes" do
        it "Should have the following attributes" do
          assert Parser::Buffer.instance_methods.include? :frame_marker
          assert Parser::Buffer.instance_methods.include? :pos
        end
      end

      describe "Public Methods" do
        describe "#read(number_of_bytes = 1)" do
          context "Reading a single byte" do
            before do
              file = StringIO.new("A")
              @buffer = Parser::Buffer.new(file)
              @output = @buffer.read
            end

            it "Returns a byte" do
              assert_equal 1, @output.length
              assert_equal Fixnum, @output[0].class
              assert_equal "A", @output.pack('c*')
            end

            it "Advances the position counter" do
              assert_equal 1, @buffer.pos
            end

            it "Does not change the frame marker" do
              assert_equal 0, @buffer.frame_marker
            end
          end

          context "Reading multiple bytes" do
            before do
              file = StringIO.new("ABCDE")
              @buffer = Parser::Buffer.new(file)
              @output = @buffer.read(3)
            end

            it "Returns multiples bytes" do
              assert_equal 3, @output.length
              @output.each { |byte| assert_equal(Fixnum, byte.class) }
              assert_equal "ABC", @output.pack('c*')
            end

            it "Advances the position counter" do
              assert_equal 3, @buffer.pos
            end

            it "Does not change the frame marker" do
              assert_equal 0, @buffer.frame_marker
            end
          end
        end

        describe "#advance" do
          before do
            file = StringIO.new("ABCDE")
            @buffer = Parser::Buffer.new(file)
            @output = @buffer.read(3)
          end

          it "Records the current position as the new frame marker" do
            old_frame_marker = @buffer.frame_marker
            refute_equal @buffer.pos, @buffer.frame_marker  # Confidence check

            @buffer.advance

            assert_equal @buffer.pos, @buffer.frame_marker
            refute_equal old_frame_marker, @buffer.frame_marker
          end
        end

        describe "#reset" do
          before do
            file = StringIO.new("ABCDE")
            @buffer = Parser::Buffer.new(file)
            @output = @buffer.read(3)
          end

          it "Resets the buffer position to the frame marker" do
            old_pos = @buffer.pos
            refute_equal @buffer.pos, @buffer.frame_marker  # Confidence check

            @buffer.reset

            assert_equal @buffer.pos, @buffer.frame_marker
            refute_equal old_pos, @buffer.pos
          end
        end

        describe "#eof?" do
          context "When there is still data to be read" do
            before do
              file = StringIO.new("A")
              @buffer = Parser::Buffer.new(file)
            end

            it "Returns false" do
              assert_equal false, @buffer.eof?
            end
          end

          context "When there is no more data to be read" do
            before do
              file = StringIO.new("A")
              @buffer = Parser::Buffer.new(file)
              @buffer.read
            end

            it "Returns true" do
              assert_equal true, @buffer.eof?
            end
          end
        end
      end
    end
  end
end