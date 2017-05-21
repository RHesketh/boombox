module Boombox
  module MP3
    class Parser
      class Buffer
        attr_reader :frame_marker
        def pos; @stream.pos; end

        def initialize(stream)
          @frame_marker = 0
          @stream = stream
        end

        def read(number_of_bytes=1)
          @stream.read(number_of_bytes).bytes
        end

        def advance
          @frame_marker = @stream.pos
        end

        def reset
          @stream.pos = @frame_marker
        end

        def eof?
          @stream.eof?
        end
      end
    end
  end
end