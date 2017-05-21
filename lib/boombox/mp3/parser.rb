require_relative 'parser/seekable_buffer'

module Boombox
  module MP3
    class Parser
      def self.load_from_file(mp3_file)
        mp3_data = ::File.open(mp3_file)
        buffer = SeekableBuffer.new(mp3_data)
        frame_data = parse_frames_from_data(buffer)

        MP3::File.new(frame_data)
      end

      private

      def self.parse_frames_from_data(buffer)
        frames = []

        until buffer.eof?
          frame = Frame.new

          until frame.header_complete? || buffer.eof?
            frame << buffer.read

            if frame.invalid?
              buffer.reset_position
              frame.clear_bytes
            end
          end

          unless buffer.eof?
            buffer.reset_position
            frame << buffer.read(frame.byte_length)
            buffer.advance_marker
            frames << frame
          end
        end

        frames
      end
    end
  end
end