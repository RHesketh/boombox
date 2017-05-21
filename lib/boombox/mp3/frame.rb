require_relative 'frame/header'

module Boombox
  module MP3
    class Frame
      attr_reader :bytes

      def initialize
        @bytes = []
      end

      def <<(new_bytes)
        @bytes = @bytes.concat(new_bytes)
      end

      def invalid?
        return true if Header.invalid?(@bytes[0..3])
        return false
      end

      def header_complete?
        return true if @bytes.length > 3
        return false
      end

      def clear_bytes
        @bytes = []
      end
    end
  end
end