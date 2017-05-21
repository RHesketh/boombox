module Boombox
  module MP3
    class Frame
      class Validation
        def self.invalid?(frame_bytes)
          bits = frame_bytes[0..3].map{|b| '%0*b' % [8,b]}.join

          return true if frame_sync_head_invalid? bits
          return true if frame_sync_tail_invalid? bits
          return true if is_wrong_mpeg_version? bits
          return true if is_wrong_mpeg_layer? bits
          return true if bit_rate_is_free? bits
          return true if bit_rate_error? bits
          return true if reserved_sample_rate? bits

          return false
        end

        private

        def self.frame_sync_head_invalid?(bits)
          return false unless bits_present?(bits, (0..7))
          return false if bits[0..7] == "11111111"
          return true
        end

        def self.frame_sync_tail_invalid?(bits)
          return false unless bits_present?(bits, (8..10))
          return false if bits[8..10] == "111"
          return true
        end

        def self.is_wrong_mpeg_version?(bits)
          return false unless bits_present?(bits, (11..12))
          return true if bits[11..12] == "00" # MPEG version "2.5"
          return true if bits[11..12] == "01" # Reserved
          return false
        end

        def self.is_wrong_mpeg_layer?(bits)
          return false unless bits_present?(bits, (13..14))
          return false if bits[13..14] == "01" # Layer III
          return true
        end

        def self.bit_rate_is_free?(bits)
          return false unless bits_present?(bits, (16..19))
          return true if bits[16..19] == "0000"  # "Free" bit rate i.e. undefined
          return false
        end

        def self.bit_rate_error?(bits)
          return false unless bits_present?(bits, (16..19))
          return true if bits[16..19] == "1111"   # Bit rate error
          return false
        end

        def self.reserved_sample_rate?(bits)
          return false unless bits_present?(bits, (20..21))
          return true if bits[20..21] == "11"  # 11 = reserved
          return false
        end

        def self.bits_present?(bits, range)
          return false if bits[range].nil?
          return false if bits[range].length < range.size
          return true
        end
      end
    end
  end
end